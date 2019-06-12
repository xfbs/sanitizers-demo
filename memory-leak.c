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
  printf("%s\n", json_dumps(object, 0));

  // free object.
  json_decref(object);

  return 0;
}
