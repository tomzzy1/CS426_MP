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

@str.A = internal constant [2 x i8] c"A\00"
%A = type {
	%_A_vtable*,
	%Object*,
	i32
}

%_A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%A*) *,
	%String* (%A*) *,
	%A* (%A*) *,
	%A* (%A*,%String*) *,
	%A* (%A*,i32) *,
	%String* (%A*) *,
	i32 (%A*) *,
	%Object* (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 5,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *),
	%A* (%A*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %A* (%A*,%String*) *),
	%A* (%A*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %A* (%A*,i32) *),
	%String* (%A*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%A*) *),
	i32 (%A*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%A*) *),
	%Object* (%A*) * @A.f
}

@str.B = internal constant [2 x i8] c"B\00"
%B = type {
	%_B_vtable*,
	%Object*,
	i32,
	i32
}

%_B_vtable = type {
	i32,
	i32,
	i8*,
	%B* () *,
	%Object* (%B*) *,
	%String* (%B*) *,
	%B* (%B*) *,
	%B* (%B*,%String*) *,
	%B* (%B*,i32) *,
	%String* (%B*) *,
	i32 (%B*) *,
	%Object* (%B*) *,
	%Object* (%B*) *
}

@_B_vtable_prototype = constant %_B_vtable {
	i32 6,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *),
	%B* (%B*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %B* (%B*,%String*) *),
	%B* (%B*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %B* (%B*,i32) *),
	%String* (%B*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%B*) *),
	i32 (%B*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%B*) *),
	%Object* (%B*) * bitcast (%Object* (%A*) * @A.f to %Object* (%B*) *),
	%Object* (%B*) * @B.f
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
	%Object* (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
	i32 7,
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

@str.0 = internal constant [14 x i8] c"<basic class>\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

@str.1 = internal constant [7 x i8] c"new B\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @str.1, i32 0, i32 0)
}

@str.2 = internal constant [7 x i8] c"new A\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @str.2, i32 0, i32 0)
}

@str.3 = internal constant [10 x i8] c"B.f: y = \00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([10 x i8], [10 x i8]* @str.3, i32 0, i32 0)
}

@str.4 = internal constant [28 x i8] c"initializing B.y. here x = \00"
@String.4 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([28 x i8], [28 x i8]* @str.4, i32 0, i32 0)
}

@str.5 = internal constant [2 x i8] c"\0A\00"
@String.5 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.5, i32 0, i32 0)
}

@str.6 = internal constant [10 x i8] c"A.f: x = \00"
@String.6 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([10 x i8], [10 x i8]* @str.6, i32 0, i32 0)
}

@str.7 = internal constant [19 x i8] c"initializer-inh.cl\00"
@String.7 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([19 x i8], [19 x i8]* @str.7, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call %Object*(%Main* ) @Main.main( %Main* %main.obj )
	ret i32 0
}

