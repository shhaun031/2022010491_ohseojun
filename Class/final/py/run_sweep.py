import os
import shutil
import subprocess

# --- 설정 부분 ---
mesh_filename = "retry.su2"       # 격자 파일 이름
config_filename = "turb_NACA0012.cfg" # 설정 파일 이름
start_angle = 0
end_angle = 20
step_angle = 2
       
su2_path = r"C:\Users\shaun\Desktop\py\SU2_CFD.exe"
run_command = f'mpiexec -n 10 "{su2_path}"'
# --- 메인 루프 ---
for angle in range(start_angle, end_angle + 1, step_angle):
    folder_name = f"AoA_{angle}"
    print(f"--------------------------------------")
    print(f"Setting up case for AoA = {angle} deg in folder '{folder_name}'")
    
    # 1. 폴더 생성
    if not os.path.exists(folder_name):
        os.makedirs(folder_name)
    
    # 2. 격자 파일 복사
    shutil.copy(mesh_filename, os.path.join(folder_name, mesh_filename))
    
    # 3. 설정 파일 읽기 및 AOA 수정 후 저장
    with open(config_filename, 'r') as f:
        lines = f.readlines()
        
    new_config_path = os.path.join(folder_name, config_filename)
    with open(new_config_path, 'w') as f:
        for line in lines:
            # AOA 파라미터 찾아서 값 변경 (공백 제거 후 비교)
            if line.strip().startswith("AOA="):
                f.write(f"AOA= {angle}.0\n")
            else:
                f.write(line)
    
    # 4. 해석 실행
    print(f"Running SU2 for {folder_name}...")
    try:
        # 해당 폴더로 작업 디렉토리를 변경하여 명령어 실행
        # stdout과 stderr를 파일로 저장하고 싶으면 open()을 사용하여 연결 가능
        subprocess.run(f"{run_command} {config_filename}", shell=True, cwd=folder_name, check=True)
        print(f"Completed AoA = {angle}")
    except subprocess.CalledProcessError as e:
        print(f"Error occurred while running AoA = {angle}")
        print(e)

print("All cases processed.")