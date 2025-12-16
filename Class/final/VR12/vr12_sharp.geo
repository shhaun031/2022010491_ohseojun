// -----------------------------------------------------------
// VR-12 Final Project Mesh (Fan + Long Farfield)
// -----------------------------------------------------------

// 1. 기본 설정 (Scale & Constants)
lc = 1.0;
dx = 0.0; // LE를 (0,0)에 배치

// [수정됨] 파필드 크기 확장 (20 -> 50)
R_domain = 50.0;    // 반경 50배 (위/아래/앞)
L_wake = 50.0;      // 후류 길이 50배

// [중요] 격자 점 개수 설정 (총 401 x 145 타겟)
// 설명: (후류 100 + 에어포일 200 + 앞부분 100) = 전체 400 구간 (401개 점)
// 수직 방향: 145개 점
N_Wake = 100;       
N_Chord = 200;      // 에어포일 위/아래 각각
N_Nose = 100;       // 앞부분 부채꼴 (90도 아크)
N_Normal = 145;     // 벽면에서 원방까지 층 수

// 벽면 첫 격자 높이 제어 (y+ ~ 1)
// Progression 값을 통해 벽면은 촘촘하고 멀어질수록 커지게 설정
Prog_Wall = 1.05;   // 1.05 ~ 1.08 사이 추천

// -----------------------------------------------------------
// 2. 형상 점 생성 (Points)
// -----------------------------------------------------------

// [Airfoil Points] - VR12 Sharp TE
Point(1) = {1.0 + dx, 0.0, 0, lc}; // TE

// Lower Surface
Point(2) = {0.995 + dx, -0.00253, 0, lc}; Point(3) = {0.99 + dx, -0.00356, 0, lc};
Point(4) = {0.98 + dx, -0.00522, 0, lc};  Point(5) = {0.97 + dx, -0.00678, 0, lc};
Point(6) = {0.955 + dx, -0.00877, 0, lc}; Point(7) = {0.935 + dx, -0.01084, 0, lc};
Point(8) = {0.91 + dx, -0.01332, 0, lc};  Point(9) = {0.88 + dx, -0.01605, 0, lc};
Point(10) = {0.845 + dx, -0.01852, 0, lc}; Point(11) = {0.81 + dx, -0.02071, 0, lc};
Point(12) = {0.77 + dx, -0.0229, 0, lc};  Point(13) = {0.73 + dx, -0.02482, 0, lc};
Point(14) = {0.69 + dx, -0.02642, 0, lc}; Point(15) = {0.65 + dx, -0.02778, 0, lc};
Point(16) = {0.6 + dx, -0.02907, 0, lc};  Point(17) = {0.55 + dx, -0.03, 0, lc};
Point(18) = {0.5 + dx, -0.03065, 0, lc};  Point(19) = {0.45 + dx, -0.031, 0, lc};
Point(20) = {0.4 + dx, -0.0311, 0, lc};   Point(21) = {0.35 + dx, -0.0308, 0, lc};
Point(22) = {0.3 + dx, -0.0301, 0, lc};   Point(23) = {0.25 + dx, -0.0291, 0, lc};
Point(24) = {0.2 + dx, -0.0276, 0, lc};   Point(25) = {0.15 + dx, -0.02555, 0, lc};
Point(26) = {0.1185 + dx, -0.02385, 0, lc}; Point(27) = {0.0924 + dx, -0.0221, 0, lc};
Point(28) = {0.07245 + dx, -0.0205, 0, lc}; Point(29) = {0.0569 + dx, -0.0189, 0, lc};
Point(30) = {0.04449 + dx, -0.0174, 0, lc}; Point(31) = {0.0343 + dx, -0.01605, 0, lc};
Point(32) = {0.02615 + dx, -0.0148, 0, lc}; Point(33) = {0.01955 + dx, -0.0135, 0, lc};
Point(34) = {0.01465 + dx, -0.0123, 0, lc}; Point(35) = {0.011 + dx, -0.01095, 0, lc};
Point(36) = {0.0086 + dx, -0.00983, 0, lc}; Point(37) = {0.0062 + dx, -0.0084, 0, lc};
Point(38) = {0.004 + dx, -0.00675, 0, lc};  Point(39) = {0.002 + dx, -0.0047, 0, lc};
Point(40) = {0.00055 + dx, -0.0025, 0, lc};

