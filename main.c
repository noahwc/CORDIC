#include <stdio.h>

int main() {
    int x, y;

    printf("Input the x component.");
    scanf("%d",&x);
    printf("Input the y component.");
    scanf("%d",&y);

    int theta[28] = {
        0.78539816339745, 0.46364760900081, 0.24497866312686,  0.12435499454676,
        0.06241880999596, 0.03123983343027, 0.01562372862048, 0.00781234106010,
        0.00390623013197, 0.00195312251648, 0.00097656218956, 0.00048828121119,
        0.00024414062015, 0.00012207031189, 0.00006103515617, 0.00003051757812,
        0.00001525878906, 0.00000762939453, 0.00000381469727, 0.00000190734863,
        0.00000095367432, 0.00000047683716, 0.00000023841858, 0.00000011920929,
        0.00000005960464, 0.00000002980232, 0.00000001490116, 0.00000000745058
    };

   return 0;
}