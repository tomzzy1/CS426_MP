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
	%B*,
	%C*
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
	%_A_vtable*
}

%_A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%A*) *,
	%String* (%A*) *,
	%A* (%A*) *,
	i32 (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%A*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%A*) *),
	%String* (%A*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%A*) *),
	%A* (%A*) * bitcast (%Object* (%Object*) * @Object_copy to %A* (%A*) *),
	i32 (%A*) * @A.f
}

@str.B = internal constant [2 x i8] c"B\00"
%B = type {
	%_B_vtable*
}

%_B_vtable = type {
	i32,
	i32,
	i8*,
	%B* () *,
	%Object* (%B*) *,
	%String* (%B*) *,
	%B* (%B*) *,
	i32 (%B*) *
}

@_B_vtable_prototype = constant %_B_vtable {
	i32 7,
	i32 ptrtoint (%B* getelementptr (%B, %B* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.B, i32 0, i32 0),
	%B* () * @B_new,
	%Object* (%B*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%B*) *),
	%String* (%B*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%B*) *),
	%B* (%B*) * bitcast (%Object* (%Object*) * @Object_copy to %B* (%B*) *),
	i32 (%B*) * bitcast (i32 (%A*) * @A.f to i32 (%B*) *)
}

@str.C = internal constant [2 x i8] c"C\00"
%C = type {
	%_C_vtable*
}

%_C_vtable = type {
	i32,
	i32,
	i8*,
	%C* () *,
	%Object* (%C*) *,
	%String* (%C*) *,
	%C* (%C*) *,
	i32 (%C*) *
}

@_C_vtable_prototype = constant %_C_vtable {
	i32 8,
	i32 ptrtoint (%C* getelementptr (%C, %C* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.C, i32 0, i32 0),
	%C* () * @C_new,
	%Object* (%C*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%C*) *),
	%String* (%C*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%C*) *),
	%C* (%C*) * bitcast (%Object* (%Object*) * @Object_copy to %C* (%C*) *),
	i32 (%C*) * @C.f
}

@str.0 = internal constant [14 x i8] c"<basic class>\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

@str.1 = internal constant [15 x i8] c"dispatch5_o.cl\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @str.1, i32 0, i32 0)
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
	store %Main* %self, %Main** %vtpm.0
	%vtpm.1 = load %Main*, %Main** %vtpm.0
	%vtpm.2 = getelementptr %Main, %Main* %vtpm.1, i32 0, i32 1
	%vtpm.3 = load %A*, %A** %vtpm.2
	%vtpm.4 = icmp eq %A* %vtpm.3, null
	br i1 %vtpm.4, label %abort, label %ok.0

ok.0:
	%vtpm.5 = getelementptr %A, %A* %vtpm.3, i32 0, i32 0
	%vtpm.6 = load %_A_vtable*, %_A_vtable** %vtpm.5
	%vtpm.7 = getelementptr %_A_vtable, %_A_vtable* %vtpm.6, i32 0, i32 7
	%vtpm.8 = load i32 (%A*) *, i32 (%A*) ** %vtpm.7
	%vtpm.9 = call i32(%A* )%vtpm.8( %A* %vtpm.3 )
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
	%vtpm.18 = getelementptr %Main, %Main* %vtpm.17, i32 0, i32 2
	%vtpm.19 = load %A*, %A** %vtpm.18
	%vtpm.20 = icmp eq %A* %vtpm.19, null
	br i1 %vtpm.20, label %abort, label %ok.2

ok.2:
	%vtpm.21 = getelementptr %A, %A* %vtpm.19, i32 0, i32 0
	%vtpm.22 = load %_A_vtable*, %_A_vtable** %vtpm.21
	%vtpm.23 = getelementptr %_A_vtable, %_A_vtable* %vtpm.22, i32 0, i32 7
	%vtpm.24 = load i32 (%A*) *, i32 (%A*) ** %vtpm.23
	%vtpm.25 = call i32(%A* )%vtpm.24( %A* %vtpm.19 )
	%vtpm.26 = load %Main*, %Main** %vtpm.0
	%vtpm.27 = icmp eq %Main* %vtpm.26, null
	br i1 %vtpm.27, label %abort, label %ok.3