// LE Point (x=0)
Point(41) = {0 + dx, 0, 0, lc}; 

// Upper Surface
Point(42) = {0.00012 + dx, 0.0024, 0, lc};  Point(43) = {0.0008 + dx, 0.00621, 0, lc};
Point(44) = {0.00195 + dx, 0.00969, 0, lc}; Point(45) = {0.0034 + dx, 0.01279, 0, lc};
Point(46) = {0.0052 + dx, 0.01582, 0, lc};  Point(47) = {0.007 + dx, 0.01836, 0, lc};
Point(48) = {0.009 + dx, 0.02081, 0, lc};   Point(49) = {0.01105 + dx, 0.02306, 0, lc};
Point(50) = {0.01415 + dx, 0.0261, 0, lc};  Point(51) = {0.0186 + dx, 0.02992, 0, lc};
Point(52) = {0.0245 + dx, 0.03434, 0, lc};  Point(53) = {0.03205 + dx, 0.03921, 0, lc};
Point(54) = {0.0416 + dx, 0.04425, 0, lc};  Point(55) = {0.0535 + dx, 0.0497, 0, lc};
Point(56) = {0.0685 + dx, 0.0553, 0, lc};   Point(57) = {0.088 + dx, 0.0606, 0, lc};
Point(58) = {0.114 + dx, 0.0656, 0, lc};    Point(59) = {0.15 + dx, 0.07, 0, lc};
Point(60) = {0.2 + dx, 0.0732, 0, lc};      Point(61) = {0.25 + dx, 0.0746, 0, lc};
Point(62) = {0.3 + dx, 0.0751, 0, lc};      Point(63) = {0.35 + dx, 0.07485, 0, lc};
Point(64) = {0.4 + dx, 0.0738, 0, lc};      Point(65) = {0.45 + dx, 0.07175, 0, lc};
Point(66) = {0.5 + dx, 0.0691, 0, lc};      Point(67) = {0.55 + dx, 0.06535, 0, lc};
Point(68) = {0.6 + dx, 0.06067, 0, lc};     Point(69) = {0.65 + dx, 0.05475, 0, lc};
Point(70) = {0.69 + dx, 0.04932, 0, lc};    Point(71) = {0.73 + dx, 0.04332, 0, lc};
Point(72) = {0.77 + dx, 0.0371, 0, lc};     Point(73) = {0.81 + dx, 0.03076, 0, lc};
Point(74) = {0.845 + dx, 0.02482, 0, lc};   Point(75) = {0.88 + dx, 0.01875, 0, lc};
Point(76) = {0.91 + dx, 0.01362, 0, lc};    Point(77) = {0.935 + dx, 0.00934, 0, lc};
Point(78) = {0.955 + dx, 0.00617, 0, lc};   Point(79) = {0.97 + dx, 0.00423, 0, lc};
Point(80) = {0.98 + dx, 0.00312, 0, lc};    Point(81) = {0.99 + dx, 0.00216, 0, lc};
Point(82) = {0.995 + dx, 0.00173, 0, lc};

// [Farfield Points Construction]
xc = 0.0 + dx; 
yc = 0.0;

// Inner (LE)
Point(100) = {xc, yc, 0, lc};

// Outer Arc Points (R=50)
Point(101) = {xc, yc + R_domain, 0, lc};      // Top Shoulder (90도)
Point(102) = {xc, yc - R_domain, 0, lc};      // Bot Shoulder (-90도)
Point(103) = {xc - R_domain, yc, 0, lc};      // Inlet Nose (180도)

// Wake End Points (L=50)
Point(104) = {1.0 + dx + L_wake, yc + R_domain, 0, lc}; // Top Wake
Point(105) = {1.0 + dx + L_wake, yc - R_domain, 0, lc}; // Bot Wake
Point(106) = {1.0 + dx + L_wake, 0, 0, lc};             // Center Wake

// Main Body Corners (TE Vertical Projection)
Point(107) = {1.0 + dx, yc + R_domain, 0, lc}; // Top above TE
Point(108) = {1.0 + dx, yc - R_domain, 0, lc}; // Bot below TE


// -----------------------------------------------------------
// 3. 선 생성 (Curves & Lines)
// -----------------------------------------------------------

// A. Airfoil
Spline(1) = {41, 42:82, 1};  // Upper Surface
Spline(2) = {1, 2:40, 41};   // Lower Surface

