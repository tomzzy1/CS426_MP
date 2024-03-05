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
	%_Main_vtable*,
	%Alpha*
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
	%Object* (%Main*) *
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
	%Object* (%Main*) * @Main.main
}

@str.Alpha = internal constant [6 x i8] c"Alpha\00"
%Alpha = type {
	%_Alpha_vtable*,
	i32
}

%_Alpha_vtable = type {
	i32,
	i32,
	i8*,
	%Alpha* () *,
	%Object* (%Alpha*) *,
	%String* (%Alpha*) *,
	%Alpha* (%Alpha*) *,
	i32 (%Alpha*) *
}

@_Alpha_vtable_prototype = constant %_Alpha_vtable {
	i32 6,
	i32 ptrtoint (%Alpha* getelementptr (%Alpha, %Alpha* null, i32 1) to i32),
	i8* getelementptr ([6 x i8], [6 x i8]* @str.Alpha, i32 0, i32 0),
	%Alpha* () * @Alpha_new,
	%Object* (%Alpha*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Alpha*) *),
	%String* (%Alpha*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Alpha*) *),
	%Alpha* (%Alpha*) * bitcast (%Object* (%Object*) * @Object_copy to %Alpha* (%Alpha*) *),
	i32 (%Alpha*) * @Alpha.getX
}

@str.0 = internal constant [14 x i8] c"<basic class>\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

@str.1 = internal constant [10 x i8] c"attr2o.cl\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([10 x i8], [10 x i8]* @str.1, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call %Object*(%Main* ) @Main.main( %Main* %main.obj )
	ret i32 0
}

define %Object* @Main.main(%Main* %self) {

entry:
	%vtpm.0 = alloca %Main*
	store %Main* %self, %Main** %vtpm.0
	%vtpm.1 = load %Main*, %Main** %vtpm.0
	%vtpm.2 = getelementptr %Main, %Main* %vtpm.1, i32 0, i32 1
	%vtpm.3 = load %Alpha*, %Alpha** %vtpm.2
	%vtpm.4 = icmp eq %Alpha* %vtpm.3, null
	br i1 %vtpm.4, label %abort, label %ok.0

ok.0:
	%vtpm.5 = getelementptr %Alpha, %Alpha* %vtpm.3, i32 0, i32 0
	%vtpm.6 = load %_Alpha_vtable*, %_Alpha_vtable** %vtpm.5
	%vtpm.7 = getelementptr %_Alpha_vtable, %_Alpha_vtable* %vtpm.6, i32 0, i32 7
	%vtpm.8 = load i32 (%Alpha*) *, i32 (%Alpha*) ** %vtpm.7
	%vtpm.9 = call i32(%Alpha* )%vtpm.8( %Alpha* %vtpm.3 )
	%vtpm.10 = load %Main*, %Main** %vtpm.0
	%vtpm.11 = icmp eq %Main* %vtpm.10, null
	br i1 %vtpm.11, label %abort, label %ok.1

ok.1:
	%vtpm.12 = getelementptr %Main, %Main* %vtpm.10, i32 0, i32 0
	%vtpm.13 = load %_Main_vtable*, %_Main_vtable** %vtpm.12
	%vtpm.14 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.13, i32 0, i32 8
	%vtpm.15 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.14
	%vtpm.16 = call %Main*(%Main*, i32 )%vtpm.15( %Main* %vtpm.10, i32 %vtpm.9 )
	%vtpm.17 = load %Main*, %Main** %vtpm.0
	%vtpm.18 = bitcast %Main* %vtpm.17 to %Object*
	ret %Object* %vtpm.18

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.20 = alloca %Main*
	%vtpm.21 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.22 = load i32, i32* %vtpm.21
	%vtpm.23 = call i8*(i32 ) @malloc( i32 %vtpm.22 )
	%vtpm.24 = bitcast i8* %vtpm.23 to %Main*
	%vtpm.25 = icmp eq %Main* %vtpm.24, null
	br i1 %vtpm.25, label %abort, label %ok.2

ok.2:
	%vtpm.26 = getelementptr %Main, %Main* %vtpm.24, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.26
	store %Main* %vtpm.24, %Main** %vtpm.20
	%vtpm.27 = getelementptr %Main, %Main* %vtpm.24, i32 0, i32 1
	store %Alpha* null, %Alpha** %vtpm.27
	%vtpm.28 = call %Alpha* @Alpha_new(  )
	%vtpm.29 = icmp eq %Alpha* %vtpm.28, null
	br i1 %vtpm.29, label %abort, label %ok.3

ok.3:
	%vtpm.30 = getelementptr %Main, %Main* %vtpm.24, i32 0, i32 1
	store %Alpha* %vtpm.28, %Alpha** %vtpm.30
	ret %Main* %vtpm.24

abort:
	call void @abort(  )
	unreachable
}

define i32 @Alpha.getX(%Alpha* %self) {

entry:
	%vtpm.32 = alloca %Alpha*
	store %Alpha* %self, %Alpha** %vtpm.32
	%vtpm.33 = load %Alpha*, %Alpha** %vtpm.32
	%vtpm.34 = getelementptr %Alpha, %Alpha* %vtpm.33, i32 0, i32 1
	%vtpm.35 = load i32, i32* %vtpm.34
	ret i32 %vtpm.35

abort:
	call void @abort(  )
	unreachable
}

define %Alpha* @Alpha_new() {

entry:
	%vtpm.37 = alloca %Alpha*
	%vtpm.38 = getelementptr %_Alpha_vtable, %_Alpha_vtable* @_Alpha_vtable_prototype, i32 0, i32 1
	%vtpm.39 = load i32, i32* %vtpm.38
	%vtpm.40 = call i8*(i32 ) @malloc( i32 %vtpm.39 )
	%vtpm.41 = bitcast i8* %vtpm.40 to %Alpha*
	%vtpm.42 = icmp eq %Alpha* %vtpm.41, null
	br i1 %vtpm.42, label %abort, label %ok.0

ok.0:
	%vtpm.43 = getelementptr %Alpha, %Alpha* %vtpm.41, i32 0, i32 0
	store %_Alpha_vtable* @_Alpha_vtable_prototype, %_Alpha_vtable** %vtpm.43
	store %Alpha* %vtpm.41, %Alpha** %vtpm.37
	%vtpm.44 = getelementptr %Alpha, %Alpha* %vtpm.41, i32 0, i32 1
	store i32 0, i32* %vtpm.44
	%vtpm.45 = getelementptr %Alpha, %Alpha* %vtpm.41, i32 0, i32 1
	store i32 67, i32* %vtpm.45
	ret %Alpha* %vtpm.41

abort:
	call void @abort(  )
	unreachable
}