define %Object* @A.f(%A* %self) {

entry:
	%vtpm.0 = alloca %A*
	store %A* %self, %A** %vtpm.0
	%vtpm.1 = load %A*, %A** %vtpm.0
	%vtpm.2 = icmp eq %A* %vtpm.1, null
	br i1 %vtpm.2, label %abort, label %ok.0

ok.0:
	%vtpm.3 = getelementptr %A, %A* %vtpm.1, i32 0, i32 0
	%vtpm.4 = load %_A_vtable*, %_A_vtable** %vtpm.3
	%vtpm.5 = getelementptr %_A_vtable, %_A_vtable* %vtpm.4, i32 0, i32 7
	%vtpm.6 = load %A* (%A*,%String*) *, %A* (%A*,%String*) ** %vtpm.5
	%vtpm.7 = call %A*(%A*, %String* )%vtpm.6( %A* %vtpm.1, %String* @String.6 )
	%vtpm.8 = load %A*, %A** %vtpm.0
	%vtpm.9 = getelementptr %A, %A* %vtpm.8, i32 0, i32 2
	%vtpm.10 = load i32, i32* %vtpm.9
	%vtpm.11 = load %A*, %A** %vtpm.0
	%vtpm.12 = icmp eq %A* %vtpm.11, null
	br i1 %vtpm.12, label %abort, label %ok.1

ok.1:
	%vtpm.13 = getelementptr %A, %A* %vtpm.11, i32 0, i32 0
	%vtpm.14 = load %_A_vtable*, %_A_vtable** %vtpm.13
	%vtpm.15 = getelementptr %_A_vtable, %_A_vtable* %vtpm.14, i32 0, i32 8
	%vtpm.16 = load %A* (%A*,i32) *, %A* (%A*,i32) ** %vtpm.15
	%vtpm.17 = call %A*(%A*, i32 )%vtpm.16( %A* %vtpm.11, i32 %vtpm.10 )
	%vtpm.18 = load %A*, %A** %vtpm.0
	%vtpm.19 = icmp eq %A* %vtpm.18, null
	br i1 %vtpm.19, label %abort, label %ok.2

ok.2:
	%vtpm.20 = getelementptr %A, %A* %vtpm.18, i32 0, i32 0
	%vtpm.21 = load %_A_vtable*, %_A_vtable** %vtpm.20
	%vtpm.22 = getelementptr %_A_vtable, %_A_vtable* %vtpm.21, i32 0, i32 7
	%vtpm.23 = load %A* (%A*,%String*) *, %A* (%A*,%String*) ** %vtpm.22
	%vtpm.24 = call %A*(%A*, %String* )%vtpm.23( %A* %vtpm.18, %String* @String.5 )
	%vtpm.25 = bitcast %A* %vtpm.24 to %Object*
	ret %Object* %vtpm.25

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.27 = alloca %A*
	%vtpm.28 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.29 = load i32, i32* %vtpm.28
	%vtpm.30 = call i8*(i32 ) @malloc( i32 %vtpm.29 )
	%vtpm.31 = bitcast i8* %vtpm.30 to %A*
	%vtpm.32 = icmp eq %A* %vtpm.31, null
	br i1 %vtpm.32, label %abort, label %ok.3

ok.3:
	%vtpm.33 = getelementptr %A, %A* %vtpm.31, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.33
	store %A* %vtpm.31, %A** %vtpm.27
	%vtpm.34 = getelementptr %A, %A* %vtpm.31, i32 0, i32 1
	store %Object* null, %Object** %vtpm.34
	%vtpm.35 = getelementptr %A, %A* %vtpm.31, i32 0, i32 2
	store i32 0, i32* %vtpm.35
	%vtpm.36 = load %A*, %A** %vtpm.27
	%vtpm.37 = icmp eq %A* %vtpm.36, null
	br i1 %vtpm.37, label %abort, label %ok.4

ok.4:
	%vtpm.38 = getelementptr %A, %A* %vtpm.36, i32 0, i32 0
	%vtpm.39 = load %_A_vtable*, %_A_vtable** %vtpm.38
	%vtpm.40 = getelementptr %_A_vtable, %_A_vtable* %vtpm.39, i32 0, i32 11
	%vtpm.41 = load %Object* (%A*) *, %Object* (%A*) ** %vtpm.40
	%vtpm.42 = call %Object*(%A* )%vtpm.41( %A* %vtpm.36 )
	%vtpm.43 = getelementptr %A, %A* %vtpm.31, i32 0, i32 1
	store %Object* %vtpm.42, %Object** %vtpm.43
	%vtpm.44 = getelementptr %A, %A* %vtpm.31, i32 0, i32 2
	store i32 12, i32* %vtpm.44
	ret %A* %vtpm.31

abort:
	call void @abort(  )
	unreachable
}

