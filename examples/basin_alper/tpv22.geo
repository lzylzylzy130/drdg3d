//+
SetFactory("OpenCASCADE");

faultsize = 1;///0.3   1.0/Sqrt(3)*2.0;

Point(1) = {0, -35, 0, faultsize};
Point(2) = {0, 5, 0, faultsize};
Point(3) = {0, 5, -20, faultsize};
Point(4) = {0, -35, -20, faultsize};

Point(5) = {1.5, -5, 0, faultsize};
Point(6) = {1.5, 35, 0, faultsize};
Point(7) = {1.5, 35, -20, faultsize};
Point(8) = {1.5, -5, -20, faultsize};

Line(13) = {1, 2};
Line(14) = {2, 3};
Line(15) = {3, 4};
Line(16) = {4, 1};
Line(17) = {5, 6};
Line(18) = {6, 7};
Line(19) = {7, 8};
Line(20) = {8, 5};
Curve Loop(7) = {13, 14, 15, 16};
Plane Surface(7) = {7};
Curve Loop(8) = {17, 18, 19, 20};
Plane Surface(8) = {8};

Box(1) = {-40, -50, -50, 80, 110, 50};

//+
BooleanFragments{ Volume{1}; Delete; }{ Surface{7}; Delete; }
BooleanFragments{ Volume{1}; Delete; }{ Surface{8}; Delete; }

//Physical Volume(60) = {1, 2};

//BooleanFragments{ Volume{1}; Delete;} { Volume{2}; Delete;}

//+
//MeshSize {15, 19, 18, 13, 14, 17, 24, 16} = 50;

//Point(101) = {0, 0, 0, faultsize};
//Point(102) = {0, 40, 0, faultsize};
//Point(103) = {1, 32, 0, faultsize};
//Point(104) = {1, 40, 0, faultsize};
//Point(105) = {2, 32, 0, faultsize};
//Point(106) = {2, 62, 0, faultsize};
//+
//Line(33) = {101, 102};
//Line(34) = {103, 104};
//Line(35) = {105, 106};
Line{30, 17} In Surface{11};
//+
//MeshSize {15, 16, 19, 20, 17, 18, 13, 14} = 40/Sqrt(3.0)*2.0;


Mesh.Algorithm = 6; // Frontal-Delaunay for 2D meshes