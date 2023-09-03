// Gmsh project created on Sat Jul 23 16:52:46 2022
SetFactory("OpenCASCADE");

lc_fault = 0.2;
lc = 5;
lc_DistMin = 1*lc_fault;

// for benchmark
//lc_fault = 0.2;
//lc = 10;
//lc_DistMin = 5*lc_fault;

DipAngle = -30;


Point(1) = {0, -5,   0, lc_fault};
Point(2) = {0,  5,   0, lc_fault};
Point(3) = {0,  5, -5, lc_fault};
Point(4) = {0, -5, -5, lc_fault};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Curve Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};
Point(5) = {0, -0.5, -2, lc_fault};
Point(6) = {0,  0.5, -2, lc_fault};
Point(7) = {0,  0.5, -3, lc_fault};
Point(8) = {0, -0.5, -3, lc_fault};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};
Curve Loop(2) = {5, 6, 7, 8};
Plane Surface(2) = {2};

Rotate {{0, 1, 0}, {0, 0, 0}, DipAngle/180.0*Pi} {
  Surface{1};
}

Rotate {{0, 1, 0}, {0, 0, 0}, DipAngle/180.0*Pi} {
  Surface{2};
}

BooleanFragments{ Surface{1}; Delete; }{ Surface{2}; Delete; }
//Box(1) = {-50, -50, -50, 100, 100, 50};
Box(1) = {-30, -30, -30, 60, 60, 30};

BooleanFragments{ Volume{1}; Delete; }{ Surface{2,3}; Delete; }

// set size at domain boundary
MeshSize {9, 10, 11, 12, 13, 14, 15, 16} = lc;



Mesh.Algorithm = 6; // Frontal-Delaunay for 2D meshes
//
//+
