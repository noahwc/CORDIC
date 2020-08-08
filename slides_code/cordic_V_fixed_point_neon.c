//#include <time.h>
#include <stdio.h>
#include "arm_neon.h"

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int i = 1;
  int32_t sign = (xy >> 16) & 0xffff > 0 ? 1 : -1;

  int32_t z_temp = 0;
  
  //clock_t start = clock();

  int32x2_t xy_neon = {xy & 0xffff, (xy >> 16) & 0xffff};

  int32x2_t yx_neon = {(xy >> 16) & 0xffff, -(xy & 0xffff)};

  z_temp += sign*z_table[0]; // compute z

  for(; i<15; i++) { /* 15 iterations are needed */

    xy_neon = vmla_n_s32(xy_neon, yx_neon, sign); // add    

    sign = xy_neon[1] > 0 ? 1 : -1; // get new sign

    yx_neon = vshr_n_s32(vrev64_s32(xy_neon), i); // copy and shift

    z_temp += sign*z_table[i]; // compute z
    
    yx_neon[1] = -yx_neon[1]; // make addition subtraction for y
  
  }

  xy_neon = vmla_n_s32(xy_neon, yx_neon, sign); // add

  //clock_t finish = clock();
  //printf("Execution time: %ld \n", finish - start);

  *z = z_temp;

  return xy_neon[1] << 16 | xy_neon[0];
}
