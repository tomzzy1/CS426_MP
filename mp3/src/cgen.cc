//**************************************************************
//
// Code generator SKELETON
//
// Read the comments carefully and add code to build an LLVM program
//**************************************************************

#define EXTERN
#include "cgen.h"
#include <sstream>
#include <string>
#include <algorithm>

#define MP3
//
extern int cgen_debug;

//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.  Feel free to add your
// own definitions as you see fit.
//
//////////////////////////////////////////////////////////////////////
EXTERN Symbol
    // required classes
    Object,
    IO, String, Int, Bool, Main,

    // class methods
    cool_abort, type_name, cool_copy, out_string, out_int, in_string, in_int,
    length, concat, substr,

    // class members
    val,

    // special symbols
    No_class,  // symbol that can't be the name of any user-defined class
    No_type,   // If e : No_type, then no code is generated for e.
    SELF_TYPE, // Special code is generated for new SELF_TYPE.
    self,      // self generates code differently than other references

    // extras
    arg, arg2, prim_string, prim_int, prim_bool;

//********************************************************
//
// PREDEFINED FUNCTIONS:
//
// The following functions are already coded, you should
// not need to modify them, although you may if necessary.
//
//********************************************************

//
// Initializing the predefined symbols.
//
static void initialize_constants(void) {
  Object = idtable.add_string("Object");
  IO = idtable.add_string("IO");
  String = idtable.add_string("String");
  Int = idtable.add_string("Int");
  Bool = idtable.add_string("Bool");
  Main = idtable.add_string("Main");

  cool_abort = idtable.add_string("abort");
  type_name = idtable.add_string("type_name");
  cool_copy = idtable.add_string("copy");
  out_string = idtable.add_string("out_string");
  out_int = idtable.add_string("out_int");
  in_string = idtable.add_string("in_string");
  in_int = idtable.add_string("in_int");
  length = idtable.add_string("length");
  concat = idtable.add_string("concat");
  substr = idtable.add_string("substr");

  val = idtable.add_string("val");

  No_class = idtable.add_string("_no_class");
  No_type = idtable.add_string("_no_type");
  SELF_TYPE = idtable.add_string("SELF_TYPE");
  self = idtable.add_string("self");

  arg = idtable.add_string("arg");
  arg2 = idtable.add_string("arg2");
  prim_string = idtable.add_string("sbyte*");
  prim_int = idtable.add_string("int");
  prim_bool = idtable.add_string("bool");
}

//*********************************************************
//
// Define method for code generation
//
// This is the method called by the compiler driver
// `cgtest.cc'. cgen takes an `ostream' to which the assembly will be
// emitted, and it passes this and the class list of the
// code generator tree to the constructor for `CgenClassTable'.
// That constructor performs all of the work of the code
// generator.
//
//*********************************************************
void program_class::cgen(ostream &os) {
  initialize_constants();
  class_table = new CgenClassTable(classes, os);
}

// Create definitions for all String constants
void StrTable::code_string_table(ostream &s, CgenClassTable *ct) {
  for (auto entry : tbl) {
    entry->code_def(s, ct);
  }
}

// Create definitions for all Int constants
void IntTable::code_string_table(ostream &s, CgenClassTable *ct) {
  for (auto entry : tbl) {
    entry->code_def(s, ct);
  }
}

//
// Sets up declarations for extra functions needed for code generation
// You should not need to modify this code for MP2.1
//
void CgenClassTable::setup_external_functions() {
  ValuePrinter vp(*ct_stream);
  // setup function: external int strcmp(sbyte*, sbyte*)
  op_type i32_type(INT32), i8ptr_type(INT8_PTR), vararg_type(VAR_ARG);
  vector<op_type> strcmp_args;
  strcmp_args.push_back(i8ptr_type);
  strcmp_args.push_back(i8ptr_type);
  vp.declare(*ct_stream, i32_type, "strcmp", strcmp_args);

  // setup function: external int printf(sbyte*, ...)
  vector<op_type> printf_args;
  printf_args.push_back(i8ptr_type);
  printf_args.push_back(vararg_type);
  vp.declare(*ct_stream, i32_type, "printf", printf_args);

  // setup function: external void abort(void)
  op_type void_type(VOID);
  vector<op_type> abort_args;
  vp.declare(*ct_stream, void_type, "abort", abort_args);

  // setup function: external i8* malloc(i32)
  vector<op_type> malloc_args;
  malloc_args.push_back(i32_type);
  vp.declare(*ct_stream, i8ptr_type, "malloc", malloc_args);

#ifdef MP3
  // ADD CODE HERE
  // Setup external functions for built in object class functions
  op_type object_ptr_type("Object", 1);
  op_type string_ptr_type("String", 1);
  op_type io_ptr_type("IO", 1);
  op_type int_ptr_type("Int", 1);
  op_type bool_ptr_type("Bool", 1);
  vp.declare(object_ptr_type, "Object_new", {});
  vp.declare(object_ptr_type, "Object_abort", {object_ptr_type});
  vp.declare(string_ptr_type, "Object_type_name", {object_ptr_type});
  vp.declare(object_ptr_type, "Object_copy", {object_ptr_type});
  vp.declare(io_ptr_type, "IO_new", {});
  vp.declare(io_ptr_type, "IO_out_string", {io_ptr_type, string_ptr_type});
  vp.declare(io_ptr_type, "IO_out_int", {io_ptr_type, i32_type});
  vp.declare(string_ptr_type, "IO_in_string", {io_ptr_type});
  vp.declare(i32_type, "IO_in_int", {io_ptr_type});
  vp.declare(string_ptr_type, "String_new", {});
  vp.declare(i32_type, "String_length", {string_ptr_type});
  vp.declare(string_ptr_type, "String_concat", {string_ptr_type, string_ptr_type});
  vp.declare(string_ptr_type, "String_substr", {string_ptr_type, i32_type, i32_type});
  vp.declare(int_ptr_type, "Int_new", {});
  vp.declare(void_type, "Int_init", {int_ptr_type, i32_type});
  vp.declare(bool_ptr_type, "Bool_new", {});
  vp.declare(void_type, "Bool_init", {bool_ptr_type, op_type(INT1)});
#endif
}

