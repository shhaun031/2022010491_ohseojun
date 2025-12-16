// -----------------------------------------------------------
// VR-12 Final Fixed Geometry
// "Mesh not showing" fix applied
// -----------------------------------------------------------

// 1. Force Mesh Visibility (메쉬 강제 표시 옵션)
Mesh.SurfaceFaces = 1; 
Mesh.Points = 0;

// 2. Points Definition
Point(1) = {0.99, 0.0021627, 0};
Point(2) = {0.98, 0.003124, 0};
Point(3) = {0.97, 0.004234, 0};
Point(4) = {0.955, 0.0061715, 0};
Point(5) = {0.935, 0.009335, 0};
Point(6) = {0.91, 0.013616, 0};
Point(7) = {0.88, 0.0187523, 0};
Point(8) = {0.845, 0.0248215, 0};
Point(9) = {0.81, 0.030763, 0};
Point(10) = {0.77, 0.037104, 0};
Point(11) = {0.73, 0.043324, 0};
Point(12) = {0.69, 0.0493227, 0};
Point(13) = {0.65, 0.05475, 0};
Point(14) = {0.6, 0.060666, 0};
Point(15) = {0.55, 0.06535, 0};
Point(16) = {0.5, 0.0691, 0};
Point(17) = {0.45, 0.07175, 0};
Point(18) = {0.4, 0.0738, 0};
Point(19) = {0.35, 0.07485, 0};
Point(20) = {0.3, 0.0751, 0};
Point(21) = {0.25, 0.0746, 0};
Point(22) = {0.2, 0.0732, 0};
Point(23) = {0.15, 0.07, 0};
Point(24) = {0.114, 0.0656, 0};
Point(25) = {0.088, 0.0606, 0};
Point(26) = {0.0685, 0.0553, 0};
Point(27) = {0.0535, 0.0497, 0};
Point(28) = {0.0416, 0.04425, 0};
Point(29) = {0.03205, 0.03921, 0};
Point(30) = {0.0245, 0.03434, 0};
Point(31) = {0.0186, 0.02992, 0};
Point(32) = {0.01415, 0.026098, 0};
Point(33) = {0.01105, 0.02306, 0};
Point(34) = {0.009, 0.020813, 0};
Point(35) = {0.007, 0.018356, 0};
Point(36) = {0.0052, 0.01582, 0}; // Upper Split
Point(37) = {0.0034, 0.012793, 0};
Point(38) = {0.00195, 0.009688, 0};
Point(39) = {0.0008, 0.0062054, 0};
Point(40) = {0.00012, 0.0024033, 0};
Point(41) = {1.0, 0.0015, 0};    // TE Top

Point(42) = {0.0, 0.0, 0};        // LE

Point(43) = {0.00055, -0.0025, 0};
Point(44) = {0.002, -0.0047, 0};
Point(45) = {0.004, -0.00675, 0};
Point(46) = {0.0062, -0.0084, 0}; // Lower Split
Point(47) = {0.0086, -0.00983, 0};
Point(48) = {0.011, -0.01095, 0};
Point(49) = {0.01465, -0.0123, 0};
Point(50) = {0.01955, -0.0135, 0};
Point(51) = {0.02615, -0.0148, 0};
Point(52) = {0.0343, -0.01605, 0};
Point(53) = {0.04449, -0.0174, 0};
Point(54) = {0.0569, -0.0189, 0};
Point(55) = {0.07245, -0.0205, 0};
Point(56) = {0.0924, -0.0221, 0};
Point(57) = {0.1185, -0.02385, 0};
Point(58) = {0.15, -0.02555, 0};
Point(59) = {0.2, -0.0276, 0};
Point(60) = {0.25, -0.0291, 0};
Point(61) = {0.3, -0.0301, 0};
Point(62) = {0.35, -0.0308, 0};
Point(63) = {0.4, -0.0311, 0};
Point(64) = {0.45, -0.031, 0};
Point(65) = {0.5, -0.03065, 0};
Point(66) = {0.55, -0.03, 0};
Point(67) = {0.6, -0.029066, 0};
Point(68) = {0.65, -0.027775, 0};
Point(69) = {0.69, -0.0264227, 0};
Point(70) = {0.73, -0.024824, 0};
Point(71) = {0.77, -0.022904, 0};
Point(72) = {0.81, -0.020713, 0};
Point(73) = {0.845, -0.0185215, 0};
Point(74) = {0.88, -0.0160523, 0};
Point(75) = {0.91, -0.013316, 0};
Point(76) = {0.935, -0.010835, 0};
Point(77) = {0.955, -0.0087715, 0};
Point(78) = {0.97, -0.006784, 0};
Point(79) = {0.98, -0.005224, 0};
Point(80) = {0.99, -0.0035627, 0};
Point(81) = {0.995, -0.0025315, 0};
Point(82) = {1.0, -0.0015, 0};  // TE Bottom
Point(83) = {1.0015, 0, 0};      // Sharp TE End

