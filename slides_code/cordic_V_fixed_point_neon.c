#include <time.h>
#include <stdio.h>
#include "arm_neon.h"

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int xy_load[2];
  int z_temp;
  int i;
  
  clock_t start = clock();

  xy_load[0] = xy & 0xffff;
  xy_load[1] = (xy >> 16) & 0xffff;

  int32x2_t xy_neon = vld1_s32(xy_load);
  int32x2_t yx_neon = vrev64_s32(xy_neon);

  z_temp = 0;

  int32x2_t sign;
  int32x2_t sign_A = {1, -1};
  int32x2_t sign_B = {-1, 1};

  for( i=0; i<15; i++) { /* 15 iterations are needed */
      
    sign = xy_neon[1] > 0 ? sign_A : sign_B;

    //xy_neon = vshr_n_s32(xy_neon, 4); // shift
    xy_neon[0] = xy_neon[0] >> i;
    xy_neon[1] = xy_neon[1] >> i;

    xy_neon = vmul_s32(xy_neon, sign); // fix signs

    xy_neon = vadd_s32(xy_neon, yx_neon); // add

    yx_neon = xy_neon; // save reversed

    xy_neon = vrev64_s32(xy_neon); // fix orientation

    z_temp += sign[0]*z_table[i]; // compute z

  }
  
  clock_t finish = clock();
  printf("Execution time for 100000 iterations: %ld \n", finish - start);

  *z = z_temp;

  return xy_neon[1] << 16 | xy_neon[0];
}
