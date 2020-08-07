#include <time.h>
#include <stdio.h>
#include "arm_neon.h"

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int x_temp_2, y_temp_2;
  int i;

  clock_t start = clock();

  int z_temp = 0;

  volatile int32_t temp1[2], temp1b[2], temp2[2];
  temp1[0] = xy & 0xffff;;        // = x
  temp1[1] = (xy >> 16) & 0xffff; // = y
  int32x2_t temp1_neon, temp1b_neon, temp2_neon;

  int sign;

  for( i=0; i<15; i++) { /* 15 iterations are needed */

    sign = temp1[1] > 0 ? 1 : -1;
    temp1b[0] = sign*(temp1[1] >> i);
    temp1b[1] = (sign*(temp1[0] >> i));

    temp1_neon = vld1_s32( (const int32_t *)&temp1[0]);
    temp1b_neon = vld1_s32( (const int32_t *)&temp1b[0]);
    temp2_neon = vadd_s32( temp1_neon, temp1b_neon);
    vst1_s32( (int32_t *)&temp2[0], temp2_neon);

    temp1_neon = vld1_s32( (const int32_t *)&temp1[1]);
    temp1b_neon = vld1_s32( (const int32_t *)&temp1b[1]);
    temp2_neon = vsub_s32( temp1_neon, temp1b_neon);
    vst1_s32( (int32_t *)&temp2[1], temp2_neon);

    // x_temp_2 = x_temp_1 + (sign*(y_temp_1 >> i));
    // y_temp_2 = y_temp_1 - (sign*(x_temp_1 >> i));
    z_temp += sign*z_table[i];

    temp1[0] = temp2[0];
    temp1[1] = temp2[1];
  }

  clock_t finish = clock();
  printf("Execution time for cordic: %ld \n", finish - start);


  *z = z_temp;

  return temp1[1] << 16 | temp1[0];
}