// B. Internal Splits (블록을 나누는 기준선)
Line(3) = {41, 103};  // LE -> Inlet (정체점 라인)
Line(4) = {55, 101};  // LE -> Top (수직 분할선) - "부채꼴"의 한 변
Line(5) = {29, 102};  // LE -> Bot (수직 분할선) - "부채꼴"의 한 변

Line(6) = {1, 107};   // TE -> Top (수직선)
Line(7) = {1, 108};   // TE -> Bot (수직선)
Line(8) = {1, 106};   // TE -> Wake End (Center line)

// C. Farfield Boundaries
Circle(9) = {103, 100, 101};  // Top Nose Arc
Circle(10) = {102, 100, 103}; // Bot Nose Arc

Line(11) = {101, 107}; // Main Top Boundary
Line(12) = {107, 104}; // Wake Top Boundary
Line(13) = {104, 106}; // Outlet Upper
Line(14) = {106, 105}; // Outlet Lower
Line(15) = {105, 108}; // Wake Bot Boundary
Line(16) = {108, 102}; // Main Bot Boundary


// -----------------------------------------------------------
// 4. 격자 매핑 (Transfinite & Meshing) - [핵심 파트]
// -----------------------------------------------------------

// A. 점 개수 제어 (모든 마주보는 변의 점 개수가 같아야 함)

// 1. 수직 방향 (Normal) - 벽면에서 멀어지는 방향
// Progression 1.05~1.08을 주어 벽면 근처를 매우 촘촘하게 만듦
Transfinite Curve {3, 4, 5, 6, 7, 13, 14} = N_Normal Using Progression Prog_Wall;

// 2. 유동 방향 - Nose (부채꼴)
Transfinite Curve {9, 10} = N_Nose Using Progression 1;

// 3. 유동 방향 - Main (에어포일 & 천장/바닥)
// [중요] 에어포일 표면과 천장(Line 11, 16)의 점 개수가 정확히 일치해야 함!
Transfinite Curve {1, 2} = N_Chord Using Bump 0.2;     // 에어포일 (양끝 밀집)
Transfinite Curve {11, 16} = N_Chord Using Progression 1; // 천장/바닥 (균일)

// 4. 유동 방향 - Wake (후류)
Transfinite Curve {8, 12, 15} = N_Wake Using Progression 1.05;


// B. 블록 정의 (Surfaces)

// [Zone 1: Nose Top Fan] - 부채꼴
// 3개의 점만 지정하면(LE, Inlet, Shoulder) 자동으로 부채꼴 격자 생성됨
Curve Loop(1) = {3, 9, -4};
Plane Surface(1) = {1};
Transfinite Surface {1} = {41, 103, 101}; 

// [Zone 2: Nose Bot Fan] - 부채꼴
Curve Loop(2) = {-3, -10, -5};
Plane Surface(2) = {2};
Transfinite Surface {2} = {41, 103, 102};

// [Zone 3: Main Upper] - 직사각형
Curve Loop(3) = {4, 11, -6, -1};
Plane Surface(3) = {3};
Transfinite Surface {3} = {41, 101, 107, 1}; // 코너 지정

// [Zone 4: Main Lower] - 직사각형
Curve Loop(4) = {5, -16, -7, 2};
Plane Surface(4) = {4};
Transfinite Surface {4} = {41, 102, 108, 1}; // 코너 지정

// [Zone 5: Wake Upper] - 직사각형
Curve Loop(5) = {6, 12, 13, -8};
Plane Surface(5) = {5};
Transfinite Surface {5} = {1, 107, 104, 106}; // 코너 지정

// [Zone 6: Wake Lower] - 직사각형
Curve Loop(6) = {7, -15, -14, -8};
Plane Surface(6) = {6};
Transfinite Surface {6} = {1, 108, 105, 106}; // 코너 지정


// -----------------------------------------------------------
// 5. 마무리 (Recombine & Physical Groups)
// -----------------------------------------------------------

// 모든 삼각형을 사각형(Quad)으로 병합
Recombine Surface {1, 2, 3, 4, 5, 6};

// SU2 설정을 위한 그룹 이름 지정 (대소문자 주의)
Physical Curve("AIRFOIL") = {1, 2};
Physical Curve("FARFIELD") = {9, 10, 11, 12, 13, 14, 15, 16};
Physical Surface("FLUID") = {1, 2, 3, 4, 5, 6};

Mesh.Smoothing = 10; // 격자 품질 개선