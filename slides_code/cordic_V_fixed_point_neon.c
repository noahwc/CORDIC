#include <time.h>
#include <stdio.h>
#include "arm_neon.h"

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int z_temp;
  int i;
  
  clock_t start = clock();

  int32x2_t xy_neon = {xy & 0xffff, (xy >> 16) & 0xffff};
  int32x2_t yx_neon = vrev64_s32(xy_neon);

  z_temp = 0;

  int32x2_t sign;
  int32x2_t sign_A = {1, -1};
  int32x2_t sign_B = {-1, 1};

  for( i=0; i<15; i++) { /* 15 iterations are needed */
      
    sign = xy_neon[1] > 0 ? sign_A : sign_B;

    // shift
    yx_neon[0] = yx_neon[0] >> i;
    yx_neon[1] = yx_neon[1] >> i;

    yx_neon = vmul_s32(yx_neon, sign); // fix signs

    xy_neon = vadd_s32(xy_neon, yx_neon); // add

    yx_neon = vrev64_s32(xy_neon); // fix orientation

    z_temp += sign[0]*z_table[i]; // compute z

  }
  
  clock_t finish = clock();
  printf("Execution time: %ld \n", finish - start);

  *z = z_temp;

  return xy_neon[1] << 16 | xy_neon[0];
}
