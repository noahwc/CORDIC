#include <stdio.h>

int z_table[15];

int cordic_V_fixed_point(int xy, int *z) {
  int z_temp;
  int i;

  z_temp = 0;

  int sign;

  for( i=0; i<15; i++) { /* 15 iterations are needed */
      
    sign = xy > 0 ? 1 : -1;
      
 __asm__ __volatile__ (
      "cordic_hw\t%0, %1, %2\n"
      : "=r" (xy)
      : "r" (xy), "r" (i)
    );

    z_temp += sign*z_table[i];

  }

  *z = z_temp;

  return xy;
}

