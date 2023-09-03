#!/bin/bash

set -e
set -x

fnm=tpv5
gmsh -3 ${fnm}.geo -o ${fnm}.inp 
meshio convert ${fnm}.inp ${fnm}.exo
