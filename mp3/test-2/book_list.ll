declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
declare %Object* @Object_new()
declare %Object* @Object_abort(%Object*)
declare %String* @Object_type_name(%Object*)
declare %Object* @Object_copy(%Object*)
declare %IO* @IO_new()
declare %IO* @IO_out_string(%IO*, %String*)
declare %IO* @IO_out_int(%IO*, i32)
declare %String* @IO_in_string(%IO*)
declare i32 @IO_in_int(%IO*)
declare %String* @String_new()
declare i32 @String_length(%String*)
declare %String* @String_concat(%String*, %String*)
declare %String* @String_substr(%String*, i32, i32)
declare %Int* @Int_new()
declare void @Int_init(%Int*, i32)
declare %Bool* @Bool_new()
declare void @Bool_init(%Bool*, i1)
@str.Object = internal constant [7 x i8] c"Object\00"
%Object = type {
	%_Object_vtable*
}

%_Object_vtable = type {
	i32,
	i32,
	i8*,
	%Object* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *
}

@_Object_vtable_prototype = constant %_Object_vtable {
	i32 0,
	i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0),
	%Object* () * @Object_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy
}

@str.Int = internal constant [4 x i8] c"Int\00"
%Int = type {
	%_Int_vtable*,
	i32
}

%_Int_vtable = type {
	i32,
	i32,
	i8*,
	%Int* () *,
	%Object* (%Int*) *,
	%String* (%Int*) *,
	%Int* (%Int*) *
}

@_Int_vtable_prototype = constant %_Int_vtable {
	i32 1,
	i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0),
	%Int* () * @Int_new,
	%Object* (%Int*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Int*) *),
	%String* (%Int*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Int*) *),
	%Int* (%Int*) * bitcast (%Object* (%Object*) * @Object_copy to %Int* (%Int*) *)
}

@str.Bool = internal constant [5 x i8] c"Bool\00"
%Bool = type {
	%_Bool_vtable*,
	i1
}

%_Bool_vtable = type {
	i32,
	i32,
	i8*,
	%Bool* () *,
	%Object* (%Bool*) *,
	%String* (%Bool*) *,
	%Bool* (%Bool*) *
}

@_Bool_vtable_prototype = constant %_Bool_vtable {
	i32 2,
	i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0),
	%Bool* () * @Bool_new,
	%Object* (%Bool*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bool*) *),
	%String* (%Bool*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bool*) *),
	%Bool* (%Bool*) * bitcast (%Object* (%Object*) * @Object_copy to %Bool* (%Bool*) *)
}

@str.String = internal constant [7 x i8] c"String\00"
%String = type {
	%_String_vtable*,
	i8*
}

%_String_vtable = type {
	i32,
	i32,
	i8*,
	%String* () *,
	%Object* (%String*) *,
	%String* (%String*) *,
	%String* (%String*) *,
	i32 (%String*) *,
	%String* (%String*,%String*) *,
	%String* (%String*,i32,i32) *
}

@_String_vtable_prototype = constant %_String_vtable {
	i32 3,
	i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0),
	%String* () * @String_new,
	%Object* (%String*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%String*) *),
	%String* (%String*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%String*) *),
	%String* (%String*) * bitcast (%Object* (%Object*) * @Object_copy to %String* (%String*) *),
	i32 (%String*) * @String_length,
	%String* (%String*,%String*) * @String_concat,
	%String* (%String*,i32,i32) * @String_substr
}

@str.IO = internal constant [3 x i8] c"IO\00"
%IO = type {
	%_IO_vtable*
}

%_IO_vtable = type {
	i32,
	i32,
	i8*,
	%IO* () *,
	%Object* (%IO*) *,
	%String* (%IO*) *,
	%IO* (%IO*) *,
	%IO* (%IO*,%String*) *,
	%IO* (%IO*,i32) *,
	%String* (%IO*) *,
	i32 (%IO*) *
}

@_IO_vtable_prototype = constant %_IO_vtable {
	i32 4,
	i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0),
	%IO* () * @IO_new,
	%Object* (%IO*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%IO*) *),
	%String* (%IO*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%IO*) *),
	%IO* (%IO*) * bitcast (%Object* (%Object*) * @Object_copy to %IO* (%IO*) *),
	%IO* (%IO*,%String*) * @IO_out_string,
	%IO* (%IO*,i32) * @IO_out_int,
	%String* (%IO*) * @IO_in_string,
	i32 (%IO*) * @IO_in_int
}

@str.Book = internal constant [5 x i8] c"Book\00"
%Book = type {
	%_Book_vtable*,
	%String*,
	%String*
}

%_Book_vtable = type {
	i32,
	i32,
	i8*,
	%Book* () *,
	%Object* (%Book*) *,
	%String* (%Book*) *,
	%Book* (%Book*) *,
	%Book* (%Book*,%String*) *,
	%Book* (%Book*,i32) *,
	%String* (%Book*) *,
	i32 (%Book*) *,
	%Book* (%Book*,%String*,%String*) *,
	%Object* (%Book*) *,
	%String* (%Book*,%String*) *
}

@_Book_vtable_prototype = constant %_Book_vtable {
	i32 5,
	i32 ptrtoint (%Book* getelementptr (%Book, %Book* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Book, i32 0, i32 0),
	%Book* () * @Book_new,
	%Object* (%Book*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Book*) *),
	%String* (%Book*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Book*) *),
	%Book* (%Book*) * bitcast (%Object* (%Object*) * @Object_copy to %Book* (%Book*) *),
	%Book* (%Book*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Book* (%Book*,%String*) *),
	%Book* (%Book*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Book* (%Book*,i32) *),
	%String* (%Book*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Book*) *),
	i32 (%Book*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Book*) *),
	%Book* (%Book*,%String*,%String*) * @Book.initBook,
	%Object* (%Book*) * @Book.getSelf,
	%String* (%Book*,%String*) * @Book.print
}

@str.Article = internal constant [8 x i8] c"Article\00"
%Article = type {
	%_Article_vtable*,
	%String*,
	%String*,
	%String*
}

%_Article_vtable = type {
	i32,
	i32,
	i8*,
	%Article* () *,
	%Object* (%Article*) *,
	%String* (%Article*) *,
	%Article* (%Article*) *,
	%Article* (%Article*,%String*) *,
	%Article* (%Article*,i32) *,
	%String* (%Article*) *,
	i32 (%Article*) *,
	%Book* (%Article*,%String*,%String*) *,
	%Object* (%Article*) *,
	%String* (%Article*,%String*) *,
	%Article* (%Article*,%String*,%String*,%String*) *
}

