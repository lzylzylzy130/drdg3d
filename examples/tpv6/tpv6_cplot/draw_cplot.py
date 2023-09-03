#!/bin/bash

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D


def load_data(fnm):
    a = np.loadtxt(fnm, comments='#')
    x = a[:, 0]
    y = a[:, 1]
    t = a[:, 2]
    return x, -y, t


levels = np.linspace(0.5, 15, 20)

fig, ax = plt.subplots()
x, y, t = load_data('tpv6_specfem3d')
ax.tricontour(x, y, t, levels=levels, colors='r', linewidths=1)
x, y, t = load_data('tpv6_drdg3d')
ax.tricontour(x, y, t, levels=levels, colors='g', linewidths=1)
x, y, t = load_data('tpv6_seissol')
ax.tricontour(x, y, t, levels=levels, colors='b', linewidths=1)
plt.axis('square')
plt.xlim([-15000, 15000])
plt.ylim([-15000, 0])

legend_elements = [Line2D([0], [0], color='r', lw=1, label='Yoshihiro Kaneko - Spectral Element - SPECFEM3D'),
                   Line2D([0], [0], color='g', lw=1, label='Wenqiang Zhang - Mixed-Flux DG - DRDG3D - 200m - O3'),
                   Line2D([0], [0], color='b', lw=1, label='Christian Pelties - Discontinuous Galerkin - SeisSol')]

ax.legend(handles=legend_elements, loc='lower left')
plt.ylabel('Distance down-dip (m)')
plt.xlabel('Distance along-strike (m)')
plt.grid(linestyle='--', linewidth=0.5)

plt.show()

# CS1 = ax.contour(X, Y, Z1, colors='k')
# ax.clabel(CS1, inline=1, fontsize=10)
#
# CS2 = ax.contour(X, Y, Z2, colors='r')
# ax.clabel(CS2, inline=1, fontsize=10)
#
# lines = [ CS1.collections[0], CS1.collections[-1], CS2.collections[0], CS2.collections[-1]]
# labels = ['CS1_neg','CS1_pos','CS2_neg','CS2_pos']
