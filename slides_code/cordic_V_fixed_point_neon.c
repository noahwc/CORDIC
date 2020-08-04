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

  int32x2_t xy = vld1_s32(xy_load);
  int32x2_t yx = vrev64_s32(xy);

  z_temp = 0;

  int32x2_t sign;
  int32x2_t sign_A = {1, -1};
  int32x2_t sign_B = {-1, 1};

  for( i=0; i<15; i++) { /* 15 iterations are needed */
      
    sign = xy[1] > 0 ? sign_A : sign_B;

    xy = vshr_n_s32(xy, i); // shift

    xy = vmul_n_s32(xy, sign); // fix signs

    xy = vadd_s32(xy, yx); // add

    yx = xy; // save reversed

    xy = vrev64_s32(xy); // fix orientation

    z_temp += sign[0]*z_table[i]; // compute z

  }
  
  clock_t finish = clock();
  printf("Execution time for 100000 iterations: %ld \n", finish - start);

  *z = z_temp;

  return xy[1] << 16 | xy[0];
}