@_Article_vtable_prototype = constant %_Article_vtable {
	i32 6,
	i32 ptrtoint (%Article* getelementptr (%Article, %Article* null, i32 1) to i32),
	i8* getelementptr ([8 x i8], [8 x i8]* @str.Article, i32 0, i32 0),
	%Article* () * @Article_new,
	%Object* (%Article*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Article*) *),
	%String* (%Article*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Article*) *),
	%Article* (%Article*) * bitcast (%Object* (%Object*) * @Object_copy to %Article* (%Article*) *),
	%Article* (%Article*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Article* (%Article*,%String*) *),
	%Article* (%Article*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Article* (%Article*,i32) *),
	%String* (%Article*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Article*) *),
	i32 (%Article*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Article*) *),
	%Book* (%Article*,%String*,%String*) * bitcast (%Book* (%Book*,%String*,%String*) * @Book.initBook to %Book* (%Article*,%String*,%String*) *),
	%Object* (%Article*) * @Article.getSelf,
	%String* (%Article*,%String*) * @Article.print,
	%Article* (%Article*,%String*,%String*,%String*) * @Article.initArticle
}

@str.BookList = internal constant [9 x i8] c"BookList\00"
%BookList = type {
	%_BookList_vtable*
}

%_BookList_vtable = type {
	i32,
	i32,
	i8*,
	%BookList* () *,
	%Object* (%BookList*) *,
	%String* (%BookList*) *,
	%BookList* (%BookList*) *,
	%BookList* (%BookList*,%String*) *,
	%BookList* (%BookList*,i32) *,
	%String* (%BookList*) *,
	i32 (%BookList*) *,
	i1 (%BookList*) *,
	%Cons* (%BookList*,%Book*) *,
	%Book* (%BookList*) *,
	%BookList* (%BookList*) *,
	%String* (%BookList*,%String*) *
}

@_BookList_vtable_prototype = constant %_BookList_vtable {
	i32 7,
	i32 ptrtoint (%BookList* getelementptr (%BookList, %BookList* null, i32 1) to i32),
	i8* getelementptr ([9 x i8], [9 x i8]* @str.BookList, i32 0, i32 0),
	%BookList* () * @BookList_new,
	%Object* (%BookList*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%BookList*) *),
	%String* (%BookList*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%BookList*) *),
	%BookList* (%BookList*) * bitcast (%Object* (%Object*) * @Object_copy to %BookList* (%BookList*) *),
	%BookList* (%BookList*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %BookList* (%BookList*,%String*) *),
	%BookList* (%BookList*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %BookList* (%BookList*,i32) *),
	%String* (%BookList*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%BookList*) *),
	i32 (%BookList*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%BookList*) *),
	i1 (%BookList*) * @BookList.isNil,
	%Cons* (%BookList*,%Book*) * @BookList.cons,
	%Book* (%BookList*) * @BookList.car,
	%BookList* (%BookList*) * @BookList.cdr,
	%String* (%BookList*,%String*) * @BookList.print_list
}

@str.Cons = internal constant [5 x i8] c"Cons\00"
%Cons = type {
	%_Cons_vtable*,
	%Book*,
	%BookList*
}

%_Cons_vtable = type {
	i32,
	i32,
	i8*,
	%Cons* () *,
	%Object* (%Cons*) *,
	%String* (%Cons*) *,
	%Cons* (%Cons*) *,
	%Cons* (%Cons*,%String*) *,
	%Cons* (%Cons*,i32) *,
	%String* (%Cons*) *,
	i32 (%Cons*) *,
	i1 (%Cons*) *,
	%Cons* (%Cons*,%Book*) *,
	%Book* (%Cons*) *,
	%BookList* (%Cons*) *,
	%String* (%Cons*,%String*) *,
	%Cons* (%Cons*,%Book*,%BookList*) *
}

@_Cons_vtable_prototype = constant %_Cons_vtable {
	i32 8,
	i32 ptrtoint (%Cons* getelementptr (%Cons, %Cons* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Cons, i32 0, i32 0),
	%Cons* () * @Cons_new,
	%Object* (%Cons*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Cons*) *),
	%String* (%Cons*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Cons*) *),
	%Cons* (%Cons*) * bitcast (%Object* (%Object*) * @Object_copy to %Cons* (%Cons*) *),
	%Cons* (%Cons*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Cons* (%Cons*,%String*) *),
	%Cons* (%Cons*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Cons* (%Cons*,i32) *),
	%String* (%Cons*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Cons*) *),
	i32 (%Cons*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Cons*) *),
	i1 (%Cons*) * @Cons.isNil,
	%Cons* (%Cons*,%Book*) * bitcast (%Cons* (%BookList*,%Book*) * @BookList.cons to %Cons* (%Cons*,%Book*) *),
	%Book* (%Cons*) * @Cons.car,
	%BookList* (%Cons*) * @Cons.cdr,
	%String* (%Cons*,%String*) * @Cons.print_list,
	%Cons* (%Cons*,%Book*,%BookList*) * @Cons.init
}

@str.Nil = internal constant [4 x i8] c"Nil\00"
%Nil = type {
	%_Nil_vtable*
}

%_Nil_vtable = type {
	i32,
	i32,
	i8*,
	%Nil* () *,
	%Object* (%Nil*) *,
	%String* (%Nil*) *,
	%Nil* (%Nil*) *,
	%Nil* (%Nil*,%String*) *,
	%Nil* (%Nil*,i32) *,
	%String* (%Nil*) *,
	i32 (%Nil*) *,
	i1 (%Nil*) *,
	%Cons* (%Nil*,%Book*) *,
	%Book* (%Nil*) *,
	%BookList* (%Nil*) *,
	%String* (%Nil*,%String*) *
}

@_Nil_vtable_prototype = constant %_Nil_vtable {
	i32 9,
	i32 ptrtoint (%Nil* getelementptr (%Nil, %Nil* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Nil, i32 0, i32 0),
	%Nil* () * @Nil_new,
	%Object* (%Nil*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Nil*) *),
	%String* (%Nil*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Nil*) *),
	%Nil* (%Nil*) * bitcast (%Object* (%Object*) * @Object_copy to %Nil* (%Nil*) *),
	%Nil* (%Nil*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Nil* (%Nil*,%String*) *),
	%Nil* (%Nil*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Nil* (%Nil*,i32) *),
	%String* (%Nil*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Nil*) *),
	i32 (%Nil*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Nil*) *),
	i1 (%Nil*) * @Nil.isNil,
	%Cons* (%Nil*,%Book*) * bitcast (%Cons* (%BookList*,%Book*) * @BookList.cons to %Cons* (%Nil*,%Book*) *),
	%Book* (%Nil*) * bitcast (%Book* (%BookList*) * @BookList.car to %Book* (%Nil*) *),
	%BookList* (%Nil*) * bitcast (%BookList* (%BookList*) * @BookList.cdr to %BookList* (%Nil*) *),
	%String* (%Nil*,%String*) * @Nil.print_list
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%_Main_vtable*,
	%BookList*
}

