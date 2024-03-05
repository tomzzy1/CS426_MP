#include "coolrt.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* This file provides the runtime library for cool. It implements
   the functions of the cool classes in C
   */

/* Class name strings */
const char Object_string[] = "Object";
const char String_string[] = "String";
const char Int_string[] = "Int";
const char Bool_string[] = "Bool";
const char IO_string[] = "IO";

const char default_string[] = "";

/* Class vtable prototypes */
extern const Object_vtable _Object_vtable_prototype;
// const Object_vtable _Object_vtable_prototype = {
//     /* ADD CODE HERE */
//     0,
//     sizeof(Object_vtable),
//     Object_string,
//     Object_new,
//     Object_abort,
//     Object_type_name,
//     Object_copy
// };

// /* ADD CODE HERE FOR MORE VTABLE PROTOTYPES */
extern const Int_vtable _Int_vtable_prototype;
//  = {
//     /* ADD CODE HERE */
//     1,
//     sizeof(Int_vtable),
//     Int_string,
//     Int_new,
//     Object_abort,
//     Object_type_name,
//     Object_copy
// };
extern const Bool_vtable _Bool_vtable_prototype;
// const Bool_vtable _Bool_vtable_prototype = {
//     /* ADD CODE HERE */
//     2,
//     sizeof(Bool_vtable),
//     Bool_string,
//     Bool_new,
//     Object_abort,
//     Object_type_name,
//     Object_copy
// };
extern const String_vtable _String_vtable_prototype;
// const String_vtable _String_vtable_prototype = {
//     /* ADD CODE HERE */
//     3,
//     sizeof(String_vtable),
//     String_string,
//     String_new,
//     Object_abort,
//     Object_type_name,
//     Object_copy,
//     String_length,
//     String_concat,
//     String_substr
// };
extern const IO_vtable _IO_vtable_prototype;
// const IO_vtable _IO_vtable_prototype = {
//     /* ADD CODE HERE */
//     4,
//     sizeof(IO_vtable),
//     IO_string,
//     IO_new,
//     Object_abort,
//     Object_type_name,
//     Object_copy,
//     IO_out_string,
//     IO_out_int,
//     IO_in_string,
//     IO_in_int
// };

/*
// Methods in class object (only some are provided to you)
*/
Object *Object_abort(Object *self) {
  printf("Abort called from class %s\n",
         !self ? "Unknown" : self->vtblptr->name);
  exit(1);
  return self;
}

const String *Object_type_name(Object *self) {
  if (self == 0) {
    fprintf(stderr, "At %s(line %d): self is NULL\n", __FILE__, __LINE__);
    abort();
  }
  String *s = String_new();
  s->val = self->vtblptr->name;
  fprintf(stderr, "At %s(line %d): Object type name\n", __FILE__, __LINE__);
  return s;
}

/* ADD CODE HERE FOR MORE METHODS OF CLASS OBJECT */
Object *Object_new()
{
  Object* o = malloc(sizeof(Object));
  //o->vtblptr = &_Object_vtable_prototype;
  return o;
}

Object *Object_copy(Object *self)
{
  fprintf(stderr, "At %s(line %d): object copy\n", __FILE__, __LINE__);
  //Object* o = malloc(sizeof(Object));
  //*o = *self;
  //memcpy(o, self, sizeof(Object));
  /*if (self->vtblptr->attr == 1)
  {
    Int* i = malloc(sizeof(Int));
    Int* old = (Int*) self;
    i->val = old->val;
    i->vtblptr = old->vtblptr;
    return i;
  }*/
  int size = self->vtblptr->size;
  Object* o = malloc(size);
  memcpy(o, self, size);
  return o;

}
/*
// Methods in class IO (only some are provided to you)
*/

IO *IO_out_string(IO *self, String *s) {
  if (self == 0 || s == 0) {
    fprintf(stderr, "At %s(line %d): NULL object\n", __FILE__, __LINE__);
    abort();
  }
  printf("%s", s->val);
  return self;
}

IO *IO_out_int(IO *self, int x) {
  if (self == 0) {
    fprintf(stderr, "At %s(line %d): NULL object\n", __FILE__, __LINE__);
    abort();
  }
  printf("%d", x);
  return self;
}

/*
 * Get one line from stream using get_line(), then discard newline character.
 * Allocate string *in_string_p and store result there.
 * Return number of chars read.
 */
