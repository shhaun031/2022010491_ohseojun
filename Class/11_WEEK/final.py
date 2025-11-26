import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# 1. 실험 데이터 정의 (이미지에서 추출)
# x/c 위치
exp_xc = [0.005, 0.025, 0.050, 0.075, 0.100, 0.150, 0.200, 0.300, 0.400, 0.500, 
          0.600, 0.700, 0.800, 0.900, 0.960]

# 각 섹션별 데이터 {Section Index: {'upper': [], 'lower': []}}
# Sec1 (r/R=0.50) ~ Sec5 (r/R=0.96)
exp_data = {
    0: { # Sec 1
        'upper': [-0.87, -1.41, -1.63, -1.54, -1.43, -1.25, -1.02, -0.96, -0.92, -0.88, -0.73, -0.56, -0.34, -0.10, -0.01],
        'lower': [0.90, 0.65, 0.42, 0.31, 0.21, 0.09, 0.03, -0.06, -0.09, -0.10, -0.10, -0.07, -0.01, 0.07, 0.10]
    },
    1: { # Sec 2
        'upper': [-0.66, -1.09, -1.33, -1.40, -1.37, -1.24, -1.05, -0.92, -0.90, -0.85, -0.72, -0.57, -0.38, -0.10, -0.01],
        'lower': [1.05, 0.70, 0.44, 0.30, 0.20, 0.07, 0.00, -0.08, -0.10, -0.10, -0.11, -0.08, -0.03, 0.08, 0.10]
    },
    2: { # Sec 3
        'upper': [-0.52, -0.88, -1.14, -1.30, -1.30, -1.20, -1.05, -0.94, -0.93, -0.91, -0.85, -0.70, -0.48, -0.15, -0.01],
        'lower': [1.12, 0.78, 0.53, 0.38, 0.26, 0.12, 0.02, -0.07, -0.11, -0.12, -0.10, -0.08, -0.03, 0.08, 0.12]
    },
    3: { # Sec 4
        'upper': [-0.42, -0.71, -0.95, -1.09, -1.13, -1.10, -0.99, -0.87, -0.76, -0.66, -0.52, -0.41, -0.31, -0.11, -0.01],
        'lower': [1.10, 0.81, 0.58, 0.44, 0.33, 0.18, 0.08, -0.04, -0.07, -0.09, -0.09, -0.05, -0.01, 0.07, 0.10]
    },
    4: { # Sec 5
        'upper': [-0.28, -0.50, -0.64, -0.70, -0.71, -0.67, -0.60, -0.44, -0.32, -0.21, -0.15, -0.10, -0.08, -0.02, 0.00],
        'lower': [1.05, 0.80, 0.56, 0.42, 0.30, 0.17, 0.07, -0.02, -0.05, -0.07, -0.05, -0.03, 0.00, 0.04, 0.06]
    }
}

file_paths = ['sec1.csv', 'sec2.csv', 'sec3.csv', 'sec4.csv', 'sec5.csv']
section_names = ['Section 1', 'Section 2', 'Section 3', 'Section 4', 'Section 5']

# 엑셀 저장을 위한 Writer 생성
output_excel = "processed_cp_data.xlsx"
writer = pd.ExcelWriter(output_excel, engine='openpyxl')

# 그래프 설정
fig, axes = plt.subplots(2, 3, figsize=(18, 10))
axes = axes.flatten()

for i, file_path in enumerate(file_paths):
    # --- CFD 데이터 처리 ---
    df = pd.read_csv(file_path)
    x_raw = df['Points_1'].values # Chordwise
    y_raw = df['Points_0'].values # Thickness
    cp = df['Pressure_Coefficient'].values
    
    # LE, TE 식별 및 코드 길이 계산
    idx_min = np.argmin(x_raw)
    idx_max = np.argmax(x_raw)
    le_pt = np.array([x_raw[idx_min], y_raw[idx_min]])
    te_pt = np.array([x_raw[idx_max], y_raw[idx_max]])
    chord_vec = te_pt - le_pt
    chord_len = np.linalg.norm(chord_vec)
    
    # Upper / Lower 분리 및 정규화
    upper_data = []
    lower_data = []
    
    for j in range(len(x_raw)):
        pt = np.array([x_raw[j], y_raw[j]])
        vec_pt = pt - le_pt
        
        # 정규화 (x/c)
        x_c = np.dot(vec_pt, chord_vec) / (chord_len ** 2)
        
        # Upper/Lower 판별 (Cross Product)
        cross_prod = chord_vec[0] * vec_pt[1] - chord_vec[1] * vec_pt[0]
        
        if cross_prod >= 0:
            upper_data.append((x_c, cp[j]))
        else:
            lower_data.append((x_c, cp[j]))
            
    # Upper/Lower 검증 (Lower Cp 확인)
    min_cp_upper = min([d[1] for d in upper_data]) if upper_data else 0
    min_cp_lower = min([d[1] for d in lower_data]) if lower_data else 0
    
    # 만약 분류가 반대로 되었다면 스왑
    if min_cp_upper > min_cp_lower:
        upper_data, lower_data = lower_data, upper_data

    # 정렬
    upper_data.sort(key=lambda x: x[0])
    lower_data.sort(key=lambda x: x[0])
    
    # 리스트 분리
    ux, ucp = zip(*upper_data) if upper_data else ([], [])
    lx, lcp = zip(*lower_data) if lower_data else ([], [])
    
    # --- 엑셀 저장용 데이터 프레임 생성 ---
    # 길이가 다를 수 있으므로 최대 길이에 맞춤
    max_len = max(len(ux), len(lx))
    
    # 길이 맞추기 (빈 값은 NaN)
    ux_list = list(ux) + [np.nan] * (max_len - len(ux))
    ucp_list = list(ucp) + [np.nan] * (max_len - len(ucp))
    lx_list = list(lx) + [np.nan] * (max_len - len(lx))
    lcp_list = list(lcp) + [np.nan] * (max_len - len(lcp))
    
    df_save = pd.DataFrame({
        'Upper_x/c': ux_list, 'Upper_Cp': ucp_list,
        'Lower_x/c': lx_list, 'Lower_Cp': lcp_list
    })
    
    df_save.to_excel(writer, sheet_name=f'Sec{i+1}', index=False)

    # --- 그래프 그리기 ---
    ax = axes[i]
    
    # 1. CFD 결과 (선)
    ax.plot(ux, ucp, 'r-', label='CFD Upper', linewidth=1.5)
    ax.plot(lx, lcp, 'b-', label='CFD Lower', linewidth=1.5)
    
    # 2. 실험 결과 (점)
    if i in exp_data:
        curr_exp = exp_data[i]
        ax.plot(exp_xc, curr_exp['upper'], 'ro', fillstyle='none', label='Exp Upper', markersize=6, markeredgewidth=1.5)
        ax.plot(exp_xc, curr_exp['lower'], 'bo', fillstyle='none', label='Exp Lower', markersize=6, markeredgewidth=1.5)

    ax.invert_yaxis() # Cp 축 반전
    ax.set_title(f'{section_names[i]} Comparison')
    ax.set_xlabel('x/c')
    ax.set_ylabel('Cp')
    ax.grid(True, linestyle=':', alpha=0.6)
    
    # 범례 설정
    ax.legend(loc='lower right', fontsize='small')

# 마지막 서브플롯 빈칸 처리
axes[5].axis('off')

# 파일 저장 및 닫기
writer.close()
plt.tight_layout()
plt.savefig('cp_comparison_plot.png', dpi=300)
plt.show()

print(f"엑셀 파일이 저장되었습니다: {output_excel}")