%_Main_vtable = type {
	i32,
	i32,
	i8*,
	%Main* () *,
	%Object* (%Main*) *,
	%String* (%Main*) *,
	%Main* (%Main*) *,
	%String* (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
	i32 10,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%String* (%Main*) * @Main.main
}

@str.0 = internal constant [14 x i8] c"<basic class>\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

@str.1 = internal constant [12 x i8] c"PC Magazine\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @str.1, i32 0, i32 0)
}

@str.2 = internal constant [8 x i8] c"Ulanoff\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.2, i32 0, i32 0)
}

@str.3 = internal constant [20 x i8] c"The Top 100 CD_ROMs\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([20 x i8], [20 x i8]* @str.3, i32 0, i32 0)
}

@str.4 = internal constant [23 x i8] c"Aho, Sethi, and Ullman\00"
@String.4 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([23 x i8], [23 x i8]* @str.4, i32 0, i32 0)
}

@str.5 = internal constant [45 x i8] c"Compilers, Principles, Techniques, and Tools\00"
@String.5 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([45 x i8], [45 x i8]* @str.5, i32 0, i32 0)
}

@str.6 = internal constant [30 x i8] c"- dynamic type was Article -\0A\00"
@String.6 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([30 x i8], [30 x i8]* @str.6, i32 0, i32 0)
}

@str.7 = internal constant [27 x i8] c"- dynamic type was Book -\0A\00"
@String.7 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([27 x i8], [27 x i8]* @str.7, i32 0, i32 0)
}

@str.8 = internal constant [1 x i8] c"\00"
@String.8 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([1 x i8], [1 x i8]* @str.8, i32 0, i32 0)
}

@str.9 = internal constant [14 x i8] c"periodical:  \00"
@String.9 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.9, i32 0, i32 0)
}

@str.10 = internal constant [13 x i8] c"author:     \00"
@String.10 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.10, i32 0, i32 0)
}

@str.11 = internal constant [2 x i8] c"\0A\00"
@String.11 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.11, i32 0, i32 0)
}

@str.12 = internal constant [13 x i8] c"title:      \00"
@String.12 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.12, i32 0, i32 0)
}

@str.13 = internal constant [13 x i8] c"book_list.cl\00"
@String.13 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.13, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call %String*(%Main* ) @Main.main( %Main* %main.obj )
	ret i32 0
}

