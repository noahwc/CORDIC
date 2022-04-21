#include <stdio.h>
#include <time.h>

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int x_temp_1, y_temp_1, z_temp;
  int x_temp_2, y_temp_2;
  int i;

  x_temp_1 = xy & 0xffff;
  y_temp_1 = (xy >> 16) & 0xffff;
  z_temp = 0;

  // clock_t start = clock();

  /* loop prologue */
  int sign = y_temp_1 > 0 ? 1 : -1;

  x_temp_2 = x_temp_1 + sign*(y_temp_1 >> 0);
  y_temp_2 = y_temp_1 - sign*(x_temp_1 >> 0);
  z_temp += sign*z_table[0];

  for( i=1; i<15; i++) {
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    sign = y_temp_1 > 0 ? 1 : -1;

    x_temp_2 = x_temp_1 + (sign*(y_temp_1 >> i));
    y_temp_2 = y_temp_1 - (sign*(x_temp_1 >> i));
    z_temp += sign*z_table[i];
  }

  /* loop epilogue */
  x_temp_1 = x_temp_2;
  y_temp_1 = y_temp_2;

  // clock_t finish = clock();
  // printf("Execution time for cordic: %ld \n", finish - start);

  *z = z_temp;

  return y_temp_1 << 16 | x_temp_1;
}
