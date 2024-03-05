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
	%A*,
	%A*,
	%A*,
	%B*
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
	%Main* (%Main*) * @Main.main
}

@str.A = internal constant [2 x i8] c"A\00"
%A = type {
	%_A_vtable*,
	i32
}

%_A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%A*) *,
	%String* (%A*) *,
	%A* (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *)
}

@str.B = internal constant [2 x i8] c"B\00"
%B = type {
	%_B_vtable*,
	i32
}

%_B_vtable = type {
	i32,
	i32,
	i8*,
	%B* () *,
	%Object* (%B*) *,
	%String* (%B*) *,
	%B* (%B*) *
}

@_B_vtable_prototype = constant %_B_vtable {
	i32 7,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *)
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

@str.3 = internal constant [12 x i8] c"equal4_o.cl\00"
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

define %Main* @Main.main(%Main* %self) {

entry:
	%vtpm.0 = alloca %Main*
	%vtpm.1 = alloca %Main*
	%vtpm.2 = alloca %Main*
	%vtpm.3 = alloca %Main*
	store %Main* %self, %Main** %vtpm.0
	%vtpm.4 = load %Main*, %Main** %vtpm.0
	%vtpm.5 = getelementptr %Main, %Main* %vtpm.4, i32 0, i32 1
	%vtpm.6 = load %A*, %A** %vtpm.5
	%vtpm.7 = load %Main*, %Main** %vtpm.0
	%vtpm.8 = getelementptr %Main, %Main* %vtpm.7, i32 0, i32 2
	%vtpm.9 = load %A*, %A** %vtpm.8
	%vtpm.10 = bitcast %A* %vtpm.6 to i8*
	%vtpm.11 = bitcast %A* %vtpm.9 to i8*
	%vtpm.12 = icmp eq i8* %vtpm.10, %vtpm.11
	br i1 %vtpm.12, label %true.0, label %false.0

true.0:
	%vtpm.13 = load %Main*, %Main** %vtpm.0
	%vtpm.14 = icmp eq %Main* %vtpm.13, null
	br i1 %vtpm.14, label %abort, label %ok.0

ok.0:
	%vtpm.15 = getelementptr %Main, %Main* %vtpm.13, i32 0, i32 0
	%vtpm.16 = load %_Main_vtable*, %_Main_vtable** %vtpm.15
	%vtpm.17 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.16, i32 0, i32 7
	%vtpm.18 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.17
	%vtpm.19 = call %Main*(%Main*, %String* )%vtpm.18( %Main* %vtpm.13, %String* @String.2 )
	store %Main* %vtpm.19, %Main** %vtpm.1
	br label %end.0

false.0:
	%vtpm.20 = load %Main*, %Main** %vtpm.0
	%vtpm.21 = getelementptr %Main, %Main* %vtpm.20, i32 0, i32 2
	%vtpm.22 = load %A*, %A** %vtpm.21
	%vtpm.23 = load %Main*, %Main** %vtpm.0
	%vtpm.24 = getelementptr %Main, %Main* %vtpm.23, i32 0, i32 3
	%vtpm.25 = load %A*, %A** %vtpm.24
	%vtpm.26 = bitcast %A* %vtpm.22 to i8*
	%vtpm.27 = bitcast %A* %vtpm.25 to i8*
	%vtpm.28 = icmp eq i8* %vtpm.26, %vtpm.27
	br i1 %vtpm.28, label %true.1, label %false.1

true.1:
	%vtpm.29 = load %Main*, %Main** %vtpm.0
	%vtpm.30 = getelementptr %Main, %Main* %vtpm.29, i32 0, i32 4
	%vtpm.31 = load %B*, %B** %vtpm.30
	%vtpm.32 = load %Main*, %Main** %vtpm.0
	%vtpm.33 = getelementptr %Main, %Main* %vtpm.32, i32 0, i32 2
	%vtpm.34 = load %A*, %A** %vtpm.33
	%vtpm.35 = bitcast %B* %vtpm.31 to i8*
	%vtpm.36 = bitcast %A* %vtpm.34 to i8*
	%vtpm.37 = icmp eq i8* %vtpm.35, %vtpm.36
	br i1 %vtpm.37, label %true.2, label %false.2

true.2:
	%vtpm.38 = load %Main*, %Main** %vtpm.0
	%vtpm.39 = icmp eq %Main* %vtpm.38, null
	br i1 %vtpm.39, label %abort, label %ok.1

ok.1:
	%vtpm.40 = getelementptr %Main, %Main* %vtpm.38, i32 0, i32 0
	%vtpm.41 = load %_Main_vtable*, %_Main_vtable** %vtpm.40
	%vtpm.42 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.41, i32 0, i32 7
	%vtpm.43 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.42
	%vtpm.44 = call %Main*(%Main*, %String* )%vtpm.43( %Main* %vtpm.38, %String* @String.1 )
	store %Main* %vtpm.44, %Main** %vtpm.3
	br label %end.2

false.2:
	%vtpm.45 = load %Main*, %Main** %vtpm.0
	%vtpm.46 = icmp eq %Main* %vtpm.45, null
	br i1 %vtpm.46, label %abort, label %ok.2

ok.2:
	%vtpm.47 = getelementptr %Main, %Main* %vtpm.45, i32 0, i32 0
	%vtpm.48 = load %_Main_vtable*, %_Main_vtable** %vtpm.47
	%vtpm.49 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.48, i32 0, i32 7
	%vtpm.50 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.49
	%vtpm.51 = call %Main*(%Main*, %String* )%vtpm.50( %Main* %vtpm.45, %String* @String.2 )
	store %Main* %vtpm.51, %Main** %vtpm.3
	br label %end.2

end.2:
	%vtpm.52 = load %Main*, %Main** %vtpm.3
	store %Main* %vtpm.52, %Main** %vtpm.2
	br label %end.1

false.1:
	%vtpm.53 = load %Main*, %Main** %vtpm.0
	%vtpm.54 = icmp eq %Main* %vtpm.53, null
	br i1 %vtpm.54, label %abort, label %ok.3

ok.3:
	%vtpm.55 = getelementptr %Main, %Main* %vtpm.53, i32 0, i32 0
	%vtpm.56 = load %_Main_vtable*, %_Main_vtable** %vtpm.55
	%vtpm.57 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.56, i32 0, i32 7
	%vtpm.58 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.57
	%vtpm.59 = call %Main*(%Main*, %String* )%vtpm.58( %Main* %vtpm.53, %String* @String.2 )
	store %Main* %vtpm.59, %Main** %vtpm.2
	br label %end.1

end.1:
	%vtpm.60 = load %Main*, %Main** %vtpm.2
	store %Main* %vtpm.60, %Main** %vtpm.1
	br label %end.0

end.0:
	%vtpm.61 = load %Main*, %Main** %vtpm.1
	ret %Main* %vtpm.61

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.63 = alloca %Main*
	%vtpm.64 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.65 = load i32, i32* %vtpm.64
	%vtpm.66 = call i8*(i32 ) @malloc( i32 %vtpm.65 )
	%vtpm.67 = bitcast i8* %vtpm.66 to %Main*
	%vtpm.68 = icmp eq %Main* %vtpm.67, null
	br i1 %vtpm.68, label %abort, label %ok.4

ok.4:
	%vtpm.69 = getelementptr %Main, %Main* %vtpm.67, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.69
	store %Main* %vtpm.67, %Main** %vtpm.63
	%vtpm.70 = getelementptr %Main, %Main* %vtpm.67, i32 0, i32 1
	store %A* null, %A** %vtpm.70
	%vtpm.71 = getelementptr %Main, %Main* %vtpm.67, i32 0, i32 2
	store %A* null, %A** %vtpm.71
	%vtpm.72 = getelementptr %Main, %Main* %vtpm.67, i32 0, i32 3
	store %A* null, %A** %vtpm.72
	%vtpm.73 = getelementptr %Main, %Main* %vtpm.67, i32 0, i32 4
	store %B* null, %B** %vtpm.73
	%vtpm.74 = call %A* @A_new(  )
	%vtpm.75 = icmp eq %A* %vtpm.74, null
	br i1 %vtpm.75, label %abort, label %ok.5

ok.5:
	%vtpm.76 = getelementptr %Main, %Main* %vtpm.67, i32 0, i32 1
	store %A* %vtpm.74, %A** %vtpm.76
	ret %Main* %vtpm.67

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.78 = alloca %A*
	%vtpm.79 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.80 = load i32, i32* %vtpm.79
	%vtpm.81 = call i8*(i32 ) @malloc( i32 %vtpm.80 )
	%vtpm.82 = bitcast i8* %vtpm.81 to %A*
	%vtpm.83 = icmp eq %A* %vtpm.82, null
	br i1 %vtpm.83, label %abort, label %ok.0

ok.0:
	%vtpm.84 = getelementptr %A, %A* %vtpm.82, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.84
	store %A* %vtpm.82, %A** %vtpm.78
	%vtpm.85 = getelementptr %A, %A* %vtpm.82, i32 0, i32 1
	store i32 0, i32* %vtpm.85
	%vtpm.86 = getelementptr %A, %A* %vtpm.82, i32 0, i32 1
	store i32 2, i32* %vtpm.86
	ret %A* %vtpm.82

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%vtpm.88 = alloca %B*
	%vtpm.89 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 1
	%vtpm.90 = load i32, i32* %vtpm.89
	%vtpm.91 = call i8*(i32 ) @malloc( i32 %vtpm.90 )
	%vtpm.92 = bitcast i8* %vtpm.91 to %B*
	%vtpm.93 = icmp eq %B* %vtpm.92, null
	br i1 %vtpm.93, label %abort, label %ok.0

ok.0:
	%vtpm.94 = getelementptr %B, %B* %vtpm.92, i32 0, i32 0
	store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.94
	store %B* %vtpm.92, %B** %vtpm.88
	%vtpm.95 = getelementptr %B, %B* %vtpm.92, i32 0, i32 1
	store i32 0, i32* %vtpm.95
	%vtpm.96 = getelementptr %B, %B* %vtpm.92, i32 0, i32 1
	store i32 3, i32* %vtpm.96
	ret %B* %vtpm.92

abort:
	call void @abort(  )
	unreachable
}