ok.3:
	%vtpm.28 = getelementptr %Main, %Main* %vtpm.26, i32 0, i32 0
	%vtpm.29 = load %_Main_vtable*, %_Main_vtable** %vtpm.28
	%vtpm.30 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.29, i32 0, i32 8
	%vtpm.31 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.30
	%vtpm.32 = call %Main*(%Main*, i32 )%vtpm.31( %Main* %vtpm.26, i32 %vtpm.25 )
	%vtpm.33 = load %Main*, %Main** %vtpm.0
	%vtpm.34 = getelementptr %Main, %Main* %vtpm.33, i32 0, i32 3
	%vtpm.35 = load %A*, %A** %vtpm.34
	%vtpm.36 = icmp eq %A* %vtpm.35, null
	br i1 %vtpm.36, label %abort, label %ok.4

ok.4:
	%vtpm.37 = getelementptr %A, %A* %vtpm.35, i32 0, i32 0
	%vtpm.38 = load %_A_vtable*, %_A_vtable** %vtpm.37
	%vtpm.39 = getelementptr %_A_vtable, %_A_vtable* %vtpm.38, i32 0, i32 7
	%vtpm.40 = load i32 (%A*) *, i32 (%A*) ** %vtpm.39
	%vtpm.41 = call i32(%A* )%vtpm.40( %A* %vtpm.35 )
	%vtpm.42 = load %Main*, %Main** %vtpm.0
	%vtpm.43 = icmp eq %Main* %vtpm.42, null
	br i1 %vtpm.43, label %abort, label %ok.5

ok.5:
	%vtpm.44 = getelementptr %Main, %Main* %vtpm.42, i32 0, i32 0
	%vtpm.45 = load %_Main_vtable*, %_Main_vtable** %vtpm.44
	%vtpm.46 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.45, i32 0, i32 8
	%vtpm.47 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.46
	%vtpm.48 = call %Main*(%Main*, i32 )%vtpm.47( %Main* %vtpm.42, i32 %vtpm.41 )
	%vtpm.49 = load %Main*, %Main** %vtpm.0
	%vtpm.50 = getelementptr %Main, %Main* %vtpm.49, i32 0, i32 5
	%vtpm.51 = load %C*, %C** %vtpm.50
	%vtpm.52 = icmp eq %C* %vtpm.51, null
	br i1 %vtpm.52, label %abort, label %ok.6

ok.6:
	%vtpm.53 = getelementptr %C, %C* %vtpm.51, i32 0, i32 0
	%vtpm.54 = load %_C_vtable*, %_C_vtable** %vtpm.53
	%vtpm.55 = getelementptr %_C_vtable, %_C_vtable* %vtpm.54, i32 0, i32 7
	%vtpm.56 = load i32 (%C*) *, i32 (%C*) ** %vtpm.55
	%vtpm.57 = call i32(%C* )%vtpm.56( %C* %vtpm.51 )
	%vtpm.58 = load %Main*, %Main** %vtpm.0
	%vtpm.59 = icmp eq %Main* %vtpm.58, null
	br i1 %vtpm.59, label %abort, label %ok.7

ok.7:
	%vtpm.60 = getelementptr %Main, %Main* %vtpm.58, i32 0, i32 0
	%vtpm.61 = load %_Main_vtable*, %_Main_vtable** %vtpm.60
	%vtpm.62 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.61, i32 0, i32 8
	%vtpm.63 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.62
	%vtpm.64 = call %Main*(%Main*, i32 )%vtpm.63( %Main* %vtpm.58, i32 %vtpm.57 )
	%vtpm.65 = load %Main*, %Main** %vtpm.0
	%vtpm.66 = getelementptr %Main, %Main* %vtpm.65, i32 0, i32 5
	%vtpm.67 = load %C*, %C** %vtpm.66
	%vtpm.68 = icmp eq %C* %vtpm.67, null
	br i1 %vtpm.68, label %abort, label %ok.8

