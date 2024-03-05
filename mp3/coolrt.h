/*
 * This file provides the runtime library for cool. It implements
 * the cool classes in C.  Feel free to change it to match the structure
 * of your code generator.
 */

#include <stdbool.h>

typedef struct Object Object;
typedef struct Int Int;
typedef struct Bool Bool;
typedef struct String String;
typedef struct IO IO;

typedef struct _Object_vtable Object_vtable;
typedef struct _Int_vtable Int_vtable;
typedef struct _Bool_vtable Bool_vtable;
typedef struct _String_vtable String_vtable;
typedef struct _IO_vtable IO_vtable;

/* class type definitions */
struct Object
{
  /* ADD CODE HERE */
  _Object_vtable *vtable_ptr;
};

struct Int
{
  /* ADD CODE HERE */
  _Int_vtable *vtable_ptr;
  int val;
};

struct Bool
{
  /* ADD CODE HERE */
};

struct String
{
  /* ADD CODE HERE */
};

struct IO
{
  /* ADD CODE HERE */
};

/* vtable type definitions */
struct _Object_vtable
{
  /* ADD CODE HERE */
  int attr;
  Object *(*object_new)();
  Object *(*object_abort)(Object *);
  const String *(*object_type_name)(Object *);
  Object *(*object_copy)(Object *);
};

struct _Int_vtable
{
  /* ADD CODE HERE */
};

struct _Bool_vtable
{
  /* ADD CODE HERE */
};

struct _String_vtable
{
  /* ADD CODE HERE */
};

struct _IO_vtable
{
  /* ADD CODE HERE */
};

/* methods in class Object */
Object *Object_new();
Object *Object_abort(Object *self);
const String *Object_type_name(Object *self);
Object *Object_copy(Object *self);
/* ADD CODE HERE */

/* methods in class Int */
/* ADD CODE HERE */

/* methods in class Bool */
/* ADD CODE HERE */

/* methods in class String */
/* ADD CODE HERE */

/* methods in class IO */
IO *IO_new(void);
IO *IO_out_string(IO *self, String *s);
IO *IO_out_int(IO *self, int x);
String *IO_in_string(IO *self);
int IO_in_int(IO *self);
