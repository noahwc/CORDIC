#include <time.h>
#include <stdio.h>

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int x_temp_1, y_temp_1, z_temp;
  int x_temp_2, y_temp_2;
  int i;
  
  clock_t start = clock();
  for(int j = 0; j < 100000; j++){

    x_temp_1 = xy & 0xffff;
    y_temp_1 = (xy >> 16) & 0xffff;
    z_temp = 0;

    for( i=0; i<15; i++) { /* 15 iterations are needed */
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
    }

  }

  clock_t finish = clock();
  printf("Execution time for 100000 iterations: %ld \n", finish - start);

  *z = z_temp;

  return y_temp_1 << 16 | x_temp_1;
}