ok.8:
	%vtpm.69 = getelementptr %_C_vtable, %_C_vtable* @_C_vtable_prototype, i32 0, i32 7
	%vtpm.70 = load i32 (%C*) *, i32 (%C*) ** %vtpm.69
	%vtpm.71 = call i32(%C* )%vtpm.70( %C* %vtpm.67 )
	%vtpm.72 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.72, i32 %vtpm.71 )
	%vtpm.74 = load %Main*, %Main** %vtpm.0
	%vtpm.75 = icmp eq %Main* %vtpm.74, null
	br i1 %vtpm.75, label %abort, label %ok.9

ok.9:
	%vtpm.76 = getelementptr %Main, %Main* %vtpm.74, i32 0, i32 0
	%vtpm.77 = load %_Main_vtable*, %_Main_vtable** %vtpm.76
	%vtpm.78 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.77, i32 0, i32 8
	%vtpm.79 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.78
	%vtpm.80 = bitcast %Int* %vtpm.72 to %Int*
	%vtpm.81 = getelementptr %Int, %Int* %vtpm.80, i32 0, i32 1
	%vtpm.82 = load i32, i32* %vtpm.81
	%vtpm.83 = call %Main*(%Main*, i32 )%vtpm.79( %Main* %vtpm.74, i32 %vtpm.82 )
	%vtpm.84 = load %Main*, %Main** %vtpm.0
	%vtpm.85 = getelementptr %Main, %Main* %vtpm.84, i32 0, i32 5
	%vtpm.86 = load %C*, %C** %vtpm.85
	%vtpm.87 = icmp eq %C* %vtpm.86, null
	br i1 %vtpm.87, label %abort, label %ok.10

ok.10:
	%vtpm.88 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 7
	%vtpm.89 = load i32 (%B*) *, i32 (%B*) ** %vtpm.88
	%vtpm.90 = bitcast %C* %vtpm.86 to %B*
	%vtpm.91 = call i32(%B* )%vtpm.89( %B* %vtpm.90 )
	%vtpm.92 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.92, i32 %vtpm.91 )
	%vtpm.94 = load %Main*, %Main** %vtpm.0
	%vtpm.95 = icmp eq %Main* %vtpm.94, null
	br i1 %vtpm.95, label %abort, label %ok.11

ok.11:
	%vtpm.96 = getelementptr %Main, %Main* %vtpm.94, i32 0, i32 0
	%vtpm.97 = load %_Main_vtable*, %_Main_vtable** %vtpm.96
	%vtpm.98 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.97, i32 0, i32 8
	%vtpm.99 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.98
	%vtpm.100 = bitcast %Int* %vtpm.92 to %Int*
	%vtpm.101 = getelementptr %Int, %Int* %vtpm.100, i32 0, i32 1
	%vtpm.102 = load i32, i32* %vtpm.101
	%vtpm.103 = call %Main*(%Main*, i32 )%vtpm.99( %Main* %vtpm.94, i32 %vtpm.102 )
	%vtpm.104 = load %Main*, %Main** %vtpm.0
	%vtpm.105 = getelementptr %Main, %Main* %vtpm.104, i32 0, i32 5
	%vtpm.106 = load %C*, %C** %vtpm.105
	%vtpm.107 = icmp eq %C* %vtpm.106, null
	br i1 %vtpm.107, label %abort, label %ok.12

ok.12:
	%vtpm.108 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 7
	%vtpm.109 = load i32 (%A*) *, i32 (%A*) ** %vtpm.108
	%vtpm.110 = bitcast %C* %vtpm.106 to %A*
	%vtpm.111 = call i32(%A* )%vtpm.109( %A* %vtpm.110 )
	%vtpm.112 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.112, i32 %vtpm.111 )
	%vtpm.114 = load %Main*, %Main** %vtpm.0
	%vtpm.115 = icmp eq %Main* %vtpm.114, null
	br i1 %vtpm.115, label %abort, label %ok.13

