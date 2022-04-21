#include <time.h>
#include <stdio.h>

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int x_temp_1, y_temp_1, z_temp;
  int x_temp_2, y_temp_2;
  int i;

  x_temp_1 = xy & 0xffff;
  y_temp_1 = (xy >> 16) & 0xffff;
  z_temp = 0;

  // clock_t start = clock();

  for( i=0; i<14; i+=2) {
    if( y_temp_1 > 0) {
      x_temp_2 = x_temp_1 + (y_temp_1 >> i);
      y_temp_2 = y_temp_1 - (x_temp_1 >> i);
      z_temp += z_table[i];
    } else {
      x_temp_2 = x_temp_1 - (y_temp_1 >> i);
      y_temp_2 = y_temp_1 + (x_temp_1 >> i);
      z_temp -= z_table[i];
    }
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if( y_temp_1 > 0) {
      x_temp_2 = x_temp_1 + (y_temp_1 >> i+1);
      y_temp_2 = y_temp_1 - (x_temp_1 >> i+1);
      z_temp += z_table[i+1];
    } else {
      x_temp_2 = x_temp_1 - (y_temp_1 >> i+1);
      y_temp_2 = y_temp_1 + (x_temp_1 >> i+1);
      z_temp -= z_table[i+1];
    }
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;
  }

  if( y_temp_1 > 0) {
    x_temp_2 = x_temp_1 + (y_temp_1 >> i);
    y_temp_2 = y_temp_1 - (x_temp_1 >> i);
    z_temp += z_table[i];
  } else {
    x_temp_2 = x_temp_1 - (y_temp_1 >> i);
    y_temp_2 = y_temp_1 + (x_temp_1 >> i);
    z_temp -= z_table[i];
  }
  x_temp_1 = x_temp_2;
  y_temp_1 = y_temp_2;

  // clock_t finish = clock();
  // printf("Execution time for cordic: %ld \n", finish - start);

  *z = z_temp;

  return y_temp_1 << 16 | x_temp_1;
}