// Creates AST nodes for the basic classes and installs them in the class list
void CgenClassTable::install_basic_classes() {
  // The tree package uses these globals to annotate the classes built below.
  curr_lineno = 0;
  Symbol filename = stringtable.add_string("<basic class>");

  //
  // A few special class names are installed in the lookup table but not
  // the class list. Thus, these classes exist, but are not part of the
  // inheritance hierarchy.

  // No_class serves as the parent of Object and the other special classes.
  Class_ noclasscls = class_(No_class, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(noclasscls, CgenNode::Basic, this));
  delete noclasscls;

#ifdef MP3
  // SELF_TYPE is the self class; it cannot be redefined or inherited.
  Class_ selftypecls = class_(SELF_TYPE, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(selftypecls, CgenNode::Basic, this));
  delete selftypecls;
  //
  // Primitive types masquerading as classes. This is done so we can
  // get the necessary Symbols for the innards of String, Int, and Bool
  //
  Class_ primstringcls =
      class_(prim_string, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(primstringcls, CgenNode::Basic, this));
  delete primstringcls;
#endif
  Class_ primintcls = class_(prim_int, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(primintcls, CgenNode::Basic, this));
  delete primintcls;
  Class_ primboolcls = class_(prim_bool, No_class, nil_Features(), filename);
  install_special_class(new CgenNode(primboolcls, CgenNode::Basic, this));
  delete primboolcls;
  //
  // The Object class has no parent class. Its methods are
  //        cool_abort() : Object   aborts the program
  //        type_name() : Str       returns a string representation of class
  //        name copy() : SELF_TYPE      returns a copy of the object
  //
  // There is no need for method bodies in the basic classes---these
  // are already built in to the runtime system.
  //
  Class_ objcls = class_(
      Object, No_class,
      append_Features(
          append_Features(single_Features(method(cool_abort, nil_Formals(),
                                                 Object, no_expr())),
                          single_Features(method(type_name, nil_Formals(),
                                                 String, no_expr()))),
          single_Features(
              method(cool_copy, nil_Formals(), SELF_TYPE, no_expr()))),
      filename);
  install_class(new CgenNode(objcls, CgenNode::Basic, this));
  delete objcls;

  //
  // The Int class has no methods and only a single attribute, the
  // "val" for the integer.
  //
  Class_ intcls = class_(
      Int, Object, single_Features(attr(val, prim_int, no_expr())), filename);
  install_class(new CgenNode(intcls, CgenNode::Basic, this));
  delete intcls;

  //
  // Bool also has only the "val" slot.
  //
  Class_ boolcls = class_(
      Bool, Object, single_Features(attr(val, prim_bool, no_expr())), filename);
  install_class(new CgenNode(boolcls, CgenNode::Basic, this));
  delete boolcls;

#ifdef MP3
  //
  // The class String has a number of slots and operations:
  //       val                                  the string itself
  //       length() : Int                       length of the string
  //       concat(arg: Str) : Str               string concatenation
  //       substr(arg: Int, arg2: Int): Str     substring
  //
  Class_ stringcls =
      class_(String, Object,
             append_Features(
                 append_Features(
                     append_Features(
                         single_Features(attr(val, prim_string, no_expr())),
                         single_Features(
                             method(length, nil_Formals(), Int, no_expr()))),
                     single_Features(method(concat,
                                            single_Formals(formal(arg, String)),
                                            String, no_expr()))),
                 single_Features(
                     method(substr,
                            append_Formals(single_Formals(formal(arg, Int)),
                                           single_Formals(formal(arg2, Int))),
                            String, no_expr()))),
             filename);
  install_class(new CgenNode(stringcls, CgenNode::Basic, this));
  delete stringcls;
#endif

#ifdef MP3
  //
  // The IO class inherits from Object. Its methods are
  //        out_string(Str) : SELF_TYPE          writes a string to the output
  //        out_int(Int) : SELF_TYPE               "    an int    "  "     "
  //        in_string() : Str                    reads a string from the input
  //        in_int() : Int                         "   an int     "  "     "
  //
  Class_ iocls = class_(
      IO, Object,
      append_Features(
          append_Features(
              append_Features(
                  single_Features(method(out_string,
                                         single_Formals(formal(arg, String)),
                                         SELF_TYPE, no_expr())),
                  single_Features(method(out_int,
                                         single_Formals(formal(arg, Int)),
                                         SELF_TYPE, no_expr()))),
              single_Features(
                  method(in_string, nil_Formals(), String, no_expr()))),
          single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
      filename);
  install_class(new CgenNode(iocls, CgenNode::Basic, this));
  delete iocls;
#endif
}

//
// install_classes enters a list of classes in the symbol table.
//
void CgenClassTable::install_classes(Classes cs) {
  for (auto cls : cs) {
    install_class(new CgenNode(cls, CgenNode::NotBasic, this));
  }
}

//
// Add this CgenNode to the class list and the lookup table
//
void CgenClassTable::install_class(CgenNode *nd) {
  Symbol name = nd->get_name();

  if (probe(name))
    return;

  // The class name is legal, so add it to the list of classes
  // and the symbol table.
  nds = new List<CgenNode>(nd, nds);
  addid(name, nd);
}

//
// Add this CgenNode to the special class list and the lookup table
//
void CgenClassTable::install_special_class(CgenNode *nd) {
  Symbol name = nd->get_name();

  if (probe(name))
    return;

  // The class name is legal, so add it to the list of special classes
  // and the symbol table.
  special_nds = new List<CgenNode>(nd, special_nds);
  addid(name, nd);
}

//
// CgenClassTable::build_inheritance_tree
//
void CgenClassTable::build_inheritance_tree() {
  for (auto node : nds)
    set_relations(node);
}

//
// CgenClassTable::set_relations
//
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table.  Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNode *nd) {
  CgenNode *parent_node = probe(nd->get_parent());
  nd->set_parentnd(parent_node);
  parent_node->add_child(nd);
}

// Get the root of the class tree.
CgenNode *CgenClassTable::root() { return probe(Object); }

//////////////////////////////////////////////////////////////////////
//
// Special-case functions used for the method Int Main::main() for
// MP2 only.
//
//////////////////////////////////////////////////////////////////////

#ifndef MP3

CgenNode *CgenClassTable::getMainmain(CgenNode *c) {
  if (c && !c->basic())
    return c; // Found it!

  for (auto child : c->get_children()) {
    if (CgenNode *foundMain = this->getMainmain(child))
      return foundMain; // Propagate it up the recursive calls
  }

  return 0; // Make the recursion continue
}

#endif

//-------------------------------------------------------------------
//
// END OF PREDEFINED FUNCTIONS
//
//-------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////////////
//
// coding string, int, and boolean constants
//
// Cool has three kinds of constants: strings, ints, and booleans.
// This section defines code generation for each type.
//
// All string constants are listed in the global "stringtable" and have
// type stringEntry.  stringEntry methods are defined both for string
// constant definitions and references.
//
// All integer constants are listed in the global "inttable" and have
// type IntEntry.  IntEntry methods are defined for Int
// constant definitions and references.
//
// Since there are only two Bool values, there is no need for a table.
// The two booleans are represented by instances of the class BoolConst,
// which defines the definition and reference methods for Bools.
//
///////////////////////////////////////////////////////////////////////////////

//
// Create global definitions for constant Cool objects
//
void CgenClassTable::code_constants() {
#ifdef MP3
  // ADD CODE HERE
  stringtable.code_string_table(*ct_stream, this);
#endif
}

// generate code to define a global string constant
void StringEntry::code_def(ostream &s, CgenClassTable *ct) {
#ifdef MP3
  // ADD CODE HERE
  ValuePrinter vp(s);
  string new_str_n = ct->new_str_n();
  string str = "str" + new_str_n;
  string String = "String" + new_str_n;
  op_arr_type arr_t(INT8, get_len() + 1);
  const_value cv1(arr_t, get_string(), true);
  vp.init_constant(str, cv1);
  op_type vtable_t("_String_vtable", 1);
  const_value vtable_v(vtable_t, "@_String_vtable_prototype", true);
  const_value get_v(arr_t, "@" + str, true);
  vector<op_type> field_types;
  field_types.push_back(vtable_t);
  field_types.push_back(INT8_PTR);
  vector<const_value> init_values;
  init_values.push_back(vtable_v);
  init_values.push_back(get_v);
  global_value String_op(op_type("String"), String);
  vp.init_struct_constant(String_op, field_types, init_values);
  global_string_table[get_string()] = global_value(op_type("String", 1), String);  
#endif
}

// generate code to define a global int constant
void IntEntry::code_def(ostream &s, CgenClassTable *ct) {
  // Leave this method blank, since we are not going to use global
  // declarations for int constants.
}

//////////////////////////////////////////////////////////////////////////////
//
//  CgenClassTable methods
//
//////////////////////////////////////////////////////////////////////////////

//
// CgenClassTable constructor orchestrates all code generation
//
CgenClassTable::CgenClassTable(Classes classes, ostream &s) : nds(0) {
  if (cgen_debug)
    std::cerr << "Building CgenClassTable" << endl;
  ct_stream = &s;
  // Make sure we have a scope, both for classes and for constants
  enterscope();

  // Create an inheritance tree with one CgenNode per class.
  install_basic_classes();
  install_classes(classes);
  build_inheritance_tree();

  // First pass
  setup();

  // Second pass
  code_module();
  // Done with code generation: exit scopes
  exitscope();
}

CgenClassTable::~CgenClassTable() {}

// The code generation first pass.  Define these two functions to traverse
// the tree and setup each CgenNode
void CgenClassTable::setup() {
  setup_external_functions();
  setup_classes(root(), 0);
}

void CgenClassTable::setup_classes(CgenNode *c, int depth) {
  // MAY ADD CODE HERE
  // if you want to give classes more setup information

  c->setup(current_tag++, depth);
  for (auto child : c->get_children())
    setup_classes(child, depth + 1);

  c->set_max_child(current_tag - 1);

  /*
  if (cgen_debug)
          std::cerr << "Class " << c->get_name() << " assigned tag "
                  << c->get_tag() << ", max child " << c->get_max_child()
                  << ", depth " << c->get_depth() << endl;
  */
}

// The code generation second pass. Add code here to traverse the tree and
// emit code for each CgenNode
void CgenClassTable::code_module() {
  code_constants();

#ifndef MP3
  // This must be after code_module() since that emits constants
  // needed by the code() method for expressions
  CgenNode *mainNode = getMainmain(root());
  mainNode->codeGenMainmain();
#endif
  code_main();

#ifdef MP3
  code_classes(root());
#else
#endif
}

#ifdef MP3
void CgenClassTable::code_classes(CgenNode *c) {

  // ADD CODE HERE
  c->code_class();

  for (auto child : c->get_children())
    code_classes(child);

    
}
#endif