// Farfield
ymax = 4;
xmax = 10;
Point(129) = {-0.5, ymax, 0, 1.0};
Point(130) = {-0.5, -ymax, 0, 1.0};
Point(131) = {1, ymax, 0, 1.0};
Point(132) = {1, -ymax, 0, 1.0};
Point(133) = {xmax, ymax, 0, 1.0};
Point(134) = {xmax, -ymax, 0, 1.0};
Point(135) = {xmax, 0, 0, 1.0};

// 3. Curves
Spline(1) = {36, 37, 38, 39, 40, 42};
Spline(2) = {41, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36};
Spline(3) = {42, 43, 44, 45, 46};
Spline(4) = {46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82};
Line(20) = {82, 83}; 
Line(21) = {83, 41};

Circle(5) = {130, 42, 129};
Line(6) = {36, 129};
Line(7) = {46, 130};
Line(8) = {129, 131};
Line(9) = {130, 132};
Line(10) = {131, 133};
Line(11) = {132, 134};
Line(12) = {135, 133};
Line(13) = {135, 134};
Line(14) = {83, 131};
Line(15) = {83, 132};
Line(16) = {83, 135};

// 4. Surfaces (Topology)
Curve Loop(101) = {6, -5, -7, -3, -1};
Plane Surface(1) = {101};

Curve Loop(102) = {8, -14, 21, 2, 6};
Plane Surface(2) = {102};

Curve Loop(103) = {9, -15, -20, -4, 7};
Plane Surface(3) = {103};

Curve Loop(104) = {10, -12, -16, 14};
Plane Surface(4) = {104};

Curve Loop(105) = {16, 13, -11, -15};
Plane Surface(5) = {105};

// 5. Transfinite (격자 설정)
// N_Chord 설정: 바닥과 천장의 칸 수를 완벽히 일치시킴
N_Nose = 50; 
N_Chord = 250; 
N_Wake = 100;
N_Normal = 145; // y+ 제어용 층수

// Block 1: Nose
Transfinite Curve {5} = 99; // Arc (Odd number ensures center symmetry sometimes)
Transfinite Curve {3, 1} = 50; // Airfoil Nose
Transfinite Curve {6, 7} = N_Normal Using Progression 1.1;
Transfinite Surface {1} = {129, 130, 46, 36};
Recombine Surface {1};

// Block 2: Top Airfoil (문제 해결 포인트)
// 위쪽(Line 8) = 아래쪽(Spline 2 + Line 21) 격자 수가 같아야 함
Transfinite Curve {2} = N_Chord; 
Transfinite Curve {21} = 2; // 1 segment
// Total Segments Bottom = (250-1) + 1 = 250 segments
Transfinite Curve {8} = 251; // 251 points = 250 segments (MATCH!)

Transfinite Curve {6, 14} = N_Normal Using Progression 1.1;
Transfinite Surface {2} = {129, 131, 83, 36};
Recombine Surface {2};

// Block 3: Bottom Airfoil
Transfinite Curve {4} = N_Chord;
Transfinite Curve {20} = 2;
// Total Segments Top = (250-1) + 1 = 250 segments
Transfinite Curve {9} = 251; // 251 points = 250 segments (MATCH!)

Transfinite Curve {7, 15} = N_Normal Using Progression 1.1;
Transfinite Surface {3} = {130, 132, 83, 46};
Recombine Surface {3};

// Block 4 & 5: Wake
Transfinite Curve {16, 10, 11} = N_Wake;
Transfinite Curve {14, 12, 15, 13} = N_Normal Using Progression 1.1;
Transfinite Surface {4} = {131, 133, 135, 83};
Transfinite Surface {5} = {83, 135, 134, 132};
Recombine Surface {4, 5};

// 6. SU2 Tags
Physical Curve("AIRFOIL") = {1, 2, 3, 4, 20, 21};
Physical Curve("FARFIELD") = {5, 8, 9, 10, 11, 12, 13};
Physical Surface("FLUID") = {1, 2, 3, 4, 5};