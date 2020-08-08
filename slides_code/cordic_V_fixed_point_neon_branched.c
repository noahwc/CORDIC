//#include <time.h>
#include <stdio.h>
#include "arm_neon.h"

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int z_temp, i;
  
  //clock_t start = clock();

  int32x2_t yx_neon = {(xy >> 16) & 0xffff, xy & 0xffff};
  int32x2_t xy_neon = vrev64_s32(yx_neon);

  z_temp = 0;

    for( i=0; i<15; i++) { /* 15 iterations are needed */

        // shift
        yx_neon[0] = yx_neon[0] >> i;
        yx_neon[1] = -yx_neon[1] >> i;

        if( xy_neon[1] > 0) {

            xy_neon = vadd_s32(xy_neon, yx_neon); // add
            z_temp += z_table[i];

        }
        else{

            xy_neon = vadd_s32(xy_neon, vneg_s32(yx_neon)); // add
            z_temp -= z_table[i];
        }

        yx_neon = vrev64_s32(xy_neon); // fix orientation

    }
  
  //clock_t finish = clock();
  //printf("Execution time: %ld \n", finish - start);

    *z = z_temp;

    return xy_neon[1] << 16 | xy_neon[0];
}