//
// Create LLVM entry point. This function will initiate our Cool program
// by generating the code to execute (new Main).main()
//
void CgenClassTable::code_main(){
// Define a function main that has no parameters and returns an i32

// Define an entry basic block

// Call Main_main(). This returns int* for phase 1, Object for phase 2
  
  ValuePrinter vp(*ct_stream);
#ifndef MP3
// Get the address of the string "Main_main() returned %d\n" using
// getelementptr

// Call printf with the string address of "Main_main() returned %d\n"
// and the return value of Main_main() as its arguments

// Insert return 0
  op_arr_type arr_type(INT8, 25);
  global_value str(arr_type.get_ptr_type(), "main.printout.str");
  const_value val(INT32, "0", true);

  vp.init_constant("main.printout.str", const_value(arr_type, "Main.main() returned %d\n\0", true));
  vp.define(op_type(INT32), "main", {});
  vp.begin_block("entry");
  operand temp0 = vp.call({}, op_type(INT32), "Main.main", true, {});
  
  operand temp1 = vp.getelementptr(arr_type, str, val, val, op_type(INT8));
  temp1.set_type(temp1.get_type().get_ptr_type());
  vector<op_type> arg_types;
  arg_types.push_back(op_type(INT8_PTR));
  arg_types.push_back(op_type(VAR_ARG));
  vector<operand> args;
  args.push_back(temp1);
  args.push_back(temp0);
  vp.call(arg_types, op_type(INT32), "printf", true, args);
  vp.ret(val);
  vp.end_define();
#else
  vp.define(op_type(INT32), "main", {});
  vp.begin_block("entry");
  operand obj(op_type("Main", 1), "main.obj");
  vp.call(*ct_stream, {}, "Main_new", true, {}, obj);
  operand retval(main_return_type, "main.retval");
  vp.call(*ct_stream, {op_type("Main", 1)}, "Main.main", true, {obj}, retval);
  const_value val(INT32, "0", true);
  vp.ret(val);
  vp.end_define();
  
// MP 3
#endif

}

///////////////////////////////////////////////////////////////////////
//
// CgenNode methods
//
///////////////////////////////////////////////////////////////////////

CgenNode::CgenNode(Class_ nd, Basicness bstatus, CgenClassTable *ct)
    : class__class((const class__class &)*nd), parentnd(0), children(0),
      basic_status(bstatus), class_table(ct), tag(-1) {
  // ADD CODE HERE
}

void CgenNode::add_child(CgenNode *n) {
  children = new List<CgenNode>(n, children);
}

void CgenNode::set_parentnd(CgenNode *p) {
  assert(parentnd == NULL);
  assert(p != NULL);
  parentnd = p;
}

//
// Class setup.  You may need to add parameters to this function so that
// the classtable can provide setup information (such as the class tag
// that should be used by this class).
//
// Things that setup should do:
//  - layout the features of the class
//  - create the types for the class and its vtable
//  - create global definitions used by the class such as the class vtable
//
void CgenNode::setup(int tag, int depth) {
  this->tag = tag;
#ifdef MP3
  layout_features();

  // ADD CODE HERE

#endif
}

#ifdef MP3
//
// Class codegen. This should performed after every class has been setup.
// Generate code for each method of the class.
//
void CgenNode::code_class() {
  // No code generation for basic classes. The runtime will handle that.
  if (basic())
    return;

  // ADD CODE HERE
  CgenEnvironment env(*class_table->ct_stream, this);
  for (int i = features->first(); features->more(i); i = features->next(i))
  {
    features->nth(i)->code(&env);
  }
  //generate the new() function
  ValuePrinter vp(*class_table->ct_stream);
  string class_name(env.get_class()->get_type_name());
  op_type self_type(class_name, 1);

  vp.define(self_type, class_name + '_' + "new", {});

  vp.begin_block("entry");
  operand alloca_op;
  alloca_op = vp.alloca_mem(self_type);
  env.self = alloca_op;

  for (size_t i = 1; i < env.get_class()->attrs.size(); ++i)
  {
    // alloc for initilization
    env.get_class()->attr_inits[i]->make_alloca(&env);
  }


  int_value zero_i32(0);
  op_type vtblptr_type('_' + class_name + "_vtable", 1);
  global_value vtbl_prototype(vtblptr_type, "_" + class_name + "_vtable_prototype");
  operand size_ptr = vp.getelementptr(vtblptr_type.get_deref_type(), vector<operand>{
    vtbl_prototype, zero_i32, int_value(1)
  }, op_type(INT32_PTR));
  operand size = vp.load(op_type(INT32), size_ptr);
  operand memory = vp.call({op_type(INT32)}, op_type(INT8_PTR), "malloc", true, {size});
  operand object = vp.bitcast(memory, self_type);
  operand malloc_null = vp.icmp(EQ, object, null_value(op_type()));
  string ok = env.new_ok_label();

  vp.branch_cond(malloc_null, "abort", ok);
  vp.begin_block(ok);

  //load vtable pointer
  operand vtblpptr = vp.getelementptr(self_type.get_deref_type(), vector<operand>{
    object, zero_i32, zero_i32,
  }, vtblptr_type.get_ptr_type());
  vp.store(vtbl_prototype, vtblpptr);
  vp.store(object, alloca_op);

  for (size_t i = 1; i < env.get_class()->attrs.size(); ++i)
  {
    // store default value
    op_type attr_type = env.get_class()->attrs[i];
    op_type object_type(object.get_type());
    operand attr_ptr = vp.getelementptr(object_type.get_deref_type(),
      object, int_value(0), int_value(i)
      , attr_type.get_ptr_type());
    
    if (attr_type.get_id() == INT32)
      vp.store(int_value(0), attr_ptr);
    else if (attr_type.get_id() == INT1)
      vp.store(bool_value(false, true), attr_ptr);
    else
      vp.store(null_value(attr_ptr.get_type().get_deref_type()), attr_ptr);
  }

  for (size_t i = 1; i < env.get_class()->attrs.size(); ++i)
  {
    // initilization
    op_type attr_type = env.get_class()->attrs[i];
    operand res = env.get_class()->attr_inits[i]->code(&env);
    if (!res.is_empty())
    {
      auto attr = vp.getelementptr(object.get_type().get_deref_type(),
      object, int_value(0), int_value(i)
      , attr_type.get_ptr_type());
      res = conform(res, attr_type, &env); // boxing
      //res = conform(res, attr_type, &env); // bitcast if necessary
      vp.store(conform(res, attr_type, &env), attr);
    }
    
  }

  vp.ret(object);
  vp.begin_block("abort");
  vp.call({}, op_type(VOID), "abort", true, {});
  vp.unreachable();
  vp.end_define();
}

