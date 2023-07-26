//+
SetFactory("OpenCASCADE");

faultsize = 1;///1.0/Sqrt(3)*2.0;

Point(1) = {0, -25, 0, faultsize};
Point(2) = {0, 5, 0, faultsize};
Point(3) = {0, 5, -20, faultsize};
Point(4) = {0, -25, -20, faultsize};

Point(5) = {4, -5, 0, faultsize};
Point(6) = {4, 25, 0, faultsize};
Point(7) = {4, 25, -20, faultsize};
Point(8) = {4, -5, -20, faultsize};

Point(9) = {0, -5, 0, faultsize};
Point(10) = {4, 5, 0, faultsize};

Point(11) = {0, -5, -10, faultsize};
Point(12) = {4, 5, -10, faultsize};
Point(13) = {0, 5, -10, faultsize};
Point(14) = {4, -5, -10, faultsize};


Line(13) = {1, 9};
Line(14) = {9, 11};
Line(15) = {11, 13};
Line(16) = {13, 3};
Line(17) = {3, 4};
Line(18) = {4, 1};
Line(19) = {9, 2};
Line(20) = {2, 13};
Line(21) = {6, 10};
Line(22) = {10, 12};
Line(23) = {12, 14};
Line(24) = {14, 8};
Line(25) = {8, 7};
Line(26) = {7, 6};
Line(27) = {2, 10};
Line(28) = {13, 12};
Line(29) = {11, 14};
Line(30) = {9, 5};
Line(31) = {5, 10};
Line(32) = {5, 14};

Curve Loop(7) = {13, 14, 15, 16, 17, 18};
Curve Loop(8) = {19, 20, -15, -14};
Curve Loop(9) = {21, 22, 23, 24, 25, 26};
Curve Loop(10) = {31, 22, 23, -32};
Curve Loop(11) = {14, 29, -32, -30};
Curve Loop(12) = {27, 22, -28, -20};
Curve Loop(13) = {15, 28, 23, -29};


Plane Surface(7) = {7};
Plane Surface(8) = {8};
Plane Surface(9) = {9};
Plane Surface(10) = {10};
Plane Surface(11) = {11};
Plane Surface(12) = {12};
Plane Surface(13) = {13};


Box(1) = {-30, -40, -40, 60, 80, 40};

//+
BooleanFragments{ Volume{1}; Delete; }{ Surface{7}; Delete; }
BooleanFragments{ Volume{1}; Delete; }{ Surface{8}; Delete; }
BooleanFragments{ Volume{1}; Delete; }{ Surface{9}; Delete; }
BooleanFragments{ Volume{1}; Delete; }{ Surface{10}; Delete; }

BooleanFragments{ Volume{1}; Delete; }{ Surface{11}; Delete; }
BooleanFragments{ Volume{1}; Delete; }{ Surface{12}; Delete; }
//BooleanFragments{ Volume{1}; Delete; }{ Surface{13}; Delete; }

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
Line{40, 42, 43, 44} In Surface{16};
//+
//MeshSize {15, 16, 19, 20, 17, 18, 13, 14} = 40/Sqrt(3.0)*2.0;


Mesh.Algorithm = 6; // Frontal-Delaunay for 2D meshes//+
//+
