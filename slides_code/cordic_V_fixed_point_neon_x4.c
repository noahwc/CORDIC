#include <stdio.h>
#include "arm_neon.h"

int16_t z_table[15];

int cordic_V_fixed_point(int *x1, int *y1, int *x2, int *y2, int *z1, int *z2) {
  int i = 1;
  int16x4_t sign;

  int16x4_t z_temp = {0,0,0,0};

  int16x4_t new_angle;

  int16x4_t xy_neon = {*x1, *y1, *x2, *y2};

  int16x4_t yx_neon = {*y1, *x1, *y2, *x2};

  sign[0] = xy_neon[1] > 0 ? 1 : -1; // get new sign

  sign[1] = xy_neon[3] > 0 ? 1 : -1; // get new sign

  new_angle = vld1_s16(&z_table[0]);

  z_temp = vmla_s16(z_temp, new_angle, sign);

  for(; i<15; i++) { /* 15 iterations are needed */

    xy_neon = vmla_s16(xy_neon, yx_neon, sign); // add

    sign[0] = xy_neon[1] > 0 ? 1 : -1; // get new sign
    sign[1] = -sign[0];
    sign[2] = xy_neon[3] > 0 ? 1 : -1; // get new sign
    sign[3] = -sign[2];
    yx_neon = vshr_n_s16(vrev32_s16(xy_neon), i); // copy and shift

    new_angle = vld1_s16(&z_table[i]);

    z_temp = vmla_s16(z_temp, new_angle, sign);
  
  }

  xy_neon = vmla_s16(xy_neon, yx_neon, sign); // add

  //clock_t finish = clock();
  //printf("Execution time: %ld \n", finish - start);

  *x1 = xy_neon[0];
  *y1 = xy_neon[1];
  *x2 = xy_neon[2];
  *y2 = xy_neon[3];
  *z1 = z_temp[0];
  *z2 = z_temp[2];

  return 0;
}