// Laying out the features involves creating a Function for each method
// and assigning each attribute a slot in the class structure.
void CgenNode::layout_features() {
  // ADD CODE HERE
  ValuePrinter vp(*class_table->ct_stream);

  string class_name = get_type_name();
  string parent_name = parentnd->get_type_name();
  string vtable_name = "_" + class_name + "_vtable";
  vector<op_type> vtable;

  vtable.push_back(op_type(INT32));
  vtable.push_back(op_type(INT32));
  vtable.push_back(op_type(INT8_PTR));
  vtable.push_back(op_func_type(op_type(class_name, 1), {}));

  // The first element is virtual table pointer
  attrs.push_back(op_type(vtable_name).get_ptr_type());
  attr_inits.push_back(nullptr);
  attr_names.push_back("vtable"); // align the three containers

  // inherit parent's attributes
  for (size_t i = 1; i < parentnd->attrs.size(); ++i)
  {
    attrs.push_back(parentnd->attrs[i]);
    attr_inits.push_back(parentnd->attr_inits[i]);
    attr_names.push_back(parentnd->attr_names[i]);
  }

  methods = parentnd->methods;
  method_names = parentnd->method_names;
  methods_replaced = parentnd->methods_replaced;

  for (int i = features->first(); features->more(i); i = features->next(i))
  {
    Feature f = features->nth(i);
    f->layout_feature(this);
  }

  for (size_t i = 0; i < methods.size(); ++i)
  {
    op_func_type r = methods[i].replace_self_type(class_name);
    vtable.push_back(r);
    //vtable2.push_back(r);
    vtable_final[method_names[i]] = r;
    if (override_index.find(i) != override_index.end())
    {
      methods_replaced[i] = methods[i].replace_self_type(class_name);
    }
    if (i >= parentnd->methods.size())
      methods_replaced.push_back(r);
  }

  const_value class_name_val(op_arr_type(INT8, class_name.size() + 1), class_name, true);
  vp.init_constant("str." + class_name, class_name_val);

  vp.type_define(class_name, attrs);

  vp.type_define(vtable_name, vtable);
  vector<const_value> init_values;
  init_values.push_back(int_value(get_tag()));
  string compute_size = "ptrtoint (%" + class_name + "* getelementptr (%" + class_name + 
  ", %" + class_name + "* null, i32 1) to i32)";
  
  init_values.push_back(const_value(op_type(), compute_size, true));
  init_values.push_back(const_value(op_arr_type(INT8, class_name.size() + 1), 
  "@str." + class_name, true));

  init_values.push_back(const_value(op_type(), '@' + class_name + "_new", true));
  //cout << parentnd->methods.size() << ' ' << methods_replaced.size() << ' ' << parentnd->method_names.size() << '\n';
  for (size_t i = 0; i < parentnd->methods.size(); ++i)
  {
    if (override_index.find(i) == override_index.end())
    {
      string bitcast_name = "bitcast (" + 
      methods_replaced[i].get_name() + " @" + 
      parentnd->method_names[i] + " to " + 
      parentnd->methods[i].replace_self_type(class_name).get_name() + ")";
      init_values.push_back(const_value(op_type(), bitcast_name, true));
    }
    else
    {
      init_values.push_back(const_value(op_type(), 
        '@' + method_names[i], true));
    }
    
  }
  //cout << class_name << '\n';
  for (size_t i = parentnd->method_names.size(); i < method_names.size(); ++i)
  {
    init_values.push_back(const_value(op_type(), 
      '@' + method_names[i], true));
  }
  vp.init_struct_constant(global_value(op_type(vtable_name), vtable_name + "_prototype"),
   vtable, init_values);
}
#else

//
// code-gen function main() in class Main
//
void CgenNode::codeGenMainmain() {
  ValuePrinter vp;
  // In Phase 1, this can only be class Main. Get method_class for main().
  assert(std::string(this->name->get_string()) == std::string("Main"));
  method_class *mainMethod = (method_class *)features->nth(features->first());

  // ADD CODE HERE TO GENERATE THE FUNCTION int Mainmain().
  // Generally what you need to do are:
  // -- setup or create the environment, env, for translating this method
  // -- invoke mainMethod->code(env) to translate the method
  CgenEnvironment env(*class_table->ct_stream, this);
  mainMethod->code(&env);
}

#endif

//
// CgenEnvironment functions
//

//
// Class CgenEnvironment should be constructed by a class prior to code
// generation for each method.  You may need to add parameters to this
// constructor.
//
CgenEnvironment::CgenEnvironment(std::ostream &o, CgenNode *c) {
  cur_class = c;
  cur_stream = &o;
  var_table.enterscope();
  tmp_count = block_count = ok_count = 0;
  // ADD CODE HERE
}

// Look up a CgenNode given a symbol
CgenNode *CgenEnvironment::type_to_class(Symbol t) {
  return t == SELF_TYPE ? get_class()
                        : get_class()->get_classtable()->lookup(t);
}

// Provided CgenEnvironment methods
// Generate unique string names
std::string CgenEnvironment::new_name() {
  std::stringstream s;
  s << tmp_count++;
  return "tmp." + s.str();
}

std::string CgenEnvironment::new_ok_label() {
  std::stringstream s;
  s << ok_count++;
  return "ok." + s.str();
}
const std::string CgenEnvironment::new_label(const std::string &prefix,
                                             bool increment) {
  std::string suffix = itos(block_count);
  block_count += increment;
  return prefix + suffix;
}

void CgenEnvironment::add_local(Symbol name, operand &vb) {
  var_table.enterscope();
  var_table.addid(name, &vb);
}

void CgenEnvironment::kill_local() { var_table.exitscope(); }

////////////////////////////////////////////////////////////////////////////
//
// APS class methods
//
////////////////////////////////////////////////////////////////////////////

//******************************************************************
//
//   Fill in the following methods to produce code for the
//   appropriate expression.  You may add or remove parameters
//   as you wish, but if you do, remember to change the parameters
//   of the declarations in `cool-tree.handcode.h'.
//
//*****************************************************************

#ifdef MP3
// conform and get_class_tag are only needed for MP3

// conform - If necessary, emit a bitcast or boxing/unboxing operations
// to convert an object to a new type. This can assume the object
// is known to be (dynamically) compatible with the target type.
// It should only be called when this condition holds.
// (It's needed by the supplied code for typecase)
operand conform(operand src, op_type type, CgenEnvironment *env) {
  // ADD CODE HERE (MP3 ONLY)
  std::cerr << src.get_typename() << ' ' << type.get_name() << endl;
  ValuePrinter vp(*env->cur_stream);
  if (src.get_typename() == type.get_name())
    return src;
  
  if (src.get_typename() == "i32" && type.get_id() == OBJ_PTR)
  {
    operand int_ptr = vp.call({}, op_type("Int", 1), "Int_new", true, {});
    vp.call({op_type("Int", 1), op_type(INT32)}, op_type(VOID), "Int_init", true, {int_ptr, src});
    return int_ptr;
  }
  if (src.get_typename() == "i1" && type.get_id() == OBJ_PTR)
  {
    operand bool_ptr = vp.call({}, op_type("Bool", 1), "Bool_new", true, {});
    vp.call({op_type("Bool", 1), op_type(INT1)}, op_type(VOID), "Bool_init", true, {bool_ptr, src});
    return bool_ptr;
  }
  if (type.get_id() == INT32)
  {
    operand int_object = vp.bitcast(src, op_type("Int", 1));
    operand int_ptr = vp.getelementptr(op_type("Int"), int_object, 
      int_value(0), int_value(1), op_type(INT32_PTR));
    return vp.load(int_ptr.get_type().get_deref_type(), int_ptr);
  }
  if (type.get_id() == INT1)
  {
    operand bool_object = vp.bitcast(src, op_type("Bool", 1));
    operand bool_ptr = vp.getelementptr(op_type("Bool"), bool_object, 
      int_value(0), int_value(1), op_type(INT1_PTR));
    return vp.load(bool_ptr.get_type().get_deref_type(), bool_ptr);
  }
  return vp.bitcast(src, type);
}

operand cast(operand src, op_type type, CgenEnvironment *env)
{
  // no option
  ValuePrinter vp(*env->cur_stream);
  if (src.get_typename() == type.get_name())
    return src;
  //boxing
  if (type.is_int_object() && src.get_typename() == "i32")
  {
    operand int_ptr = vp.call({}, op_type("Int", 1), "Int_new", true, {});
    vp.call({op_type("Int", 1), op_type(INT32)}, op_type(VOID), "Int_init", true, {int_ptr, src});
    return int_ptr;
  }
  if (type.is_bool_object() && src.get_typename() == "i1")
  {
    operand bool_ptr = vp.call({}, op_type("Bool", 1), "Bool_new", true, {});
    vp.call({op_type("Bool", 1), op_type(INT1)}, op_type(VOID), "Bool_init", true, {bool_ptr, src});
    return bool_ptr;
  }
  //unboxing
  op_type src_type = src.get_type();
  if (src_type.is_int_object() && type.get_name() == "i32")
  {
    auto val_ptr = vp.getelementptr(op_type("Int"), src, 
      int_value(0), int_value(1), op_type(INT32_PTR));
    auto val = vp.load(op_type(INT32), val_ptr);
    return val;
  }
  if (src_type.is_bool_object() && type.get_name() == "i1")
  {
    auto val_ptr = vp.getelementptr(op_type("Bool"), src, 
      int_value(0), int_value(1), op_type(INT1_PTR));
    auto val = vp.load(op_type(INT1), val_ptr);
    return val;
  }
  return vp.bitcast(src, type);
}

operand box(operand src, op_type type, CgenEnvironment *env) {
  // ADD CODE HERE (MP3 ONLY)
  ValuePrinter vp(*env->cur_stream);
  if (src.get_typename() == type.get_name())
    return src;
  
  if (type.is_int_object())
  {
    operand int_ptr = vp.call({}, op_type("Int", 1), "Int_new", true, {});
    vp.call({op_type("Int", 1), op_type(INT32)}, op_type(VOID), "Int_init", true, {int_ptr, src});
    return int_ptr;
  }
  if (type.is_bool_object())
  {
    operand bool_ptr = vp.call({}, op_type("Bool", 1), "Bool_new", true, {});
    vp.call({op_type("Bool", 1), op_type(INT1)}, op_type(VOID), "Bool_init", true, {bool_ptr, src});
    return bool_ptr;
  }
  return vp.bitcast(src, type);
}