define %Book* @Book.initBook(%Book* %self, %String* %title_p, %String* %author_p) {

entry:
	%vtpm.0 = alloca %Book*
	%vtpm.1 = alloca %String*
	%vtpm.2 = alloca %String*
	store %Book* %self, %Book** %vtpm.0
	store %String* %title_p, %String** %vtpm.1
	store %String* %author_p, %String** %vtpm.2
	%vtpm.3 = load %String*, %String** %vtpm.1
	%vtpm.4 = load %Book*, %Book** %vtpm.0
	%vtpm.5 = getelementptr %Book, %Book* %vtpm.4, i32 0, i32 1
	store %String* %vtpm.3, %String** %vtpm.5
	%vtpm.6 = load %String*, %String** %vtpm.2
	%vtpm.7 = load %Book*, %Book** %vtpm.0
	%vtpm.8 = getelementptr %Book, %Book* %vtpm.7, i32 0, i32 2
	store %String* %vtpm.6, %String** %vtpm.8
	%vtpm.9 = load %Book*, %Book** %vtpm.0
	ret %Book* %vtpm.9

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Book.getSelf(%Book* %self) {

entry:
	%vtpm.11 = alloca %Book*
	store %Book* %self, %Book** %vtpm.11
	%vtpm.12 = load %Book*, %Book** %vtpm.11
	%vtpm.13 = bitcast %Book* %vtpm.12 to %Object*
	ret %Object* %vtpm.13

abort:
	call void @abort(  )
	unreachable
}

define %String* @Book.print(%Book* %self, %String* %s) {

entry:
	%vtpm.15 = alloca %Book*
	%vtpm.16 = alloca %String*
	store %Book* %self, %Book** %vtpm.15
	store %String* %s, %String** %vtpm.16
	%vtpm.17 = load %Book*, %Book** %vtpm.15
	%vtpm.18 = getelementptr %Book, %Book* %vtpm.17, i32 0, i32 1
	%vtpm.19 = load %String*, %String** %vtpm.18
	%vtpm.20 = load %String*, %String** %vtpm.16
	%vtpm.21 = icmp eq %String* %vtpm.20, null
	br i1 %vtpm.21, label %abort, label %ok.0

ok.0:
	%vtpm.22 = getelementptr %String, %String* %vtpm.20, i32 0, i32 0
	%vtpm.23 = load %_String_vtable*, %_String_vtable** %vtpm.22
	%vtpm.24 = getelementptr %_String_vtable, %_String_vtable* %vtpm.23, i32 0, i32 8
	%vtpm.25 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.24
	%vtpm.26 = call %String*(%String*, %String* )%vtpm.25( %String* %vtpm.20, %String* @String.12 )
	%vtpm.27 = icmp eq %String* %vtpm.26, null
	br i1 %vtpm.27, label %abort, label %ok.1

ok.1:
	%vtpm.28 = getelementptr %String, %String* %vtpm.26, i32 0, i32 0
	%vtpm.29 = load %_String_vtable*, %_String_vtable** %vtpm.28
	%vtpm.30 = getelementptr %_String_vtable, %_String_vtable* %vtpm.29, i32 0, i32 8
	%vtpm.31 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.30
	%vtpm.32 = call %String*(%String*, %String* )%vtpm.31( %String* %vtpm.26, %String* %vtpm.19 )
	%vtpm.33 = icmp eq %String* %vtpm.32, null
	br i1 %vtpm.33, label %abort, label %ok.2

ok.2:
	%vtpm.34 = getelementptr %String, %String* %vtpm.32, i32 0, i32 0
	%vtpm.35 = load %_String_vtable*, %_String_vtable** %vtpm.34
	%vtpm.36 = getelementptr %_String_vtable, %_String_vtable* %vtpm.35, i32 0, i32 8
	%vtpm.37 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.36
	%vtpm.38 = call %String*(%String*, %String* )%vtpm.37( %String* %vtpm.32, %String* @String.11 )
	store %String* %vtpm.38, %String** %vtpm.16
	%vtpm.39 = load %Book*, %Book** %vtpm.15
	%vtpm.40 = getelementptr %Book, %Book* %vtpm.39, i32 0, i32 2
	%vtpm.41 = load %String*, %String** %vtpm.40
	%vtpm.42 = load %String*, %String** %vtpm.16
	%vtpm.43 = icmp eq %String* %vtpm.42, null
	br i1 %vtpm.43, label %abort, label %ok.3

ok.3:
	%vtpm.44 = getelementptr %String, %String* %vtpm.42, i32 0, i32 0
	%vtpm.45 = load %_String_vtable*, %_String_vtable** %vtpm.44
	%vtpm.46 = getelementptr %_String_vtable, %_String_vtable* %vtpm.45, i32 0, i32 8
	%vtpm.47 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.46
	%vtpm.48 = call %String*(%String*, %String* )%vtpm.47( %String* %vtpm.42, %String* @String.10 )
	%vtpm.49 = icmp eq %String* %vtpm.48, null
	br i1 %vtpm.49, label %abort, label %ok.4

ok.4:
	%vtpm.50 = getelementptr %String, %String* %vtpm.48, i32 0, i32 0
	%vtpm.51 = load %_String_vtable*, %_String_vtable** %vtpm.50
	%vtpm.52 = getelementptr %_String_vtable, %_String_vtable* %vtpm.51, i32 0, i32 8
	%vtpm.53 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.52
	%vtpm.54 = call %String*(%String*, %String* )%vtpm.53( %String* %vtpm.48, %String* %vtpm.41 )
	%vtpm.55 = icmp eq %String* %vtpm.54, null
	br i1 %vtpm.55, label %abort, label %ok.5

ok.5:
	%vtpm.56 = getelementptr %String, %String* %vtpm.54, i32 0, i32 0
	%vtpm.57 = load %_String_vtable*, %_String_vtable** %vtpm.56
	%vtpm.58 = getelementptr %_String_vtable, %_String_vtable* %vtpm.57, i32 0, i32 8
	%vtpm.59 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.58
	%vtpm.60 = call %String*(%String*, %String* )%vtpm.59( %String* %vtpm.54, %String* @String.11 )
	ret %String* %vtpm.60

abort:
	call void @abort(  )
	unreachable
}

define %Book* @Book_new() {

entry:
	%vtpm.62 = alloca %Book*
	%vtpm.63 = getelementptr %_Book_vtable, %_Book_vtable* @_Book_vtable_prototype, i32 0, i32 1
	%vtpm.64 = load i32, i32* %vtpm.63
	%vtpm.65 = call i8*(i32 ) @malloc( i32 %vtpm.64 )
	%vtpm.66 = bitcast i8* %vtpm.65 to %Book*
	%vtpm.67 = icmp eq %Book* %vtpm.66, null
	br i1 %vtpm.67, label %abort, label %ok.6

ok.6:
	%vtpm.68 = getelementptr %Book, %Book* %vtpm.66, i32 0, i32 0
	store %_Book_vtable* @_Book_vtable_prototype, %_Book_vtable** %vtpm.68
	store %Book* %vtpm.66, %Book** %vtpm.62
	%vtpm.69 = getelementptr %Book, %Book* %vtpm.66, i32 0, i32 1
	store %String* null, %String** %vtpm.69
	%vtpm.70 = getelementptr %Book, %Book* %vtpm.66, i32 0, i32 2
	store %String* null, %String** %vtpm.70
	ret %Book* %vtpm.66

abort:
	call void @abort(  )
	unreachable
}

define %Article* @Article.initArticle(%Article* %self, %String* %title_p, %String* %author_p, %String* %per_title_p) {

entry:
	%vtpm.72 = alloca %Article*
	%vtpm.73 = alloca %String*
	%vtpm.74 = alloca %String*
	%vtpm.75 = alloca %String*
	store %Article* %self, %Article** %vtpm.72
	store %String* %title_p, %String** %vtpm.73
	store %String* %author_p, %String** %vtpm.74
	store %String* %per_title_p, %String** %vtpm.75
	%vtpm.76 = load %String*, %String** %vtpm.73
	%vtpm.77 = load %String*, %String** %vtpm.74
	%vtpm.78 = load %Article*, %Article** %vtpm.72
	%vtpm.79 = icmp eq %Article* %vtpm.78, null
	br i1 %vtpm.79, label %abort, label %ok.0

ok.0:
	%vtpm.80 = getelementptr %Article, %Article* %vtpm.78, i32 0, i32 0
	%vtpm.81 = load %_Article_vtable*, %_Article_vtable** %vtpm.80
	%vtpm.82 = getelementptr %_Article_vtable, %_Article_vtable* %vtpm.81, i32 0, i32 11
	%vtpm.83 = load %Book* (%Article*,%String*,%String*) *, %Book* (%Article*,%String*,%String*) ** %vtpm.82
	%vtpm.84 = call %Book*(%Article*, %String*, %String* )%vtpm.83( %Article* %vtpm.78, %String* %vtpm.76, %String* %vtpm.77 )
	%vtpm.85 = load %String*, %String** %vtpm.75
	%vtpm.86 = load %Article*, %Article** %vtpm.72
	%vtpm.87 = getelementptr %Article, %Article* %vtpm.86, i32 0, i32 3
	store %String* %vtpm.85, %String** %vtpm.87
	%vtpm.88 = load %Article*, %Article** %vtpm.72
	ret %Article* %vtpm.88

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Article.getSelf(%Article* %self) {

entry:
	%vtpm.90 = alloca %Article*
	store %Article* %self, %Article** %vtpm.90
	%vtpm.91 = load %Article*, %Article** %vtpm.90
	%vtpm.92 = bitcast %Article* %vtpm.91 to %Object*
	ret %Object* %vtpm.92

abort:
	call void @abort(  )
	unreachable
}

define %String* @Article.print(%Article* %self, %String* %s) {

entry:
	%vtpm.94 = alloca %Article*
	%vtpm.95 = alloca %String*
	store %Article* %self, %Article** %vtpm.94
	store %String* %s, %String** %vtpm.95
	%vtpm.96 = load %String*, %String** %vtpm.95
	%vtpm.97 = load %Article*, %Article** %vtpm.94
	%vtpm.98 = icmp eq %Article* %vtpm.97, null
	br i1 %vtpm.98, label %abort, label %ok.1

ok.1:
	%vtpm.99 = getelementptr %_Book_vtable, %_Book_vtable* @_Book_vtable_prototype, i32 0, i32 13
	%vtpm.100 = load %String* (%Book*,%String*) *, %String* (%Book*,%String*) ** %vtpm.99
	%vtpm.101 = bitcast %Article* %vtpm.97 to %Book*
	%vtpm.102 = call %String*(%Book*, %String* )%vtpm.100( %Book* %vtpm.101, %String* %vtpm.96 )
	%vtpm.103 = bitcast %String* %vtpm.102 to %Article*
	%vtpm.104 = bitcast %Article* %vtpm.103 to %String*
	store %String* %vtpm.104, %String** %vtpm.95
	%vtpm.105 = load %Article*, %Article** %vtpm.94
	%vtpm.106 = getelementptr %Article, %Article* %vtpm.105, i32 0, i32 3
	%vtpm.107 = load %String*, %String** %vtpm.106
	%vtpm.108 = load %String*, %String** %vtpm.95
	%vtpm.109 = icmp eq %String* %vtpm.108, null
	br i1 %vtpm.109, label %abort, label %ok.2

ok.2:
	%vtpm.110 = getelementptr %String, %String* %vtpm.108, i32 0, i32 0
	%vtpm.111 = load %_String_vtable*, %_String_vtable** %vtpm.110
	%vtpm.112 = getelementptr %_String_vtable, %_String_vtable* %vtpm.111, i32 0, i32 8
	%vtpm.113 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.112
	%vtpm.114 = call %String*(%String*, %String* )%vtpm.113( %String* %vtpm.108, %String* @String.9 )
	%vtpm.115 = icmp eq %String* %vtpm.114, null
	br i1 %vtpm.115, label %abort, label %ok.3

ok.3:
	%vtpm.116 = getelementptr %String, %String* %vtpm.114, i32 0, i32 0
	%vtpm.117 = load %_String_vtable*, %_String_vtable** %vtpm.116
	%vtpm.118 = getelementptr %_String_vtable, %_String_vtable* %vtpm.117, i32 0, i32 8
	%vtpm.119 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.118
	%vtpm.120 = call %String*(%String*, %String* )%vtpm.119( %String* %vtpm.114, %String* %vtpm.107 )
	%vtpm.121 = icmp eq %String* %vtpm.120, null
	br i1 %vtpm.121, label %abort, label %ok.4

ok.4:
	%vtpm.122 = getelementptr %String, %String* %vtpm.120, i32 0, i32 0
	%vtpm.123 = load %_String_vtable*, %_String_vtable** %vtpm.122
	%vtpm.124 = getelementptr %_String_vtable, %_String_vtable* %vtpm.123, i32 0, i32 8
	%vtpm.125 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.124
	%vtpm.126 = call %String*(%String*, %String* )%vtpm.125( %String* %vtpm.120, %String* @String.11 )
	ret %String* %vtpm.126

abort:
	call void @abort(  )
	unreachable
}

define %Article* @Article_new() {

entry:
	%vtpm.128 = alloca %Article*
	%vtpm.129 = getelementptr %_Article_vtable, %_Article_vtable* @_Article_vtable_prototype, i32 0, i32 1
	%vtpm.130 = load i32, i32* %vtpm.129
	%vtpm.131 = call i8*(i32 ) @malloc( i32 %vtpm.130 )
	%vtpm.132 = bitcast i8* %vtpm.131 to %Article*
	%vtpm.133 = icmp eq %Article* %vtpm.132, null
	br i1 %vtpm.133, label %abort, label %ok.5

ok.5:
	%vtpm.134 = getelementptr %Article, %Article* %vtpm.132, i32 0, i32 0
	store %_Article_vtable* @_Article_vtable_prototype, %_Article_vtable** %vtpm.134
	store %Article* %vtpm.132, %Article** %vtpm.128
	%vtpm.135 = getelementptr %Article, %Article* %vtpm.132, i32 0, i32 1
	store %String* null, %String** %vtpm.135
	%vtpm.136 = getelementptr %Article, %Article* %vtpm.132, i32 0, i32 2
	store %String* null, %String** %vtpm.136
	%vtpm.137 = getelementptr %Article, %Article* %vtpm.132, i32 0, i32 3
	store %String* null, %String** %vtpm.137
	ret %Article* %vtpm.132

abort:
	call void @abort(  )
	unreachable
}

define i1 @BookList.isNil(%BookList* %self) {

entry:
	%vtpm.139 = alloca %BookList*
	store %BookList* %self, %BookList** %vtpm.139
	%vtpm.140 = load %BookList*, %BookList** %vtpm.139
	%vtpm.141 = icmp eq %BookList* %vtpm.140, null
	br i1 %vtpm.141, label %abort, label %ok.0

ok.0:
	%vtpm.142 = getelementptr %BookList, %BookList* %vtpm.140, i32 0, i32 0
	%vtpm.143 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.142
	%vtpm.144 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.143, i32 0, i32 4
	%vtpm.145 = load %Object* (%BookList*) *, %Object* (%BookList*) ** %vtpm.144
	%vtpm.146 = call %Object*(%BookList* )%vtpm.145( %BookList* %vtpm.140 )
	ret i1 true

abort:
	call void @abort(  )
	unreachable
}

define %Cons* @BookList.cons(%BookList* %self, %Book* %hd) {

entry:
	%vtpm.148 = alloca %BookList*
	%vtpm.149 = alloca %Book*
	%vtpm.150 = alloca %Cons*
	store %BookList* %self, %BookList** %vtpm.148
	store %Book* %hd, %Book** %vtpm.149
	%vtpm.151 = call %Cons* @Cons_new(  )
	%vtpm.152 = icmp eq %Cons* %vtpm.151, null
	br i1 %vtpm.152, label %abort, label %ok.1

ok.1:
	store %Cons* %vtpm.151, %Cons** %vtpm.150
	%vtpm.153 = load %Book*, %Book** %vtpm.149
	%vtpm.154 = load %BookList*, %BookList** %vtpm.148
	%vtpm.155 = load %Cons*, %Cons** %vtpm.150
	%vtpm.156 = icmp eq %Cons* %vtpm.155, null
	br i1 %vtpm.156, label %abort, label %ok.2

ok.2:
	%vtpm.157 = getelementptr %Cons, %Cons* %vtpm.155, i32 0, i32 0
	%vtpm.158 = load %_Cons_vtable*, %_Cons_vtable** %vtpm.157
	%vtpm.159 = getelementptr %_Cons_vtable, %_Cons_vtable* %vtpm.158, i32 0, i32 16
	%vtpm.160 = load %Cons* (%Cons*,%Book*,%BookList*) *, %Cons* (%Cons*,%Book*,%BookList*) ** %vtpm.159
	%vtpm.161 = call %Cons*(%Cons*, %Book*, %BookList* )%vtpm.160( %Cons* %vtpm.155, %Book* %vtpm.153, %BookList* %vtpm.154 )
	ret %Cons* %vtpm.161

abort:
	call void @abort(  )
	unreachable
}

define %Book* @BookList.car(%BookList* %self) {

entry:
	%vtpm.163 = alloca %BookList*
	store %BookList* %self, %BookList** %vtpm.163
	%vtpm.164 = load %BookList*, %BookList** %vtpm.163
	%vtpm.165 = icmp eq %BookList* %vtpm.164, null
	br i1 %vtpm.165, label %abort, label %ok.3

ok.3:
	%vtpm.166 = getelementptr %BookList, %BookList* %vtpm.164, i32 0, i32 0
	%vtpm.167 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.166
	%vtpm.168 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.167, i32 0, i32 4
	%vtpm.169 = load %Object* (%BookList*) *, %Object* (%BookList*) ** %vtpm.168
	%vtpm.170 = call %Object*(%BookList* )%vtpm.169( %BookList* %vtpm.164 )
	%vtpm.171 = call %Book* @Book_new(  )
	%vtpm.172 = icmp eq %Book* %vtpm.171, null
	br i1 %vtpm.172, label %abort, label %ok.4

ok.4:
	ret %Book* %vtpm.171

abort:
	call void @abort(  )
	unreachable
}

define %BookList* @BookList.cdr(%BookList* %self) {

entry:
	%vtpm.174 = alloca %BookList*
	store %BookList* %self, %BookList** %vtpm.174
	%vtpm.175 = load %BookList*, %BookList** %vtpm.174
	%vtpm.176 = icmp eq %BookList* %vtpm.175, null
	br i1 %vtpm.176, label %abort, label %ok.5

ok.5:
	%vtpm.177 = getelementptr %BookList, %BookList* %vtpm.175, i32 0, i32 0
	%vtpm.178 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.177
	%vtpm.179 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.178, i32 0, i32 4
	%vtpm.180 = load %Object* (%BookList*) *, %Object* (%BookList*) ** %vtpm.179
	%vtpm.181 = call %Object*(%BookList* )%vtpm.180( %BookList* %vtpm.175 )
	%vtpm.182 = call %BookList* @BookList_new(  )
	%vtpm.183 = icmp eq %BookList* %vtpm.182, null
	br i1 %vtpm.183, label %abort, label %ok.6

ok.6:
	ret %BookList* %vtpm.182

abort:
	call void @abort(  )
	unreachable
}

define %String* @BookList.print_list(%BookList* %self, %String* %s) {

entry:
	%vtpm.185 = alloca %BookList*
	%vtpm.186 = alloca %String*
	store %BookList* %self, %BookList** %vtpm.185
	store %String* %s, %String** %vtpm.186
	ret %String* @String.8

abort:
	call void @abort(  )
	unreachable
}

define %BookList* @BookList_new() {

entry:
	%vtpm.188 = alloca %BookList*
	%vtpm.189 = getelementptr %_BookList_vtable, %_BookList_vtable* @_BookList_vtable_prototype, i32 0, i32 1
	%vtpm.190 = load i32, i32* %vtpm.189
	%vtpm.191 = call i8*(i32 ) @malloc( i32 %vtpm.190 )
	%vtpm.192 = bitcast i8* %vtpm.191 to %BookList*
	%vtpm.193 = icmp eq %BookList* %vtpm.192, null
	br i1 %vtpm.193, label %abort, label %ok.7

ok.7:
	%vtpm.194 = getelementptr %BookList, %BookList* %vtpm.192, i32 0, i32 0
	store %_BookList_vtable* @_BookList_vtable_prototype, %_BookList_vtable** %vtpm.194
	store %BookList* %vtpm.192, %BookList** %vtpm.188
	ret %BookList* %vtpm.192

abort:
	call void @abort(  )
	unreachable
}

define i1 @Cons.isNil(%Cons* %self) {

entry:
	%vtpm.196 = alloca %Cons*
	store %Cons* %self, %Cons** %vtpm.196
	ret i1 false

abort:
	call void @abort(  )
	unreachable
}

define %Cons* @Cons.init(%Cons* %self, %Book* %hd, %BookList* %tl) {

entry:
	%vtpm.198 = alloca %Cons*
	%vtpm.199 = alloca %Book*
	%vtpm.200 = alloca %BookList*
	store %Cons* %self, %Cons** %vtpm.198
	store %Book* %hd, %Book** %vtpm.199
	store %BookList* %tl, %BookList** %vtpm.200
	%vtpm.201 = load %Book*, %Book** %vtpm.199
	%vtpm.202 = load %Cons*, %Cons** %vtpm.198
	%vtpm.203 = getelementptr %Cons, %Cons* %vtpm.202, i32 0, i32 1
	store %Book* %vtpm.201, %Book** %vtpm.203
	%vtpm.204 = load %BookList*, %BookList** %vtpm.200
	%vtpm.205 = load %Cons*, %Cons** %vtpm.198
	%vtpm.206 = getelementptr %Cons, %Cons* %vtpm.205, i32 0, i32 2
	store %BookList* %vtpm.204, %BookList** %vtpm.206
	%vtpm.207 = load %Cons*, %Cons** %vtpm.198
	ret %Cons* %vtpm.207

abort:
	call void @abort(  )
	unreachable
}

define %Book* @Cons.car(%Cons* %self) {

entry:
	%vtpm.209 = alloca %Cons*
	store %Cons* %self, %Cons** %vtpm.209
	%vtpm.210 = load %Cons*, %Cons** %vtpm.209
	%vtpm.211 = getelementptr %Cons, %Cons* %vtpm.210, i32 0, i32 1
	%vtpm.212 = load %Book*, %Book** %vtpm.211
	ret %Book* %vtpm.212

abort:
	call void @abort(  )
	unreachable
}

define %BookList* @Cons.cdr(%Cons* %self) {

entry:
	%vtpm.214 = alloca %Cons*
	store %Cons* %self, %Cons** %vtpm.214
	%vtpm.215 = load %Cons*, %Cons** %vtpm.214
	%vtpm.216 = getelementptr %Cons, %Cons* %vtpm.215, i32 0, i32 2
	%vtpm.217 = load %BookList*, %BookList** %vtpm.216
	ret %BookList* %vtpm.217

abort:
	call void @abort(  )
	unreachable
}

define %String* @Cons.print_list(%Cons* %self, %String* %s) {

entry:
	%vtpm.219 = alloca %Cons*
	%vtpm.220 = alloca %String*
	%tmp.0 = alloca %String*
	%vtpm.221 = alloca %Book*
	%vtpm.222 = alloca %Article*
	store %Cons* %self, %Cons** %vtpm.219
	store %String* %s, %String** %vtpm.220
	%vtpm.223 = load %String*, %String** %vtpm.220
	%vtpm.224 = load %Cons*, %Cons** %vtpm.219
	%vtpm.225 = getelementptr %Cons, %Cons* %vtpm.224, i32 0, i32 1
	%vtpm.226 = load %Book*, %Book** %vtpm.225
	%vtpm.227 = icmp eq %Book* %vtpm.226, null
	br i1 %vtpm.227, label %abort, label %ok.0

ok.0:
	%vtpm.228 = getelementptr %Book, %Book* %vtpm.226, i32 0, i32 0
	%vtpm.229 = load %_Book_vtable*, %_Book_vtable** %vtpm.228
	%vtpm.230 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.229, i32 0, i32 13
	%vtpm.231 = load %String* (%Book*,%String*) *, %String* (%Book*,%String*) ** %vtpm.230
	%vtpm.232 = call %String*(%Book*, %String* )%vtpm.231( %Book* %vtpm.226, %String* %vtpm.223 )
	store %String* %vtpm.232, %String** %vtpm.220
	%vtpm.233 = load %Cons*, %Cons** %vtpm.219
	%vtpm.234 = getelementptr %Cons, %Cons* %vtpm.233, i32 0, i32 1
	%vtpm.235 = load %Book*, %Book** %vtpm.234
	%vtpm.236 = icmp eq %Book* %vtpm.235, null
	br i1 %vtpm.236, label %abort, label %ok.1

ok.1:
	%vtpm.237 = getelementptr %Book, %Book* %vtpm.235, i32 0, i32 0
	%vtpm.238 = load %_Book_vtable*, %_Book_vtable** %vtpm.237
	%vtpm.239 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.238, i32 0, i32 12
	%vtpm.240 = load %Object* (%Book*) *, %Object* (%Book*) ** %vtpm.239
	%vtpm.241 = call %Object*(%Book* )%vtpm.240( %Book* %vtpm.235 )
	%tmp.1 = icmp eq %Object* %vtpm.241, null
	br i1 %tmp.1, label %abort, label %ok.2

ok.2:
	%vtpm.242 = getelementptr %Object, %Object* %vtpm.241, i32 0, i32 0
	%vtpm.243 = load %_Object_vtable*, %_Object_vtable** %vtpm.242
	%vtpm.244 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.243, i32 0, i32 0
	%vtpm.245 = load i32, i32* %vtpm.244
	br label %case.hdr.0

case.hdr.0:
	br label %case.6.0

case.6.0:
	%vtpm.246 = icmp slt i32 %vtpm.245, 6
	br i1 %vtpm.246, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.247 = icmp sgt i32 %vtpm.245, 6
	br i1 %vtpm.247, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.248 = bitcast %Object* %vtpm.241 to %Article*
	store %Article* %vtpm.248, %Article** %vtpm.222
	%vtpm.249 = load %String*, %String** %vtpm.220
	%vtpm.250 = icmp eq %String* %vtpm.249, null
	br i1 %vtpm.250, label %abort, label %ok.3

ok.3:
	%vtpm.251 = getelementptr %String, %String* %vtpm.249, i32 0, i32 0
	%vtpm.252 = load %_String_vtable*, %_String_vtable** %vtpm.251
	%vtpm.253 = getelementptr %_String_vtable, %_String_vtable* %vtpm.252, i32 0, i32 8
	%vtpm.254 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.253
	%vtpm.255 = call %String*(%String*, %String* )%vtpm.254( %String* %vtpm.249, %String* @String.6 )
	store %String* %vtpm.255, %String** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.256 = icmp slt i32 %vtpm.245, 5
	br i1 %vtpm.256, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.257 = icmp sgt i32 %vtpm.245, 6
	br i1 %vtpm.257, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%vtpm.258 = bitcast %Object* %vtpm.241 to %Book*
	store %Book* %vtpm.258, %Book** %vtpm.221
	%vtpm.259 = load %String*, %String** %vtpm.220
	%vtpm.260 = icmp eq %String* %vtpm.259, null
	br i1 %vtpm.260, label %abort, label %ok.4

ok.4:
	%vtpm.261 = getelementptr %String, %String* %vtpm.259, i32 0, i32 0
	%vtpm.262 = load %_String_vtable*, %_String_vtable** %vtpm.261
	%vtpm.263 = getelementptr %_String_vtable, %_String_vtable* %vtpm.262, i32 0, i32 8
	%vtpm.264 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.263
	%vtpm.265 = call %String*(%String*, %String* )%vtpm.264( %String* %vtpm.259, %String* @String.7 )
	store %String* %vtpm.265, %String** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.2 = load %String*, %String** %tmp.0
	store %String* %tmp.2, %String** %vtpm.220
	%vtpm.266 = load %String*, %String** %vtpm.220
	%vtpm.267 = load %Cons*, %Cons** %vtpm.219
	%vtpm.268 = getelementptr %Cons, %Cons* %vtpm.267, i32 0, i32 2
	%vtpm.269 = load %BookList*, %BookList** %vtpm.268
	%vtpm.270 = icmp eq %BookList* %vtpm.269, null
	br i1 %vtpm.270, label %abort, label %ok.5

ok.5:
	%vtpm.271 = getelementptr %BookList, %BookList* %vtpm.269, i32 0, i32 0
	%vtpm.272 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.271
	%vtpm.273 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.272, i32 0, i32 15
	%vtpm.274 = load %String* (%BookList*,%String*) *, %String* (%BookList*,%String*) ** %vtpm.273
	%vtpm.275 = call %String*(%BookList*, %String* )%vtpm.274( %BookList* %vtpm.269, %String* %vtpm.266 )
	ret %String* %vtpm.275

abort:
	call void @abort(  )
	unreachable
}

define %Cons* @Cons_new() {

entry:
	%vtpm.277 = alloca %Cons*
	%vtpm.278 = getelementptr %_Cons_vtable, %_Cons_vtable* @_Cons_vtable_prototype, i32 0, i32 1
	%vtpm.279 = load i32, i32* %vtpm.278
	%vtpm.280 = call i8*(i32 ) @malloc( i32 %vtpm.279 )
	%vtpm.281 = bitcast i8* %vtpm.280 to %Cons*
	%vtpm.282 = icmp eq %Cons* %vtpm.281, null
	br i1 %vtpm.282, label %abort, label %ok.6

ok.6:
	%vtpm.283 = getelementptr %Cons, %Cons* %vtpm.281, i32 0, i32 0
	store %_Cons_vtable* @_Cons_vtable_prototype, %_Cons_vtable** %vtpm.283
	store %Cons* %vtpm.281, %Cons** %vtpm.277
	%vtpm.284 = getelementptr %Cons, %Cons* %vtpm.281, i32 0, i32 1
	store %Book* null, %Book** %vtpm.284
	%vtpm.285 = getelementptr %Cons, %Cons* %vtpm.281, i32 0, i32 2
	store %BookList* null, %BookList** %vtpm.285
	ret %Cons* %vtpm.281

abort:
	call void @abort(  )
	unreachable
}

define i1 @Nil.isNil(%Nil* %self) {

entry:
	%vtpm.287 = alloca %Nil*
	store %Nil* %self, %Nil** %vtpm.287
	ret i1 true

abort:
	call void @abort(  )
	unreachable
}

define %String* @Nil.print_list(%Nil* %self, %String* %s) {

entry:
	%vtpm.289 = alloca %Nil*
	%vtpm.290 = alloca %String*
	store %Nil* %self, %Nil** %vtpm.289
	store %String* %s, %String** %vtpm.290
	%vtpm.291 = load %String*, %String** %vtpm.290
	ret %String* %vtpm.291

abort:
	call void @abort(  )
	unreachable
}

define %Nil* @Nil_new() {

entry:
	%vtpm.293 = alloca %Nil*
	%vtpm.294 = getelementptr %_Nil_vtable, %_Nil_vtable* @_Nil_vtable_prototype, i32 0, i32 1
	%vtpm.295 = load i32, i32* %vtpm.294
	%vtpm.296 = call i8*(i32 ) @malloc( i32 %vtpm.295 )
	%vtpm.297 = bitcast i8* %vtpm.296 to %Nil*
	%vtpm.298 = icmp eq %Nil* %vtpm.297, null
	br i1 %vtpm.298, label %abort, label %ok.0

ok.0:
	%vtpm.299 = getelementptr %Nil, %Nil* %vtpm.297, i32 0, i32 0
	store %_Nil_vtable* @_Nil_vtable_prototype, %_Nil_vtable** %vtpm.299
	store %Nil* %vtpm.297, %Nil** %vtpm.293
	ret %Nil* %vtpm.297

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main.main(%Main* %self) {

entry:
	%vtpm.301 = alloca %Main*
	%vtpm.302 = alloca %Book*
	%vtpm.303 = alloca %Article*
	store %Main* %self, %Main** %vtpm.301
	%vtpm.304 = call %Book* @Book_new(  )
	%vtpm.305 = icmp eq %Book* %vtpm.304, null
	br i1 %vtpm.305, label %abort, label %ok.0

ok.0:
	%vtpm.306 = icmp eq %Book* %vtpm.304, null
	br i1 %vtpm.306, label %abort, label %ok.1

ok.1:
	%vtpm.307 = getelementptr %Book, %Book* %vtpm.304, i32 0, i32 0
	%vtpm.308 = load %_Book_vtable*, %_Book_vtable** %vtpm.307
	%vtpm.309 = getelementptr %_Book_vtable, %_Book_vtable* %vtpm.308, i32 0, i32 11
	%vtpm.310 = load %Book* (%Book*,%String*,%String*) *, %Book* (%Book*,%String*,%String*) ** %vtpm.309
	%vtpm.311 = call %Book*(%Book*, %String*, %String* )%vtpm.310( %Book* %vtpm.304, %String* @String.5, %String* @String.4 )
	store %Book* %vtpm.311, %Book** %vtpm.302
	%vtpm.312 = call %Article* @Article_new(  )
	%vtpm.313 = icmp eq %Article* %vtpm.312, null
	br i1 %vtpm.313, label %abort, label %ok.2

ok.2:
	%vtpm.314 = icmp eq %Article* %vtpm.312, null
	br i1 %vtpm.314, label %abort, label %ok.3

ok.3:
	%vtpm.315 = getelementptr %Article, %Article* %vtpm.312, i32 0, i32 0
	%vtpm.316 = load %_Article_vtable*, %_Article_vtable** %vtpm.315
	%vtpm.317 = getelementptr %_Article_vtable, %_Article_vtable* %vtpm.316, i32 0, i32 14
	%vtpm.318 = load %Article* (%Article*,%String*,%String*,%String*) *, %Article* (%Article*,%String*,%String*,%String*) ** %vtpm.317
	%vtpm.319 = call %Article*(%Article*, %String*, %String*, %String* )%vtpm.318( %Article* %vtpm.312, %String* @String.3, %String* @String.2, %String* @String.1 )
	store %Article* %vtpm.319, %Article** %vtpm.303
	%vtpm.320 = load %Article*, %Article** %vtpm.303
	%vtpm.321 = load %Book*, %Book** %vtpm.302
	%vtpm.322 = call %Nil* @Nil_new(  )
	%vtpm.323 = icmp eq %Nil* %vtpm.322, null
	br i1 %vtpm.323, label %abort, label %ok.4

ok.4:
	%vtpm.324 = icmp eq %Nil* %vtpm.322, null
	br i1 %vtpm.324, label %abort, label %ok.5

ok.5:
	%vtpm.325 = getelementptr %Nil, %Nil* %vtpm.322, i32 0, i32 0
	%vtpm.326 = load %_Nil_vtable*, %_Nil_vtable** %vtpm.325
	%vtpm.327 = getelementptr %_Nil_vtable, %_Nil_vtable* %vtpm.326, i32 0, i32 12
	%vtpm.328 = load %Cons* (%Nil*,%Book*) *, %Cons* (%Nil*,%Book*) ** %vtpm.327
	%vtpm.329 = call %Cons*(%Nil*, %Book* )%vtpm.328( %Nil* %vtpm.322, %Book* %vtpm.321 )
	%vtpm.330 = icmp eq %Cons* %vtpm.329, null
	br i1 %vtpm.330, label %abort, label %ok.6

ok.6:
	%vtpm.331 = getelementptr %Cons, %Cons* %vtpm.329, i32 0, i32 0
	%vtpm.332 = load %_Cons_vtable*, %_Cons_vtable** %vtpm.331
	%vtpm.333 = getelementptr %_Cons_vtable, %_Cons_vtable* %vtpm.332, i32 0, i32 12
	%vtpm.334 = load %Cons* (%Cons*,%Book*) *, %Cons* (%Cons*,%Book*) ** %vtpm.333
	%vtpm.335 = bitcast %Article* %vtpm.320 to %Book*
	%vtpm.336 = call %Cons*(%Cons*, %Book* )%vtpm.334( %Cons* %vtpm.329, %Book* %vtpm.335 )
	%vtpm.337 = load %Main*, %Main** %vtpm.301
	%vtpm.338 = getelementptr %Main, %Main* %vtpm.337, i32 0, i32 1
	%vtpm.339 = bitcast %Cons* %vtpm.336 to %BookList*
	store %BookList* %vtpm.339, %BookList** %vtpm.338
	%vtpm.340 = load %Main*, %Main** %vtpm.301
	%vtpm.341 = getelementptr %Main, %Main* %vtpm.340, i32 0, i32 1
	%vtpm.342 = load %BookList*, %BookList** %vtpm.341
	%vtpm.343 = icmp eq %BookList* %vtpm.342, null
	br i1 %vtpm.343, label %abort, label %ok.7

ok.7:
	%vtpm.344 = getelementptr %BookList, %BookList* %vtpm.342, i32 0, i32 0
	%vtpm.345 = load %_BookList_vtable*, %_BookList_vtable** %vtpm.344
	%vtpm.346 = getelementptr %_BookList_vtable, %_BookList_vtable* %vtpm.345, i32 0, i32 15
	%vtpm.347 = load %String* (%BookList*,%String*) *, %String* (%BookList*,%String*) ** %vtpm.346
	%vtpm.348 = call %String*(%BookList*, %String* )%vtpm.347( %BookList* %vtpm.342, %String* @String.8 )
	ret %String* %vtpm.348

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.350 = alloca %Main*
	%vtpm.351 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.352 = load i32, i32* %vtpm.351
	%vtpm.353 = call i8*(i32 ) @malloc( i32 %vtpm.352 )
	%vtpm.354 = bitcast i8* %vtpm.353 to %Main*
	%vtpm.355 = icmp eq %Main* %vtpm.354, null
	br i1 %vtpm.355, label %abort, label %ok.8

ok.8:
	%vtpm.356 = getelementptr %Main, %Main* %vtpm.354, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.356
	store %Main* %vtpm.354, %Main** %vtpm.350
	%vtpm.357 = getelementptr %Main, %Main* %vtpm.354, i32 0, i32 1
	store %BookList* null, %BookList** %vtpm.357
	ret %Main* %vtpm.354

abort:
	call void @abort(  )
	unreachable
}

