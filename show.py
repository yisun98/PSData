# -*- coding:utf-8 -*-
from pathlib import Path
import random

from matplotlib import pyplot as plt
import glob
from PIL import Image

# satellite = ['GF-1', 'GF-2', 'QB', 'WV-2']
satellite = ['GF-2', 'QB', 'WV-3']

for i in range(0, len(satellite)):

    image_list = glob.glob("examples\{}\*.png".format(satellite[i]))
    print(len(image_list))
    
    row = 2
    
    col = len(image_list) / 2 if len(image_list) % 2 == 0 else len(image_list) / 2 + 1
    
    print(row, col)

    plt.figure(figsize=(80,20))

    for j in range(1, len(image_list)+1):
        im = Image.open(str(image_list[j-1]))
        ax = plt.subplot(row, col, j)
        plt.imshow(im)


        plt.xticks([])
        plt.yticks([])

        ax.spines['top'].set_visible(False)
        ax.spines['right'].set_visible(False)
        ax.spines['bottom'].set_visible(False)
        ax.spines['left'].set_visible(False)

    plt.subplots_adjust(left=0.10, top=0.88, right=0.65, bottom=0.08, wspace=0.02, hspace=0.02)
    plt.savefig('examples\PSData4\{}.png'.format(satellite[i]), dpi=600)
    plt.show()
   