// Retrieve the class tag from an object record.
// src is the object we need the tag from.
// src_class is the CgenNode for the *static* class of the expression.
// You need to look up and return the class tag for it's dynamic value
operand get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env) {
  // ADD CODE HERE (MP3 ONLY)
  ValuePrinter vp(*env->cur_stream);
  string type_name = src.get_typename();
  string class_name = type_name.substr(1, type_name.size() - 2);
  //std::cerr << class_name << endl;
  op_type vtblpptr_type("_" + class_name + "_vtable", 2);
  operand vtblpptr = vp.getelementptr(src.get_type().get_deref_type(), 
    src, int_value(0), int_value(0), vtblpptr_type);
  operand vtable_ptr = vp.load(vtblpptr_type.get_deref_type(), vtblpptr);
  operand tag_ptr = vp.getelementptr(vtable_ptr.get_type().get_deref_type(),
    vtable_ptr, int_value(0), int_value(0), op_type(INT32_PTR));
  operand tag = vp.load(op_type(INT32), tag_ptr);
  return tag;
}
#endif

//
// Create a method body
//
void method_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "method" << endl;

  // ADD CODE HERE
  ValuePrinter vp(*env->cur_stream);
#ifndef MP3
  
  vp.define(op_type(INT32), "Main.main", {});
  vp.begin_block("entry");
  expr->make_alloca(env);
  operand res = expr->code(env);
  vp.ret(res);
  vp.begin_block("abort");
  vp.call({}, op_type(VOID), "abort", true, {});
  vp.unreachable();
  vp.end_define();
#else
  //op_type ret_type = to_object(op_type(return_type->get_string()));

  vector<operand> args;
  string class_name(env->get_class()->get_type_name());
  string method_name = class_name + '.' + name->get_string();
  auto func_type = env->get_class()->vtable_final[method_name];
  auto args_type = func_type.get_args_type();
  op_type self_type(args_type[0]);
  auto ret_type = func_type.get_return_type();
  args.push_back(operand(self_type, "self"));

  for (int i = formals->first(); formals->more(i); i = formals->next(i))
  {
    Formal f = formals->nth(i);
    //args.push_back(operand(to_object(op_type(f->get_type_decl()->get_string())),
    //f->get_name()->get_string()));
    args.push_back(operand(args_type[i + 1], f->get_name()->get_string()));
  }

  //vp.define(ret_type, class_name + '.' + name->get_string(), args);
  vp.define(ret_type, method_name, args);
  vp.begin_block("entry");

  vector<operand> alloca_ops;
  operand alloca_op;
  alloca_op = vp.alloca_mem(self_type);
  alloca_ops.push_back(alloca_op);

  env->self = alloca_op;
  //cerr << env->self.get_type().get_deref_type().get_name() << endl;
  for (int i = formals->first(); formals->more(i); i = formals->next(i))
  {
    Formal f = formals->nth(i);
    alloca_op = vp.alloca_mem(to_object(op_type(f->get_type_decl()->get_string())));
    //std::cerr << f->get_name() << ' ' << alloca_op.get_name() << endl;
    alloca_ops.push_back(alloca_op);
    env->add_local(f->get_name(), alloca_ops[i + 1]);
    //env->print();
  }
  //env->print();
  expr->make_alloca(env);
  for (size_t i = 0; i < alloca_ops.size(); ++i)
  {
    vp.store(args[i], alloca_ops[i]);
    //env->add_local(forma->get_name(), alloca_op);
  }
  //env->print();
  operand res = expr->code(env);
  for (size_t i = 1; i < alloca_ops.size(); ++i)
  {
    env->kill_local();
  }
  //if (res.get_typename() != ret_type.get_name())
  //{
    //operand new_res = vp.bitcast(res, ret_type);
    //operand new_res = cast(res, ret_type, env);
    //vp.ret(new_res);
  //}
  //else
  //vp.ret(res);
  operand new_res = conform(res, ret_type, env); // boxing
  new_res = conform(new_res, ret_type, env); // convert type
  vp.ret(new_res);
  vp.begin_block("abort");
  vp.call({}, op_type(VOID), "abort", true, {});
  vp.unreachable();
  vp.end_define();
#endif

}

//
// Codegen for expressions.  Note that each expression has a value.
//

operand assign_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "assign" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  //std::cerr << "assign" << endl;
  operand res = expr->code(env);
  ValuePrinter vp(*env->cur_stream);
  op_type res_type = res.get_type();

  operand* op = env->lookup(name);
  //op_type expr_type;
  CgenNode* class_nd = env->get_class();
  //string class_name = class_nd->get_type_name();
  
  if (!op)
  {
    size_t i = 1; // skip the virtual table
    for (; i < class_nd->attrs.size(); ++i)
    {
      if (class_nd->attr_names[i] == string(name->get_string()))
      {
        break;
      }
    }
    op_type target_type = class_nd->attrs[i];

    if (target_type.get_name() == res.get_typename())
    {
      //std::cerr << "convert\n";
      auto object = vp.load(env->self.get_type().get_deref_type(), env->self);
      auto attr = vp.getelementptr(object.get_type().get_deref_type(),
      object, int_value(0), int_value(i)
      , target_type.get_ptr_type());
      vp.store(res, attr);
      return res;
    }
    //*op = env->get_attr(name);
    auto attr = env->get_attr(name);
    //res = cast(res, attr.get_type().get_deref_type(), env);
    res = conform(res, attr.get_type().get_deref_type(), env);
    vp.store(res, attr);

    return res;
  }
  std::cerr << op->get_typename() << endl;
  res = cast(res, op->get_type().get_deref_type(), env);
  //else
  vp.store(res, *op);
  return res;
}

operand cond_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "cond" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op = pred->code(env);
  auto true_label = env->new_label("true.", false);
  auto false_label = env->new_label("false.", false);
  auto end_label = env->new_label("end.", true);
  ValuePrinter vp(*env->cur_stream);
  vp.branch_cond(op, true_label, false_label);
  vp.begin_block(true_label);
  operand op3 = then_exp->code(env);
  vp.store(op3, alloca_op);
  vp.branch_uncond(end_label);
  vp.begin_block(false_label);
  operand op4 = else_exp->code(env);
  vp.store(op4, alloca_op);
  vp.branch_uncond(end_label);
  vp.begin_block(end_label);
  operand op5 = vp.load(alloca_op.get_type().get_deref_type(), alloca_op);
  return op5;
}

operand loop_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "loop" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  auto true_label = env->new_label("true.", false);
  auto false_label = env->new_label("false.", false);
  auto loop_label = env->new_label("loop.", true);
  ValuePrinter vp(*env->cur_stream);
  vp.branch_uncond(loop_label);
  vp.begin_block(loop_label);
  operand op = pred->code(env);
  vp.branch_cond(op, true_label, false_label);
  vp.begin_block(true_label);
  body->code(env);
  vp.branch_uncond(loop_label);
  vp.begin_block(false_label);
  return int_value(0);
}

operand block_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "block" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand res;
  for (auto e: body)
  {
    res = e->code(env);
  }
  return res;
}

operand let_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "let" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op = init->code(env);
  if (op.is_empty())
  {
    if (type_decl->equal_string("Int", 3))
      op = int_value(0);
    else if (type_decl->equal_string("Bool", 4))
      op = bool_value(false, true);
    else 
      op = null_value(alloca_op.get_type().get_deref_type());
  }
  ValuePrinter vp(*env->cur_stream);
  op_type o_type = to_object(op.get_type());

  /*if (o_type.is_int_object())
  {
    auto val_ptr = vp.getelementptr(op_type("Int"), op, 
      int_value(0), int_value(1), op_type(INT32_PTR));
    auto val = vp.load(op_type(INT32), val_ptr);
    op = val;
  }
  if (o_type.is_bool_object())
  {
    auto val_ptr = vp.getelementptr(op_type("Bool"), op, 
      int_value(0), int_value(1), op_type(INT1_PTR));
    auto val = vp.load(op_type(INT1), val_ptr);
    op = val;
  }*/
  //alloca_op = conform(alloca_op, op.get_type().get_ptr_type(), env);
  //op = box(op, alloca_op.get_type().get_deref_type(), env);
  op = cast(op, alloca_op.get_type().get_deref_type(), env);
  //std::cerr << "conform\n";
  vp.store(op, alloca_op);
  env->add_local(identifier, alloca_op);
  operand res = body->code(env);
  env->kill_local();
  return res;
}

