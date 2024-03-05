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
  Object_vtable *vtblptr;
};

struct Int
{
  /* ADD CODE HERE */
  Int_vtable *vtblptr;
  int val;
};

struct Bool
{
  /* ADD CODE HERE */
  Bool_vtable *vtblptr;
  bool val;
};

struct String
{
  /* ADD CODE HERE */
  String_vtable *vtblptr;
  char* val;
};

struct IO
{
  /* ADD CODE HERE */
  IO_vtable *vtblptr;
};

/* vtable type definitions */
struct _Object_vtable
{
  /* ADD CODE HERE */
  int attr;
  int size;
  char* name;
  Object *(*object_new)();
  Object *(*object_abort)(Object *);
  const String *(*object_type_name)(Object *);
  Object *(*object_copy)(Object *);
};

struct _Int_vtable
{
  /* ADD CODE HERE */
  int attr;
  int size;
  char* name;
  Int *(*new)();
  Object *(*abort)(Int *);
  const String *(*type_name)(Int *);
  Int *(*copy)(Int *);
};

struct _Bool_vtable
{
  /* ADD CODE HERE */
  int attr;
  int size;
  char* name;
  Bool *(*new)();
  Object *(*abort)(Bool *);
  const String *(*type_name)(Bool *);
  Bool *(*copy)(Bool *);
};

struct _String_vtable
{
  /* ADD CODE HERE */
  int attr;
  int size;
  char* name;
  String *(*new)();
  Object *(*abort)(String *);
  const String *(*type_name)(String *);
  String *(*copy)(String *);
  int (*length)(String *);
  String *(*concat)(String *, String *);
  String *(*substr)(String *, int, int);
};

struct _IO_vtable
{
  /* ADD CODE HERE */
  int attr;
  int size;
  char* name;
  IO *(*new)();
  Object *(*abort)(IO *);
  const IO *(*type_name)(IO *);
  IO *(*copy)(IO *);
  IO *(*out_string)(IO *, String *);
  IO *(*out_int)(IO *, int);
  IO *(*in_string)(IO *);
  IO *(*in_int)(IO *);
};

/* methods in class Object */
Object *Object_new();
Object *Object_abort(Object *self);
const String *Object_type_name(Object *self);
Object *Object_copy(Object *self);
/* ADD CODE HERE */

/* methods in class Int */
/* ADD CODE HERE */
Int *Int_new();
void Int_init(Int* o, int i);

/* methods in class Bool */
/* ADD CODE HERE */
Bool *Bool_new();
void Bool_init(Bool *o, bool b);

/* methods in class String */
/* ADD CODE HERE */
String *String_new();
int String_length(String *self);
String *String_concat(String *self, String *other);
String *String_substr(String *self, int begin, int len);

/* methods in class IO */
IO *IO_new(void);
IO *IO_out_string(IO *self, String *s);
IO *IO_out_int(IO *self, int x);
String *IO_in_string(IO *self);
int IO_in_int(IO *self);