static int get_one_line(char **in_string_p, FILE *stream) {
  /* Get one line worth of input */
  size_t len = 0;
  ssize_t num_chars_read;
  num_chars_read = getline(in_string_p, &len, stdin);
  if (*in_string_p == 0) {
    fprintf(stderr, "At %s(line %d): allocation failed in IO::in_string()\n",
            __FILE__, __LINE__);
    exit(1);
  }

  /* Discard the newline char, if any.  It may not exist if EOF reached. */
  if (num_chars_read > 0 && (*in_string_p)[num_chars_read - 1] == '\n') {
    (*in_string_p)[num_chars_read - 1] = '\0';
    --len;
  }

  return len;
}

/*
 * The method IO::in_string(): String reads a string from
 * the standard input, up to but not including a newline character.
 */
String *IO_in_string(IO *self) {
  if (self == 0) {
    fprintf(stderr, "At %s(line %d): self is NULL\n", __FILE__, __LINE__);
    abort();
  }

  /* Get one line worth of input with the newline, if any, discarded */
  char *in_string = 0;
  ssize_t len = get_one_line(&in_string, stdin);
  assert(in_string);

  /* We can take advantage of knowing the internal layout of String objects */
  String *str = String_new();
  str->val = in_string;
  return str;
}

/*
 * The method IO::in_int(): Int reads a single integer, which may be preceded
 * by whitespace.
 * Any characters following the integer, up to and including the next newline,
 * are discarded by in_int.
 */
int IO_in_int(IO *self) {
  if (self == 0) {
    fprintf(stderr, "At %s(line %d): self is NULL\n", __FILE__, __LINE__);
    abort();
  }

  /* Get one line worth of input with the newline, if any, discarded */
  char *in_string = 0;
  ssize_t len = get_one_line(&in_string, stdin);
  assert(in_string);

  /* Now extract initial int and ignore the rest of the line */
  int x;
  int num_ints = 0;
  if (len)
    /* Discards initial spaces*/
    num_ints = sscanf(in_string, " %d", &x);

  /* If no text found, abort. */
  if (num_ints == 0) {
    fprintf(stderr, "At %s(line %d): Invalid integer on input in IO::in_int()\n",
            __FILE__, __LINE__);
    Object_abort((Object *)self);
  }
  return x;
}

/* ADD CODE HERE FOR MORE METHODS OF CLASS IO */
IO *IO_new()
{
  IO* o = malloc(sizeof(IO));
  o->vtblptr = &_IO_vtable_prototype;
  return o;
}

/* ADD CODE HERE FOR METHODS OF OTHER BUILTIN CLASSES */
Int *Int_new()
{
  Int* o = malloc(sizeof(Int));
  fprintf(stderr, "At %s(line %d): int new\n", __FILE__, __LINE__);
  o->vtblptr = &_Int_vtable_prototype;
  return o;
}

void Int_init(Int* o, int i)
{
  o->val = i;
  fprintf(stderr, "At %s(line %d): int init\n", __FILE__, __LINE__);
}

Bool *Bool_new()
{
  Bool* o = malloc(sizeof(Bool));
  o->vtblptr = &_Bool_vtable_prototype;
  return o;
}

void Bool_init(Bool *o, bool b)
{
  o->val = b;
}

String *String_new()
{
  String* o = malloc(sizeof(String));
  o->vtblptr = &_String_vtable_prototype;
  return o;
}

int String_length(String *self)
{
  return strlen(self->val);
}

String *String_concat(String *self, String *other)
{
  String *str = String_new();
  fprintf(stderr, "At %s(line %d): string concat\n", __FILE__, __LINE__);
  str->val = malloc(strlen(self->val) + strlen(other->val) + 1);

  strcpy(str->val, self->val);
  strcat(str->val, other->val);
  return str;
}

String *String_substr(String *self, int begin, int len)
{
  String *str;
  int l = strlen(self->val);
  if (begin + len > l)
  {
    fprintf(stderr, "At %s(line %d): Substring out of range in String::substr()\n",
            __FILE__, __LINE__);
    Object_abort((Object *)self);
  }
  str = String_new();
  str->val = malloc(len + 1);
  for (int i = 0; i < len; ++i)
  {
    str->val[i] = self->val[begin + i];
  }
  str->val[len] = '\0';
  return str;
}