operand plus_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "plus" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op1 = e1->code(env);
  operand op2 = e2->code(env);
  ValuePrinter vp(*env->cur_stream);
  operand res = vp.add(op1, op2);
  return res;
}

operand sub_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "sub" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op1 = e1->code(env);
  operand op2 = e2->code(env);
  ValuePrinter vp(*env->cur_stream);
  operand res = vp.sub(op1, op2);
  return res;
}

operand mul_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "mul" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op1 = e1->code(env);
  operand op2 = e2->code(env);
  ValuePrinter vp(*env->cur_stream);
  operand res = vp.mul(op1, op2);
  return res;
}

operand divide_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "div" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op1 = e1->code(env);
  operand op2 = e2->code(env);
  ValuePrinter vp(*env->cur_stream);
  operand op3 = vp.icmp(EQ, op2, int_value(0));
  auto new_ok_label = env->new_ok_label();
  vp.branch_cond(op3, "abort", new_ok_label);
  vp.begin_block(new_ok_label);
  operand res = vp.div(op1, op2);
  return res;
}

operand neg_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "neg" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op1 = e1->code(env);
  ValuePrinter vp(*env->cur_stream);
  operand res = vp.sub(int_value(0), op1);
  return res;
}

operand lt_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "lt" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op1 = e1->code(env);
  operand op2 = e2->code(env);
  ValuePrinter vp(*env->cur_stream);
  operand res = vp.icmp(LT, op1, op2);
  return res;
}

operand eq_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "eq" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op1 = e1->code(env);
  operand op2 = e2->code(env);
  ValuePrinter vp(*env->cur_stream);
  if (op1.get_typename() != "i1" && op1.get_typename() != "i32")
  {
    operand op3 = vp.bitcast(op1, op_type(INT8_PTR));
    operand op4 = vp.bitcast(op2, op_type(INT8_PTR));
    return vp.icmp(EQ, op3, op4);
  }
  else
    return vp.icmp(EQ, op1, op2);
  //return res;
}

operand leq_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "leq" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op1 = e1->code(env);
  operand op2 = e2->code(env);
  ValuePrinter vp(*env->cur_stream);
  operand res = vp.icmp(LE, op1, op2);
  return res;
}

operand comp_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "complement" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  operand op1 = e1->code(env);
  ValuePrinter vp(*env->cur_stream);
  operand res = vp.xor_in(op1, bool_value(true, true));
  return res;
}

operand int_const_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Integer Constant" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  
  return const_value(INT32, string(token->get_string(), token->get_len()), true);
}

operand bool_const_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Boolean Constant" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  return bool_value(static_cast<bool>(val), true);
}

operand object_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Object" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL

  ValuePrinter vp(*env->cur_stream);
  //std::cerr << name->get_string() << endl;
  operand* op;
  //env->print();
  if (name->equal_string("self", 4))
    op = &env->self;
  else
    op = env->lookup(name);
  if (!op)
  {
    CgenNode* class_nd = env->get_class();
    size_t i = 1; // skip the virtual table
    for (; i < class_nd->attrs.size(); ++i)
    {
      if (class_nd->attr_names[i] == string(name->get_string()))
      {
        break;
      }
    }
    op_type target_type = class_nd->attrs[i];
    auto object = vp.load(env->self.get_type().get_deref_type(), env->self);
    auto attr = vp.getelementptr(object.get_type().get_deref_type(),
      object, int_value(0), int_value(i)
      ,target_type.get_ptr_type());

    /*if (target_type.get_name() == res.get_typename())
    {
      auto object = vp.load(env->self.get_type().get_deref_type(), env->self);
      auto attr = vp.getelementptr(object.get_type().get_deref_type(),
      object, int_value(0), int_value(i)
      , target_type.get_ptr_type());
      vp.store(res, attr);
      return res;
    }*/
    auto res = vp.load(attr.get_type().get_deref_type(), attr);
    return res;
  }
  operand res = vp.load(op->get_type().get_deref_type(), *op);
  return res;
}

operand no_expr_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "No_expr" << endl;
  // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
  // MORE MEANINGFUL
  return operand();
}

//*****************************************************************
// The next few code() functions are for node types not supported
// in Phase 1 but these functions must be defined because they are
// declared as methods via the Expression_SHARED_EXTRAS hack.
//*****************************************************************

operand static_dispatch_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "static dispatch" << endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
    // MORE MEANINGFUL
  vector<operand> args;
  for (int i = actual->first(); actual->more(i); i = actual->next(i))
  {
    args.push_back(actual->nth(i)->code(env));
  }

  operand caller(expr->code(env));
  ValuePrinter vp(*env->cur_stream);

  // check void
  operand cmp = vp.icmp(EQ, caller, null_value(op_type()));
  string ok = env->new_ok_label();
  vp.branch_cond(cmp, "abort", ok);
  vp.begin_block(ok);

  int_value zero_i32(0);
  string class_name = type_name->get_string();
  op_type static_type(class_name, 1);
  CgenNode* class_nd = env->typename_to_class(class_name);
  op_type vtblptr_type('_' + class_name + "_vtable", 1);
  global_value vtbl_prototype(vtblptr_type, "_" + class_name + "_vtable_prototype");

  // find index of method
  
  int index = class_nd->method_names.size() - 1;
  while (index >= 0)
  {
    const string& method_name = class_nd->method_names[index];
    int start = 0;
    while (method_name[start] != '_' && method_name[start] != '.')
      ++start;
    if (method_name.substr(start + 1, method_name.size() - start - 1) 
      == string(name->get_string()))
      break;
    --index;
  }
  
  op_func_type func_type = class_nd->vtable_final[class_nd->method_names[index]];
  operand func_ptr = vp.getelementptr(vtblptr_type.get_deref_type(), vector<operand>{
    vtbl_prototype, zero_i32, int_value(index + 4)
  }, func_type.get_ptr_type());
  
  operand func = make_fresh_operand(func_type);
  vp.load(*env->cur_stream, func_type, func_ptr, func);
  //if (static_type.get_name() != caller.get_typename())
    //caller = vp.bitcast(caller, static_type);
  auto new_caller = conform(caller, static_type, env);
  args.insert(args.begin(), new_caller);
  operand call_res = vp.call(func_type, func, args);
  //cerr << call_res.get_typename() << ' ' << caller.get_typename() << endl;
#endif
  //return conform(call_res, caller.get_type(), env);
  if (call_res.get_typename() == "i32" || call_res.get_typename() == "i1")
    return call_res;
  return conform(call_res, caller.get_type(), env);
}

operand string_const_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "string_const" << endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
    // MORE MEANINGFUL
#endif
  //cout << string(token->get_string()) << '\n';
  operand op = global_string_table[string(token->get_string())];
  //cout << op.get_typename() << '\n';
  return global_string_table[string(token->get_string())];
}