define %Object* @B.f(%B* %self) {

entry:
	%vtpm.46 = alloca %B*
	store %B* %self, %B** %vtpm.46
	%vtpm.47 = load %B*, %B** %vtpm.46
	%vtpm.48 = icmp eq %B* %vtpm.47, null
	br i1 %vtpm.48, label %abort, label %ok.0

ok.0:
	%vtpm.49 = getelementptr %B, %B* %vtpm.47, i32 0, i32 0
	%vtpm.50 = load %_B_vtable*, %_B_vtable** %vtpm.49
	%vtpm.51 = getelementptr %_B_vtable, %_B_vtable* %vtpm.50, i32 0, i32 7
	%vtpm.52 = load %B* (%B*,%String*) *, %B* (%B*,%String*) ** %vtpm.51
	%vtpm.53 = call %B*(%B*, %String* )%vtpm.52( %B* %vtpm.47, %String* @String.3 )
	%vtpm.54 = load %B*, %B** %vtpm.46
	%vtpm.55 = getelementptr %B, %B* %vtpm.54, i32 0, i32 3
	%vtpm.56 = load i32, i32* %vtpm.55
	%vtpm.57 = load %B*, %B** %vtpm.46
	%vtpm.58 = icmp eq %B* %vtpm.57, null
	br i1 %vtpm.58, label %abort, label %ok.1

ok.1:
	%vtpm.59 = getelementptr %B, %B* %vtpm.57, i32 0, i32 0
	%vtpm.60 = load %_B_vtable*, %_B_vtable** %vtpm.59
	%vtpm.61 = getelementptr %_B_vtable, %_B_vtable* %vtpm.60, i32 0, i32 8
	%vtpm.62 = load %B* (%B*,i32) *, %B* (%B*,i32) ** %vtpm.61
	%vtpm.63 = call %B*(%B*, i32 )%vtpm.62( %B* %vtpm.57, i32 %vtpm.56 )
	%vtpm.64 = load %B*, %B** %vtpm.46
	%vtpm.65 = icmp eq %B* %vtpm.64, null
	br i1 %vtpm.65, label %abort, label %ok.2

ok.2:
	%vtpm.66 = getelementptr %B, %B* %vtpm.64, i32 0, i32 0
	%vtpm.67 = load %_B_vtable*, %_B_vtable** %vtpm.66
	%vtpm.68 = getelementptr %_B_vtable, %_B_vtable* %vtpm.67, i32 0, i32 7
	%vtpm.69 = load %B* (%B*,%String*) *, %B* (%B*,%String*) ** %vtpm.68
	%vtpm.70 = call %B*(%B*, %String* )%vtpm.69( %B* %vtpm.64, %String* @String.5 )
	%vtpm.71 = bitcast %B* %vtpm.70 to %Object*
	ret %Object* %vtpm.71

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%vtpm.73 = alloca %B*
	%vtpm.74 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 1
	%vtpm.75 = load i32, i32* %vtpm.74
	%vtpm.76 = call i8*(i32 ) @malloc( i32 %vtpm.75 )
	%vtpm.77 = bitcast i8* %vtpm.76 to %B*
	%vtpm.78 = icmp eq %B* %vtpm.77, null
	br i1 %vtpm.78, label %abort, label %ok.3

ok.3:
	%vtpm.79 = getelementptr %B, %B* %vtpm.77, i32 0, i32 0
	store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.79
	store %B* %vtpm.77, %B** %vtpm.73
	%vtpm.80 = getelementptr %B, %B* %vtpm.77, i32 0, i32 1
	store %Object* null, %Object** %vtpm.80
	%vtpm.81 = getelementptr %B, %B* %vtpm.77, i32 0, i32 2
	store i32 0, i32* %vtpm.81
	%vtpm.82 = getelementptr %B, %B* %vtpm.77, i32 0, i32 3
	store i32 0, i32* %vtpm.82
	%vtpm.83 = load %B*, %B** %vtpm.73
	%vtpm.84 = icmp eq %B* %vtpm.83, null
	br i1 %vtpm.84, label %abort, label %ok.4

ok.4:
	%vtpm.85 = getelementptr %B, %B* %vtpm.83, i32 0, i32 0
	%vtpm.86 = load %_B_vtable*, %_B_vtable** %vtpm.85
	%vtpm.87 = getelementptr %_B_vtable, %_B_vtable* %vtpm.86, i32 0, i32 12
	%vtpm.88 = load %Object* (%B*) *, %Object* (%B*) ** %vtpm.87
	%vtpm.89 = call %Object*(%B* )%vtpm.88( %B* %vtpm.83 )
	%vtpm.90 = getelementptr %B, %B* %vtpm.77, i32 0, i32 1
	store %Object* %vtpm.89, %Object** %vtpm.90
	%vtpm.91 = getelementptr %B, %B* %vtpm.77, i32 0, i32 2
	store i32 12, i32* %vtpm.91
	%vtpm.92 = load %B*, %B** %vtpm.73
	%vtpm.93 = icmp eq %B* %vtpm.92, null
	br i1 %vtpm.93, label %abort, label %ok.5

ok.5:
	%vtpm.94 = getelementptr %B, %B* %vtpm.92, i32 0, i32 0
	%vtpm.95 = load %_B_vtable*, %_B_vtable** %vtpm.94
	%vtpm.96 = getelementptr %_B_vtable, %_B_vtable* %vtpm.95, i32 0, i32 7
	%vtpm.97 = load %B* (%B*,%String*) *, %B* (%B*,%String*) ** %vtpm.96
	%vtpm.98 = call %B*(%B*, %String* )%vtpm.97( %B* %vtpm.92, %String* @String.4 )
	%vtpm.99 = load %B*, %B** %vtpm.73
	%vtpm.100 = getelementptr %B, %B* %vtpm.99, i32 0, i32 2
	%vtpm.101 = load i32, i32* %vtpm.100
	%vtpm.102 = load %B*, %B** %vtpm.73
	%vtpm.103 = icmp eq %B* %vtpm.102, null
	br i1 %vtpm.103, label %abort, label %ok.6

ok.6:
	%vtpm.104 = getelementptr %B, %B* %vtpm.102, i32 0, i32 0
	%vtpm.105 = load %_B_vtable*, %_B_vtable** %vtpm.104
	%vtpm.106 = getelementptr %_B_vtable, %_B_vtable* %vtpm.105, i32 0, i32 8
	%vtpm.107 = load %B* (%B*,i32) *, %B* (%B*,i32) ** %vtpm.106
	%vtpm.108 = call %B*(%B*, i32 )%vtpm.107( %B* %vtpm.102, i32 %vtpm.101 )
	%vtpm.109 = load %B*, %B** %vtpm.73
	%vtpm.110 = icmp eq %B* %vtpm.109, null
	br i1 %vtpm.110, label %abort, label %ok.7

ok.7:
	%vtpm.111 = getelementptr %B, %B* %vtpm.109, i32 0, i32 0
	%vtpm.112 = load %_B_vtable*, %_B_vtable** %vtpm.111
	%vtpm.113 = getelementptr %_B_vtable, %_B_vtable* %vtpm.112, i32 0, i32 7
	%vtpm.114 = load %B* (%B*,%String*) *, %B* (%B*,%String*) ** %vtpm.113
	%vtpm.115 = call %B*(%B*, %String* )%vtpm.114( %B* %vtpm.109, %String* @String.5 )
	%vtpm.116 = getelementptr %B, %B* %vtpm.77, i32 0, i32 3
	store i32 13, i32* %vtpm.116
	ret %B* %vtpm.77

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Main.main(%Main* %self) {

entry:
	%vtpm.118 = alloca %Main*
	store %Main* %self, %Main** %vtpm.118
	%vtpm.119 = load %Main*, %Main** %vtpm.118
	%vtpm.120 = icmp eq %Main* %vtpm.119, null
	br i1 %vtpm.120, label %abort, label %ok.0

ok.0:
	%vtpm.121 = getelementptr %Main, %Main* %vtpm.119, i32 0, i32 0
	%vtpm.122 = load %_Main_vtable*, %_Main_vtable** %vtpm.121
	%vtpm.123 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.122, i32 0, i32 7
	%vtpm.124 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.123
	%vtpm.125 = call %Main*(%Main*, %String* )%vtpm.124( %Main* %vtpm.119, %String* @String.2 )
	%vtpm.126 = call %A* @A_new(  )
	%vtpm.127 = icmp eq %A* %vtpm.126, null
	br i1 %vtpm.127, label %abort, label %ok.1

ok.1:
	%vtpm.128 = load %Main*, %Main** %vtpm.118
	%vtpm.129 = icmp eq %Main* %vtpm.128, null
	br i1 %vtpm.129, label %abort, label %ok.2

ok.2:
	%vtpm.130 = getelementptr %Main, %Main* %vtpm.128, i32 0, i32 0
	%vtpm.131 = load %_Main_vtable*, %_Main_vtable** %vtpm.130
	%vtpm.132 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.131, i32 0, i32 7
	%vtpm.133 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.132
	%vtpm.134 = call %Main*(%Main*, %String* )%vtpm.133( %Main* %vtpm.128, %String* @String.1 )
	%vtpm.135 = call %B* @B_new(  )
	%vtpm.136 = icmp eq %B* %vtpm.135, null
	br i1 %vtpm.136, label %abort, label %ok.3

ok.3:
	%vtpm.137 = bitcast %B* %vtpm.135 to %Object*
	ret %Object* %vtpm.137

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.139 = alloca %Main*
	%vtpm.140 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.141 = load i32, i32* %vtpm.140
	%vtpm.142 = call i8*(i32 ) @malloc( i32 %vtpm.141 )
	%vtpm.143 = bitcast i8* %vtpm.142 to %Main*
	%vtpm.144 = icmp eq %Main* %vtpm.143, null
	br i1 %vtpm.144, label %abort, label %ok.4

ok.4:
	%vtpm.145 = getelementptr %Main, %Main* %vtpm.143, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.145
	store %Main* %vtpm.143, %Main** %vtpm.139
	ret %Main* %vtpm.143

abort:
	call void @abort(  )
	unreachable
}

