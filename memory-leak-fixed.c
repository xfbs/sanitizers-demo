/* memory-sanitizer demo.
 *
 * we have a memory leak because json_dumps() returns a char*, which
 * we are responsible for freeing, but we don't do so.
 */

#include <jansson.h>

int main(int argc, char *argv[]) {
  // create object.
  json_t *string = json_string("hello");
  json_t *object = json_object();
  json_object_set(object, "msg", string);

  // print object.
  char *str = json_dumps(object, JSON_INDENT(2));
  printf("%s\n", str);
  free(str);

  // free object.
  json_decref(object);

  return 0;
}