operand dispatch_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "dispatch" << endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
    // MORE MEANINGFUL
  std::cerr << "dynamic dispatch" << ' ' << name->get_string() << endl;
  ValuePrinter vp(*env->cur_stream);
  vector<operand> args;

  // evaluate all the parameters

  //operand caller(expr->code(env));
  //args.push_back(caller);

  for (int i = actual->first(); actual->more(i); i = actual->next(i))
  {
    operand arg_result = actual->nth(i)->code(env);
    args.push_back(arg_result);
    std::cerr << arg_result.get_typename() << endl;
    //args.push_back(conform(arg_result, , env));
  }

  operand caller(expr->code(env));
  std::cerr << "caller type " << caller.get_typename() << endl;
  // boxing
  if (caller.get_typename() == "i32")
  {
    operand new_caller = vp.call({}, op_type("Int", 1), "Int_new", true, {});
    vp.call({op_type("Int", 1), op_type(INT32)}, op_type(VOID), "Int_init", true, {new_caller, caller});
    caller = new_caller;
  }
  if (caller.get_typename() == "i1")
  {
    operand new_caller = vp.call({}, op_type("Bool", 1), "Bool_new", true, {});
    vp.call({op_type("Bool", 1), op_type(INT1)}, op_type(VOID), "Bool_init", true, {new_caller, caller});
    caller = new_caller;
  }

  args.insert(args.begin(), caller); 
  // check void
  operand cmp = vp.icmp(EQ, caller, null_value(op_type()));
  string ok = env->new_ok_label();
  vp.branch_cond(cmp, "abort", ok);
  vp.begin_block(ok);

  int_value zero_i32(0);
  string caller_name = caller.get_typename();
  cerr << caller_name << endl;
  string class_name = caller_name.substr(1, caller_name.size() - 2);
  CgenNode* class_nd = env->typename_to_class(class_name);
  op_type vtblpptr_type('_' + class_name + "_vtable", 2);
  operand vtblpptr = vp.getelementptr(caller.get_type().get_deref_type(), vector<operand>{
    caller, zero_i32, zero_i32
  }, vtblpptr_type);
  operand vtblptr = vp.load(vtblpptr_type.get_deref_type(), vtblpptr);

  int index = class_nd->method_names.size() - 1;
  while (index >= 0)
  {
    const string& method_name = class_nd->method_names[index];
    int start = 0;
    while (method_name[start] != '_' && method_name[start] != '.')
      ++start;
    if (method_name.substr(start + 1, method_name.size() - start - 1) 
      == string(name->get_string()))
      break;
    --index;
  }
  op_func_type func_type = class_nd->vtable_final[class_nd->method_names[index]];
  operand func_ptr = vp.getelementptr(vtblptr.get_type().get_deref_type(), vector<operand>{
    vtblptr, zero_i32, int_value(index + 4)
  }, func_type.get_ptr_type());

  operand func = make_fresh_operand(func_type);
  vp.load(*env->cur_stream, func_type, func_ptr, func);

  // convert the args to correct type
  vector<op_type> args_type = func_type.get_args_type();
  for (size_t i = 0; i < args.size(); ++i)
  {
    args[i] = conform(args[i], args_type[i], env);
  }
  operand call_res = vp.call(func_type, func, args);
#endif
  return call_res;
  //return conform(call_res, caller.get_type(), env);
}

operand typcase_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "typecase::code()" << endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  ValuePrinter vp(*env->cur_stream);
  CgenClassTable *ct = env->get_class()->get_classtable();

  string header_label = env->new_label("case.hdr.", false);
  string exit_label = env->new_label("case.exit.", false);

  // Generate code for expression to select on, and get its static type
  operand code_val = expr->code(env);
  operand expr_val = code_val;
  string code_val_t = code_val.get_typename();
  op_type join_type = env->type_to_class(type)->get_type_name();
  CgenNode *cls = env->type_to_class(expr->get_type());

  // Check for case on void, which gives a runtime error
  if (code_val.get_type().get_id() != INT32 &&
      code_val.get_type().get_id() != INT1) {
    op_type bool_type(INT1), empty_type;
    null_value null_op(code_val.get_type());
    operand icmp_result(bool_type, env->new_name());
    vp.icmp(*env->cur_stream, EQ, code_val, null_op, icmp_result);
    string ok_label = env->new_ok_label();
    vp.branch_cond(icmp_result, "abort", ok_label);
    vp.begin_block(ok_label);
  }

  operand tag = get_class_tag(expr_val, cls, env);
  vp.branch_uncond(header_label);
  string prev_label = header_label;
  vp.begin_block(header_label);

  env->branch_operand = alloca_op;

  std::vector<operand> values;
  env->next_label = exit_label;

  // Generate code for the branches
  for (int i = ct->get_num_classes() - 1; i >= 0; --i) {
    for (auto case_branch : cases) {
      if (i == ct->lookup(case_branch->get_type_decl())->get_tag()) {
        string prefix = string("case.") + itos(i) + ".";
        string case_label = env->new_label(prefix, false);
        vp.branch_uncond(case_label);
        vp.begin_block(case_label);
        operand val = case_branch->code(expr_val, tag, join_type, env);
        values.push_back(val);
      }
    }
  }

  // Abort if there was not a branch covering the actual type
  vp.branch_uncond("abort");

  // Done with case expression: get final result
  env->new_label("", true);
  vp.begin_block(exit_label);
  operand final_result(alloca_type, env->new_name());
  alloca_op.set_type(alloca_op.get_type().get_ptr_type());
  vp.load(*env->cur_stream, alloca_op.get_type().get_deref_type(),
          alloca_op, final_result);
  alloca_op.set_type(alloca_op.get_type().get_deref_type());

  if (cgen_debug)
    cerr << "Done typcase::code()" << endl;
  return final_result;
#endif
}

operand new__class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "newClass" << endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
    // MORE MEANINGFUL
  ValuePrinter vp(*env->cur_stream);
  string class_name(type_name->get_string());
  op_type object_ptr_type(class_name, 1);
  operand object_ptr = vp.call({}, object_ptr_type, class_name + "_new", true, {});
  operand cmp = vp.icmp(EQ, object_ptr, null_value(op_type()));
  string ok = env->new_ok_label();
  vp.branch_cond(cmp, "abort", ok);
  vp.begin_block(ok);
#endif
  return object_ptr;
}

operand isvoid_class::code(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "isvoid" << endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
    // ADD CODE HERE AND REPLACE "return operand()" WITH SOMETHING
    // MORE MEANINGFUL
    ValuePrinter vp(*env->cur_stream);
    operand res = e1->code(env);
#endif
  operand isvoid = vp.icmp(EQ, res, null_value(op_type()));
  return isvoid;
}

// Create the LLVM Function corresponding to this method.
void method_class::layout_feature(CgenNode *cls) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // ADD CODE HERE
  vector<op_type> arg_types;
  //cout << formals->len() << '\n';
  arg_types.push_back(op_type("SELF_TYPE", 1));
  for (int i = formals->first(); formals->more(i); i = formals->next(i))
  {
    Formal f = formals->nth(i);
    Symbol t = f->get_type_decl();
    op_type arg_type(string(t->get_string(), t->get_len()));
    arg_types.emplace_back(to_object(arg_type));
  }
  // set main function return type
  string class_name = cls->get_type_name();
  if (class_name == "Main" && string(name->get_string()) == "main")
  {
    main_return_type = to_object(string(return_type->get_string()));
    if (main_return_type.get_name() == "%SELF_TYPE*")
      main_return_type = op_type("Main", 1);
  }

  auto method = op_func_type(to_object(string(return_type->get_string())), arg_types);
  string method_name;
  if (cls->basic())
    method_name = class_name + '_' + string(name->get_string());
  else
    method_name = class_name + '.' + string(name->get_string());

  size_t i = 0;
  // override parent class method
  for (; i < cls->methods.size(); ++i)
  {
    auto p_method_name = cls->method_names[i];
    //std::cerr << p_method_name << endl;
    //auto del = std::max(p_method_name.find('.'), p_method_name.find('_'));

    auto del = p_method_name.find('.');
    //std::cerr << p_method_name << ' ' << del << endl;
    if (del == std::string::npos)
      continue;
    std::cerr << del << endl;
    if (p_method_name.substr(del + 1, p_method_name.size() - del - 1) == string(name->get_string()))
    {
      std::cerr << "override\n";
      cls->method_names[i] = method_name;
      cls->methods[i] = method;
      cls->override_index.insert(i);
      return;
    }
  }
  cls->methods.push_back(method);
  cls->method_names.push_back(method_name);
#endif
}

