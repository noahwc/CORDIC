//#include <time.h>
#include <stdio.h>

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int x_temp_1, y_temp_1, z_temp;
  int x_temp_2, y_temp_2;
  int i;

  x_temp_1 = xy & 0xffff;
  y_temp_1 = (xy >> 16) & 0xffff;
  z_temp = 0;

  int sign;

  for( i=0; i<15; i++) { /* 15 iterations are needed */
      
    sign = y_temp_1 > 0 ? 1 : -1;
      
    x_temp_2 = x_temp_1 + (sign*(y_temp_1 >> i));
    y_temp_2 = y_temp_1 - (sign*(x_temp_1 >> i));
    z_temp += sign*z_table[i];

    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;
  }

  *z = z_temp;

  return y_temp_1 << 16 | x_temp_1;
}
