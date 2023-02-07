// Gmsh project created on Sat Jul 23 16:52:46 2022
SetFactory("OpenCASCADE");

lc_fault = 0.8/Sqrt(3)*2;
lc = 20/Sqrt(3)*2;
lc_DistMin = 5*lc_fault;

Point(1) = {0, -15, -7.5, lc_fault};
Point(2) = {0,  15, -7.5, lc_fault};
Point(3) = {0,  15,  7.5, lc_fault};
Point(4) = {0, -15,  7.5, lc_fault};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Curve Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};
//Box(1) = {-100, -150, -100, 200, 300, 200};
Box(1) = {-100, -120, -100, 200, 240, 200};
 
// set size at domain boundary
MeshSize {5, 7, 11, 9, 10, 12, 8, 6} = lc;

BooleanFragments{ Volume{1}; Delete; }{ Surface{1}; Delete; }


// Size // Sizing:
// Size 
// Size Field[1] = Distance;
// Size Field[1].FacesList = {1};
// Size 
// Size // Matheval field
// Size Field[2] = MathEval;
// Size //Field[2].F = Sprintf("0.02*F1 + 0.00001*F1^2 + %g", lc_fault);
// Size //Field[2].F = Sprintf("0.02*F1 +(F1/2e3)^2 + %g", lc_fault);
// Size //Field[2].F = Sprintf("0.02*F1 +(F1/0.5e3)^2 + %g", lc_fault);
// Size //Field[2].F = Sprintf("0.00*F1 +((F1-5e3)/0.1e3)^2 + %g", lc_fault);
// Size Field[2].F = Sprintf("0.0000*F1 +((F1-0e3)/0.1)^2 + %g", lc_fault);
// Size 
// Size //// Equivalent of propagation size on element
// Size Field[3] = Threshold;
// Size Field[3].IField = 1;
// Size Field[3].LcMin = lc_fault;
// Size Field[3].LcMax = lc;
// Size Field[3].DistMin = lc_DistMin;
// Size Field[3].DistMax = 125*lc_fault+0.001;
// Size 
// Size //
// Size Field[4] = Min;
// Size Field[4].FieldsList = {2,3};
// Size //Field[4].FieldsList = {2};
// Size Background Field = 4;

//
//
//