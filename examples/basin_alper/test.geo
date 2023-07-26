SetFactory("OpenCASCADE");

//Make the  main volume:
p1 = newp;
Point(p1) = {0,0,0};
p2 = newp;
Point(p2) = {2,0,0};
p3 = newp;
Point(p3) = {2,2,0};
p4 = newp;
Point(p4) = {0,2,0};

l1 = newl;
Line(l1) = {p1,p2};
l2 = newl;
Line(l2) = {p2,p3};
l3 = newl;
Line(l3) = {p3,p4};
l4 = newl;
Line(l4) = {p4,p1};

ll1 = newll;
Line Loop(ll1) = {l1,l2,l3,l4};

s1 = news;
Plane Surface(s1) = {ll1};

mainExt[] = Extrude{0,0,2}{Surface{s1};};

//Make a sub volume
p5 = newp;
Point(p5) = {2,0,0};
p6 = newp;
Point(p6) = {2,1,0};
p7 = newp;
Point(p7) = {0,1,0};

l5 = newl;
Line(l5) = {p1,p5};
l6 = newl;
Line(l6) = {p5,p6};
l7 = newl;
Line(l7) = {p6,p7};
l8 = newl;
Line(l8) = {p7,p1};

ll2 = newll;
Line Loop(ll2) = {l5,l6,l7,l8};

s2 = news;
Plane Surface(s2) = {ll2};

subExt[] = Extrude{0,0,2}{Surface{s2};};
Coherence;