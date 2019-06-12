/* address sanitizer demo.
 *
 * this code does an out-of-bounds access on a stack array.
 */
#include <stdio.h>

int main(int argc, char *argv[]) {
  int stack_array[5] = {1, 2, 3, 4, 5};

  for(size_t i = 0; i < 5; i++) { // <-- fixed: looping [0, 1, 2, 3, 4]
    printf("stack_array[%zi] = %i\n", i, stack_array[i]);
  }

  return 0;
}