// If the source tag is >= the branch tag and <= (max child of the branch class)
// tag, then the branch is a superclass of the source
operand branch_class::code(operand expr_val, operand tag, op_type join_type,
                           CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  operand empty;
  ValuePrinter vp(*env->cur_stream);
  if (cgen_debug)
    cerr << "In branch_class::code()" << endl;

  CgenNode *cls = env->get_class()->get_classtable()->lookup(type_decl);
  int my_tag = cls->get_tag();
  int max_child = cls->get_max_child();

  // Generate unique labels for branching into >= branch tag and <= max child
  string sg_label =
      env->new_label(string("src_gte_br") + "." + itos(my_tag) + ".", false);
  string sl_label =
      env->new_label(string("src_lte_mc") + "." + itos(my_tag) + ".", false);
  string exit_label =
      env->new_label(string("br_exit") + "." + itos(my_tag) + ".", false);

  int_value my_tag_val(my_tag);
  op_type old_tag_t(tag.get_type()), i32_t(INT32);
  tag.set_type(i32_t);

  // Compare the source tag to the class tag
  operand icmp_result = vp.icmp(LT, tag, my_tag_val);
  vp.branch_cond(icmp_result, exit_label, sg_label);
  vp.begin_block(sg_label);
  int_value max_child_val(max_child);

  // Compare the source tag to max child
  operand icmp2_result = vp.icmp(GT, tag, max_child_val);
  vp.branch_cond(icmp2_result, exit_label, sl_label);
  vp.begin_block(sl_label);
  tag.set_type(old_tag_t);

  // Handle casts of *arbitrary* types to Int or Bool.  We need to:
  // (a) cast expr_val to boxed type (struct Int* or struct Bool*)
  // (b) unwrap value field from the boxed type
  // At run-time, if source object is not Int or Bool, this will never
  // be invoked (assuming no bugs in the type checker).
  if (cls->get_type_name() == "Int") {
    expr_val = conform(expr_val, op_type(cls->get_type_name(), 1), env);
  } else if (cls->get_type_name() == "Bool") {
    expr_val = conform(expr_val, op_type(cls->get_type_name(), 1), env);
  }

  // If the case expression is of the right type, make a new local
  // variable for the type-casted version of it, which can be used
  // within the expression to evaluate on this branch.
  operand conf_result = conform(expr_val, alloca_type, env);
  vp.store(conf_result, alloca_op);
  env->add_local(name, alloca_op);

  // Generate code for the expression to evaluate on this branch
  operand val = conform(expr->code(env), join_type.get_ptr_type(), env);
  operand conformed = conform(val, env->branch_operand.get_type(), env);
  env->branch_operand.set_type(env->branch_operand.get_type().get_ptr_type());
  // Store result of the expression evaluated
  std::cerr << "branch store\n";
  vp.store(conformed, env->branch_operand);
  env->branch_operand.set_type(env->branch_operand.get_type().get_deref_type());
  env->kill_local();
  // Branch to case statement exit label
  vp.branch_uncond(env->next_label);
  vp.begin_block(exit_label);
  if (cgen_debug)
    cerr << "Done branch_class::code()" << endl;
  return conformed;
#endif
}

// Assign this attribute a slot in the class structure
void attr_class::layout_feature(CgenNode *cls) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // ADD CODE HERE
  string type_name(type_decl->get_string());
  //std::cerr << type_name << endl;
  if (type_name == "int")
  {
    cls->attrs.push_back(op_type(INT32));
  }
  else if (type_name == "bool")
  {
    cls->attrs.push_back(op_type(INT1));
  }
  else if (type_name == "sbyte*")
  {
    cls->attrs.push_back(op_type(INT8_PTR));
  }
  else
  {
    cls->attrs.push_back(to_object(op_type(type_name)));
  }
  cls->attr_names.push_back(name->get_string());
  cls->attr_inits.push_back(init);
#endif
}

void attr_class::code(CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // ADD CODE HERE
  //env->attr_exprs.push_back(this);
  //env->attr_inits.push_back(init);
#endif
}

//*****************************************************************
// Implementations of make_alloca which create the necessary alloca
// for an expression
//*****************************************************************
void assign_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "assign" << endl;
  
  // ADD ANY CODE HERE
  expr->make_alloca(env);
}

void cond_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "cond" << endl;

  // ADD ANY CODE HERE

  ValuePrinter vp(*env->cur_stream);
  auto type = get_type();
  //operand var;
  if (type->equal_string("Int", 3))
    alloca_op = vp.alloca_mem(op_type(INT32));
  else if (type->equal_string("Bool", 4))
    alloca_op = vp.alloca_mem(op_type(INT1));
  else if (type->equal_string("SELF_TYPE", 9))
    alloca_op = vp.alloca_mem(op_type(env->get_class()->get_type_name(), 1));
  else
    alloca_op = vp.alloca_mem(op_type(type->get_string(), 1));
  //env->add_cond(*(new operand(var)));
  pred->make_alloca(env);
  then_exp->make_alloca(env);
  else_exp->make_alloca(env);
}

void loop_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "loop" << endl;

  // ADD ANY CODE HERE
  pred->make_alloca(env);
  body->make_alloca(env);
}

void block_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "block" << endl;

  // ADD ANY CODE HERE
  for (auto e: body)
  {
    e->make_alloca(env);
  }
}

void let_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "let" << endl;

  // ADD ANY CODE HERE
  ValuePrinter vp(*env->cur_stream);

  if (type_decl->equal_string("Int", 3))
    alloca_op = vp.alloca_mem(op_type(INT32));
  else if (type_decl->equal_string("Bool", 4))
    alloca_op = vp.alloca_mem(op_type(INT1));
  else
    alloca_op = vp.alloca_mem(to_object(op_type(type_decl->get_string())));
  init->make_alloca(env);
  body->make_alloca(env);
}

void plus_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "plus" << endl;

  // ADD ANY CODE HERE
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void sub_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "sub" << endl;

  // ADD ANY CODE HERE
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void mul_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "mul" << endl;

  // ADD ANY CODE HERE
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void divide_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "div" << endl;

  // ADD ANY CODE HERE
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void neg_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "neg" << endl;

  // ADD ANY CODE HERE
  e1->make_alloca(env);
}

void lt_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "lt" << endl;

  // ADD ANY CODE HERE
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void eq_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "eq" << endl;

  // ADD ANY CODE HERE
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void leq_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "leq" << endl;

  // ADD ANY CODE HERE
  e1->make_alloca(env);
  e2->make_alloca(env);
}

void comp_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "complement" << endl;

  // ADD ANY CODE HERE
  e1->make_alloca(env);
}

void int_const_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Integer Constant" << endl;
  
  // ADD ANY CODE HERE
}

void bool_const_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Boolean Constant" << endl;
  
  // ADD ANY CODE HERE
}

void object_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "Object" << endl;
  
  // ADD ANY CODE HERE
}

void no_expr_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "No_expr" << endl;
  
  // ADD ANY CODE HERE
}

void static_dispatch_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "static dispatch" << endl;

#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // ADD ANY CODE HERE
  for (int i = actual->first(); actual->more(i); i = actual->next(i))
  {
    actual->nth(i)->make_alloca(env);
  }
  expr->make_alloca(env);
#endif
}

void string_const_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "string_const" << endl;

#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // ADD ANY CODE HERE
#endif
}

void dispatch_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "dispatch" << endl;

#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // ADD ANY CODE HERE
  for (int i = actual->first(); actual->more(i); i = actual->next(i))
  {
    actual->nth(i)->make_alloca(env);
  }
  expr->make_alloca(env);
#endif
}

// Handle a Cool case expression (selecting based on the type of an object)
void typcase_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "typecase::make_alloca()" << endl;
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  ValuePrinter vp(*env->cur_stream);
  expr->make_alloca(env);

  // Get result type of case expression
  branch_class *b = (branch_class *)cases->nth(cases->first());
  string case_result_type = b->get_expr()->get_type()->get_string();
  if (case_result_type == "SELF_TYPE")
    case_result_type = env->get_class()->get_type_name();

  // Allocate space for result of case expression
  alloca_type = op_type(case_result_type, 1);
  alloca_op = operand(alloca_type, env->new_name());
  vp.alloca_mem(*env->cur_stream, alloca_type, alloca_op);

  for (auto case_branch : cases) {
    case_branch->make_alloca(env);
  }
#endif
}

void new__class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "newClass" << endl;

#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // ADD ANY CODE HERE
#endif
}

void isvoid_class::make_alloca(CgenEnvironment *env) {
  if (cgen_debug)
    std::cerr << "isvoid" << endl;

#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // ADD ANY CODE HERE
  e1->make_alloca(env);
#endif
}

void branch_class::make_alloca(CgenEnvironment *env) {
  #ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  ValuePrinter vp(*env->cur_stream);
  if (cgen_debug)
    cerr << "In branch_class::make_alloca()" << endl;

  CgenNode *cls = env->get_class()->get_classtable()->lookup(type_decl);
  alloca_type = op_type(cls->get_type_name(), 1);
  
  if (cls->get_type_name() == "Int") {
    alloca_type = op_type(INT32);
  } else if (cls->get_type_name() == "Bool") {
    alloca_type = op_type(INT1);
  }

  alloca_op = vp.alloca_mem(alloca_type);

  expr->make_alloca(env);
  
  if (cgen_debug)
    cerr << "Done branch_class::make_alloca()" << endl;
#endif
}

void method_class::make_alloca(CgenEnvironment *env) {
  // ADD ANY CODE HERE

}

void attr_class::make_alloca(CgenEnvironment *env) {
#ifndef MP3
  assert(0 && "Unsupported case for phase 1");
#else
  // ADD ANY CODE HERE
#endif
}
