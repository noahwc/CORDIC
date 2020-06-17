#include <stdio.h>
#include <math.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char **argv) {
    double x_d, y_d, z_d; /* 64-bit floating-point variables */
    int x_i, y_i, z_i; /* integer (fixed-point) variables */

    if(argc != 1 && argc != 5){
        printf("Invalid number of arguments. Specify two or zero arguments.");
        return 1;
    }

    x_d = 0.85;
    y_d = 0.76;

    if(argc == 5){
        for(int i = 1; i <= 4; i++){
            if(strcmp(argv[i], "-x_d") == 0){
                x_d = strtod(argv[i+1], NULL);
                i++;
            }
            else if(strcmp(argv[i], "-y_d") == 0){
                y_d = strtod(argv[i+1], NULL);
                i++;
            }
            else{
                printf("Invalid argument.");
                return 1;
            }
        }
    }

    z_d = atan( y_d / x_d); /* call std-C math routines */
    
    x_i = (int)(x_d * (1 << 15)); /* convert the x_d, y_d, z_d */
    y_i = (int)(y_d * (1 << 15)); /* floats to integers with a */
    z_i = (int)(z_d * (1 << 15)); /* precision of 16 bits */
    
    printf( "x_d = %f\t\t\tx_i = %i\n", x_d, x_i);
    printf( "y_d = %f\t\t\ty_i = %i\n", y_d, y_i);
    printf( "z_d = %f\t\t\tz_i = %i\n", z_d, z_i);
    printf( "\n");
    printf( "The angle table:\n");
    
    for(int i=0; i<15; i++) {
        printf( "z[%2i] = %i\n", i,
        (int)(atan( pow( 2.0, (double)(-i))) * (1 << 15)));
    }
    return 0;
}
