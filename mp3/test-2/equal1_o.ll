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

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%_Main_vtable*
}

%_Main_vtable = type {
	i32,
	i32,
	i8*,
	%Main* () *,
	%Object* (%Main*) *,
	%String* (%Main*) *,
	%Main* (%Main*) *,
	%Main* (%Main*,%String*) *,
	%Main* (%Main*,i32) *,
	%String* (%Main*) *,
	i32 (%Main*) *,
	i1 (%Main*) *,
	%Main* (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
	i32 5,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%Main* (%Main*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
	%Main* (%Main*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Main* (%Main*,i32) *),
	%String* (%Main*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Main*) *),
	i32 (%Main*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Main*) *),
	i1 (%Main*) * @Main.func,
	%Main* (%Main*) * @Main.main
}

@str.0 = internal constant [14 x i8] c"<basic class>\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

@str.1 = internal constant [5 x i8] c"ok!\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([5 x i8], [5 x i8]* @str.1, i32 0, i32 0)
}

@str.2 = internal constant [9 x i8] c"not ok!\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([9 x i8], [9 x i8]* @str.2, i32 0, i32 0)
}

@str.3 = internal constant [12 x i8] c"equal1_o.cl\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @str.3, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call %Main*(%Main* ) @Main.main( %Main* %main.obj )
	ret i32 0
}

define i1 @Main.func(%Main* %self) {

entry:
	%vtpm.0 = alloca %Main*
	store %Main* %self, %Main** %vtpm.0
	%vtpm.1 = icmp eq i32 2, 5
	ret i1 %vtpm.1

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main.main(%Main* %self) {

entry:
	%vtpm.3 = alloca %Main*
	%vtpm.4 = alloca %Main*
	store %Main* %self, %Main** %vtpm.3
	%vtpm.5 = load %Main*, %Main** %vtpm.3
	%vtpm.6 = icmp eq %Main* %vtpm.5, null
	br i1 %vtpm.6, label %abort, label %ok.0

ok.0:
	%vtpm.7 = getelementptr %Main, %Main* %vtpm.5, i32 0, i32 0
	%vtpm.8 = load %_Main_vtable*, %_Main_vtable** %vtpm.7
	%vtpm.9 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.8, i32 0, i32 11
	%vtpm.10 = load i1 (%Main*) *, i1 (%Main*) ** %vtpm.9
	%vtpm.11 = call i1(%Main* )%vtpm.10( %Main* %vtpm.5 )
	br i1 %vtpm.11, label %true.0, label %false.0

true.0:
	%vtpm.12 = load %Main*, %Main** %vtpm.3
	%vtpm.13 = icmp eq %Main* %vtpm.12, null
	br i1 %vtpm.13, label %abort, label %ok.1

ok.1:
	%vtpm.14 = getelementptr %Main, %Main* %vtpm.12, i32 0, i32 0
	%vtpm.15 = load %_Main_vtable*, %_Main_vtable** %vtpm.14
	%vtpm.16 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.15, i32 0, i32 7
	%vtpm.17 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.16
	%vtpm.18 = call %Main*(%Main*, %String* )%vtpm.17( %Main* %vtpm.12, %String* @String.2 )
	store %Main* %vtpm.18, %Main** %vtpm.4
	br label %end.0

false.0:
	%vtpm.19 = load %Main*, %Main** %vtpm.3
	%vtpm.20 = icmp eq %Main* %vtpm.19, null
	br i1 %vtpm.20, label %abort, label %ok.2

ok.2:
	%vtpm.21 = getelementptr %Main, %Main* %vtpm.19, i32 0, i32 0
	%vtpm.22 = load %_Main_vtable*, %_Main_vtable** %vtpm.21
	%vtpm.23 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.22, i32 0, i32 7
	%vtpm.24 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.23
	%vtpm.25 = call %Main*(%Main*, %String* )%vtpm.24( %Main* %vtpm.19, %String* @String.1 )
	store %Main* %vtpm.25, %Main** %vtpm.4
	br label %end.0

end.0:
	%vtpm.26 = load %Main*, %Main** %vtpm.4
	ret %Main* %vtpm.26

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.28 = alloca %Main*
	%vtpm.29 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.30 = load i32, i32* %vtpm.29
	%vtpm.31 = call i8*(i32 ) @malloc( i32 %vtpm.30 )
	%vtpm.32 = bitcast i8* %vtpm.31 to %Main*
	%vtpm.33 = icmp eq %Main* %vtpm.32, null
	br i1 %vtpm.33, label %abort, label %ok.3

ok.3:
	%vtpm.34 = getelementptr %Main, %Main* %vtpm.32, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.34
	store %Main* %vtpm.32, %Main** %vtpm.28
	ret %Main* %vtpm.32

abort:
	call void @abort(  )
	unreachable
}