ok.13:
	%vtpm.116 = getelementptr %Main, %Main* %vtpm.114, i32 0, i32 0
	%vtpm.117 = load %_Main_vtable*, %_Main_vtable** %vtpm.116
	%vtpm.118 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.117, i32 0, i32 8
	%vtpm.119 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.118
	%vtpm.120 = bitcast %Int* %vtpm.112 to %Int*
	%vtpm.121 = getelementptr %Int, %Int* %vtpm.120, i32 0, i32 1
	%vtpm.122 = load i32, i32* %vtpm.121
	%vtpm.123 = call %Main*(%Main*, i32 )%vtpm.119( %Main* %vtpm.114, i32 %vtpm.122 )
	%vtpm.124 = load %Main*, %Main** %vtpm.0
	%vtpm.125 = getelementptr %Main, %Main* %vtpm.124, i32 0, i32 4
	%vtpm.126 = load %B*, %B** %vtpm.125
	%vtpm.127 = icmp eq %B* %vtpm.126, null
	br i1 %vtpm.127, label %abort, label %ok.14

ok.14:
	%vtpm.128 = getelementptr %B, %B* %vtpm.126, i32 0, i32 0
	%vtpm.129 = load %_B_vtable*, %_B_vtable** %vtpm.128
	%vtpm.130 = getelementptr %_B_vtable, %_B_vtable* %vtpm.129, i32 0, i32 7
	%vtpm.131 = load i32 (%B*) *, i32 (%B*) ** %vtpm.130
	%vtpm.132 = call i32(%B* )%vtpm.131( %B* %vtpm.126 )
	%vtpm.133 = load %Main*, %Main** %vtpm.0
	%vtpm.134 = icmp eq %Main* %vtpm.133, null
	br i1 %vtpm.134, label %abort, label %ok.15

ok.15:
	%vtpm.135 = getelementptr %Main, %Main* %vtpm.133, i32 0, i32 0
	%vtpm.136 = load %_Main_vtable*, %_Main_vtable** %vtpm.135
	%vtpm.137 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.136, i32 0, i32 8
	%vtpm.138 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.137
	%vtpm.139 = call %Main*(%Main*, i32 )%vtpm.138( %Main* %vtpm.133, i32 %vtpm.132 )
	%vtpm.140 = load %Main*, %Main** %vtpm.0
	%vtpm.141 = getelementptr %Main, %Main* %vtpm.140, i32 0, i32 4
	%vtpm.142 = load %B*, %B** %vtpm.141
	%vtpm.143 = icmp eq %B* %vtpm.142, null
	br i1 %vtpm.143, label %abort, label %ok.16

ok.16:
	%vtpm.144 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 7
	%vtpm.145 = load i32 (%B*) *, i32 (%B*) ** %vtpm.144
	%vtpm.146 = call i32(%B* )%vtpm.145( %B* %vtpm.142 )
	%vtpm.147 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.147, i32 %vtpm.146 )
	%vtpm.149 = load %Main*, %Main** %vtpm.0
	%vtpm.150 = icmp eq %Main* %vtpm.149, null
	br i1 %vtpm.150, label %abort, label %ok.17

ok.17:
	%vtpm.151 = getelementptr %Main, %Main* %vtpm.149, i32 0, i32 0
	%vtpm.152 = load %_Main_vtable*, %_Main_vtable** %vtpm.151
	%vtpm.153 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.152, i32 0, i32 8
	%vtpm.154 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.153
	%vtpm.155 = bitcast %Int* %vtpm.147 to %Int*
	%vtpm.156 = getelementptr %Int, %Int* %vtpm.155, i32 0, i32 1
	%vtpm.157 = load i32, i32* %vtpm.156
	%vtpm.158 = call %Main*(%Main*, i32 )%vtpm.154( %Main* %vtpm.149, i32 %vtpm.157 )
	%vtpm.159 = load %Main*, %Main** %vtpm.0
	%vtpm.160 = getelementptr %Main, %Main* %vtpm.159, i32 0, i32 4
	%vtpm.161 = load %B*, %B** %vtpm.160
	%vtpm.162 = icmp eq %B* %vtpm.161, null
	br i1 %vtpm.162, label %abort, label %ok.18

