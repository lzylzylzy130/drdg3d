// Gmsh project created on Mon Jul 18 15:46:01 2022
SetFactory("OpenCASCADE");
//+
Box(1) = {-30, -30, -30, 60, 60, 30};
Rectangle(7) = {0, -2, 0, 2, 4, 0};
Rectangle(8) = {0.75, -0.25, 0, 0.5, 0.5, 0};


DipAngle = 60;

Rotate {{0, 1, 0}, {0, 0, 0}, DipAngle/180.0*Pi} {
  Surface{7};
}

Rotate {{0, 1, 0}, {0, 0, 0}, DipAngle/180.0*Pi} {
  Surface{8};
}

BooleanFragments{ Surface{7}; Delete; }{ Surface{8}; Delete; }


BooleanFragments{ Volume{1}; Delete; }{ Surface{8,9}; Delete; }
Recursive Delete {
  Surface{1};
}

MeshSize{:} = 5;
Characteristic Length {3, 5, 6, 4} = 1;
//MeshSize {9, 7, 12, 13, 14, 11, 10, 8} = 30;

Mesh.Algorithm = 6; // Frontal-Delaunay for 2D meshes