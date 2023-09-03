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
x, y, t = load_data('tpv105-3d_cplot_barall2.txt')
ax.tricontour(x, y, t, levels=levels, colors='r', linewidths=1)
x, y, t = load_data('tpv105-3d_cplot_wzhang.txt')
ax.tricontour(x, y, t, levels=levels, colors='g', linewidths=1)
x, y, t = load_data('tpv105-3d_cplot_chen2.txt')
ax.tricontour(x, y, t, levels=levels, colors='b', linewidths=1)
x, y, t = load_data('tpv105-3d_cplot_ulrich.txt')
ax.tricontour(x, y, t, levels=levels, colors='y', linewidths=1)
x, y, t = load_data('tpv105-3d_cplot_drdg3dtest_o5_200m.txt')
ax.tricontour(x, y, t, levels=levels, colors='k', linewidths=1)
x, y, t = load_data('tpv105-3d_cplot_drdg3dtest_o4_150m_1.txt')
ax.tricontour(x, y, t, levels=levels, colors='m', linewidths=1)
plt.axis('square')
plt.xlim([-22000, 22000])
plt.ylim([-22000, 0])

legend_elements = [Line2D([0], [0], color='r', lw=1, label='barall2-FaultMod-50m'),
                   Line2D([0], [0], color='g', lw=1, label='wzhang-DRDG3D-200m-o4'),
                   Line2D([0], [0], color='b', lw=1, label='chen2-CGFDM-50m'),
                   Line2D([0], [0], color='y', lw=1, label='ulrich-ADER-DG'),
                   Line2D([0], [0], color='k', lw=1, label='drdg3dtest-200m-o5'),
                   Line2D([0], [0], color='m', lw=1, label='drdg3dtest-150m-o4')]

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