ok.18:
	%vtpm.163 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 7
	%vtpm.164 = load i32 (%A*) *, i32 (%A*) ** %vtpm.163
	%vtpm.165 = bitcast %B* %vtpm.161 to %A*
	%vtpm.166 = call i32(%A* )%vtpm.164( %A* %vtpm.165 )
	%vtpm.167 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.167, i32 %vtpm.166 )
	%vtpm.169 = load %Main*, %Main** %vtpm.0
	%vtpm.170 = icmp eq %Main* %vtpm.169, null
	br i1 %vtpm.170, label %abort, label %ok.19

ok.19:
	%vtpm.171 = getelementptr %Main, %Main* %vtpm.169, i32 0, i32 0
	%vtpm.172 = load %_Main_vtable*, %_Main_vtable** %vtpm.171
	%vtpm.173 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.172, i32 0, i32 8
	%vtpm.174 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.173
	%vtpm.175 = bitcast %Int* %vtpm.167 to %Int*
	%vtpm.176 = getelementptr %Int, %Int* %vtpm.175, i32 0, i32 1
	%vtpm.177 = load i32, i32* %vtpm.176
	%vtpm.178 = call %Main*(%Main*, i32 )%vtpm.174( %Main* %vtpm.169, i32 %vtpm.177 )
	%vtpm.179 = load %Main*, %Main** %vtpm.0
	%vtpm.180 = getelementptr %Main, %Main* %vtpm.179, i32 0, i32 1
	%vtpm.181 = load %A*, %A** %vtpm.180
	%vtpm.182 = icmp eq %A* %vtpm.181, null
	br i1 %vtpm.182, label %abort, label %ok.20

ok.20:
	%vtpm.183 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 7
	%vtpm.184 = load i32 (%A*) *, i32 (%A*) ** %vtpm.183
	%vtpm.185 = call i32(%A* )%vtpm.184( %A* %vtpm.181 )
	%vtpm.186 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.186, i32 %vtpm.185 )
	%vtpm.188 = load %Main*, %Main** %vtpm.0
	%vtpm.189 = icmp eq %Main* %vtpm.188, null
	br i1 %vtpm.189, label %abort, label %ok.21

ok.21:
	%vtpm.190 = getelementptr %Main, %Main* %vtpm.188, i32 0, i32 0
	%vtpm.191 = load %_Main_vtable*, %_Main_vtable** %vtpm.190
	%vtpm.192 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.191, i32 0, i32 8
	%vtpm.193 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.192
	%vtpm.194 = bitcast %Int* %vtpm.186 to %Int*
	%vtpm.195 = getelementptr %Int, %Int* %vtpm.194, i32 0, i32 1
	%vtpm.196 = load i32, i32* %vtpm.195
	%vtpm.197 = call %Main*(%Main*, i32 )%vtpm.193( %Main* %vtpm.188, i32 %vtpm.196 )
	ret %Main* %vtpm.197

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.199 = alloca %Main*
	%vtpm.200 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.201 = load i32, i32* %vtpm.200
	%vtpm.202 = call i8*(i32 ) @malloc( i32 %vtpm.201 )
	%vtpm.203 = bitcast i8* %vtpm.202 to %Main*
	%vtpm.204 = icmp eq %Main* %vtpm.203, null
	br i1 %vtpm.204, label %abort, label %ok.22

ok.22:
	%vtpm.205 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.205
	store %Main* %vtpm.203, %Main** %vtpm.199
	%vtpm.206 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 1
	store %A* null, %A** %vtpm.206
	%vtpm.207 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 2
	store %A* null, %A** %vtpm.207
	%vtpm.208 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 3
	store %A* null, %A** %vtpm.208
	%vtpm.209 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 4
	store %B* null, %B** %vtpm.209
	%vtpm.210 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 5
	store %C* null, %C** %vtpm.210
	%vtpm.211 = call %A* @A_new(  )
	%vtpm.212 = icmp eq %A* %vtpm.211, null
	br i1 %vtpm.212, label %abort, label %ok.23

ok.23:
	%vtpm.213 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 1
	store %A* %vtpm.211, %A** %vtpm.213
	%vtpm.214 = call %B* @B_new(  )
	%vtpm.215 = icmp eq %B* %vtpm.214, null
	br i1 %vtpm.215, label %abort, label %ok.24

