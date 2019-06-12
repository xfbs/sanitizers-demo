/* out-of-bounds-heap
 *
 * out-of-bounds memory access on the heap demonstration.
 */

#include <jansson.h>

void print_string(json_t *object) {
  // print string.
  const char *string = json_string_value(object);
  for(size_t pos = 0; pos < 7; pos++) { // <-- loop goes too far
    printf("%c", string[pos]); // <-- out-of-bounds memory access
  }
}

int main(int argc, char *argv[]) {
  json_t *string = json_string("hello");
  print_string(string);
  json_decref(string);
  return 0;
}