ok.24:
	%vtpm.216 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 2
	%vtpm.217 = bitcast %B* %vtpm.214 to %A*
	store %A* %vtpm.217, %A** %vtpm.216
	%vtpm.218 = call %C* @C_new(  )
	%vtpm.219 = icmp eq %C* %vtpm.218, null
	br i1 %vtpm.219, label %abort, label %ok.25

ok.25:
	%vtpm.220 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 3
	%vtpm.221 = bitcast %C* %vtpm.218 to %A*
	store %A* %vtpm.221, %A** %vtpm.220
	%vtpm.222 = call %B* @B_new(  )
	%vtpm.223 = icmp eq %B* %vtpm.222, null
	br i1 %vtpm.223, label %abort, label %ok.26

ok.26:
	%vtpm.224 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 4
	store %B* %vtpm.222, %B** %vtpm.224
	%vtpm.225 = call %C* @C_new(  )
	%vtpm.226 = icmp eq %C* %vtpm.225, null
	br i1 %vtpm.226, label %abort, label %ok.27

ok.27:
	%vtpm.227 = getelementptr %Main, %Main* %vtpm.203, i32 0, i32 5
	store %C* %vtpm.225, %C** %vtpm.227
	ret %Main* %vtpm.203

abort:
	call void @abort(  )
	unreachable
}

define i32 @A.f(%A* %self) {

entry:
	%vtpm.229 = alloca %A*
	store %A* %self, %A** %vtpm.229
	ret i32 5

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.231 = alloca %A*
	%vtpm.232 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.233 = load i32, i32* %vtpm.232
	%vtpm.234 = call i8*(i32 ) @malloc( i32 %vtpm.233 )
	%vtpm.235 = bitcast i8* %vtpm.234 to %A*
	%vtpm.236 = icmp eq %A* %vtpm.235, null
	br i1 %vtpm.236, label %abort, label %ok.0

ok.0:
	%vtpm.237 = getelementptr %A, %A* %vtpm.235, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.237
	store %A* %vtpm.235, %A** %vtpm.231
	ret %A* %vtpm.235

abort:
	call void @abort(  )
	unreachable
}

define %B* @B_new() {

entry:
	%vtpm.239 = alloca %B*
	%vtpm.240 = getelementptr %_B_vtable, %_B_vtable* @_B_vtable_prototype, i32 0, i32 1
	%vtpm.241 = load i32, i32* %vtpm.240
	%vtpm.242 = call i8*(i32 ) @malloc( i32 %vtpm.241 )
	%vtpm.243 = bitcast i8* %vtpm.242 to %B*
	%vtpm.244 = icmp eq %B* %vtpm.243, null
	br i1 %vtpm.244, label %abort, label %ok.0

ok.0:
	%vtpm.245 = getelementptr %B, %B* %vtpm.243, i32 0, i32 0
	store %_B_vtable* @_B_vtable_prototype, %_B_vtable** %vtpm.245
	store %B* %vtpm.243, %B** %vtpm.239
	ret %B* %vtpm.243

abort:
	call void @abort(  )
	unreachable
}

define i32 @C.f(%C* %self) {

entry:
	%vtpm.247 = alloca %C*
	store %C* %self, %C** %vtpm.247
	ret i32 6

abort:
	call void @abort(  )
	unreachable
}

define %C* @C_new() {

entry:
	%vtpm.249 = alloca %C*
	%vtpm.250 = getelementptr %_C_vtable, %_C_vtable* @_C_vtable_prototype, i32 0, i32 1
	%vtpm.251 = load i32, i32* %vtpm.250
	%vtpm.252 = call i8*(i32 ) @malloc( i32 %vtpm.251 )
	%vtpm.253 = bitcast i8* %vtpm.252 to %C*
	%vtpm.254 = icmp eq %C* %vtpm.253, null
	br i1 %vtpm.254, label %abort, label %ok.0

ok.0:
	%vtpm.255 = getelementptr %C, %C* %vtpm.253, i32 0, i32 0
	store %_C_vtable* @_C_vtable_prototype, %_C_vtable** %vtpm.255
	store %C* %vtpm.253, %C** %vtpm.249
	ret %C* %vtpm.253

abort:
	call void @abort(  )
	unreachable
}

