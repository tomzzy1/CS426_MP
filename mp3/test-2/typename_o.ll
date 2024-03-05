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
	%String* (%Main*) *,
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
	%String* (%Main*) * @Main.func,
	%Object* (%Main*) * @Main.main
}

@str.Base = internal constant [5 x i8] c"Base\00"
%Base = type {
	%_Base_vtable*
}

%_Base_vtable = type {
	i32,
	i32,
	i8*,
	%Base* () *,
	%Object* (%Base*) *,
	%String* (%Base*) *,
	%Base* (%Base*) *,
	%String* (%Base*,%Object*,%String*) *,
	%String* (%Base*,%String*) *
}

@_Base_vtable_prototype = constant %_Base_vtable {
	i32 6,
	i32 ptrtoint (%Base* getelementptr (%Base, %Base* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Base, i32 0, i32 0),
	%Base* () * @Base_new,
	%Object* (%Base*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Base*) *),
	%String* (%Base*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Base*) *),
	%Base* (%Base*) * bitcast (%Object* (%Object*) * @Object_copy to %Base* (%Base*) *),
	%String* (%Base*,%Object*,%String*) * @Base.identify,
	%String* (%Base*,%String*) * @Base.test
}

@str.Derived = internal constant [8 x i8] c"Derived\00"
%Derived = type {
	%_Derived_vtable*
}

%_Derived_vtable = type {
	i32,
	i32,
	i8*,
	%Derived* () *,
	%Object* (%Derived*) *,
	%String* (%Derived*) *,
	%Derived* (%Derived*) *,
	%String* (%Derived*,%Object*,%String*) *,
	%String* (%Derived*,%String*) *
}

@_Derived_vtable_prototype = constant %_Derived_vtable {
	i32 7,
	i32 ptrtoint (%Derived* getelementptr (%Derived, %Derived* null, i32 1) to i32),
	i8* getelementptr ([8 x i8], [8 x i8]* @str.Derived, i32 0, i32 0),
	%Derived* () * @Derived_new,
	%Object* (%Derived*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Derived*) *),
	%String* (%Derived*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Derived*) *),
	%Derived* (%Derived*) * bitcast (%Object* (%Object*) * @Object_copy to %Derived* (%Derived*) *),
	%String* (%Derived*,%Object*,%String*) * bitcast (%String* (%Base*,%Object*,%String*) * @Base.identify to %String* (%Derived*,%Object*,%String*) *),
	%String* (%Derived*,%String*) * bitcast (%String* (%Base*,%String*) * @Base.test to %String* (%Derived*,%String*) *)
}

@str.0 = internal constant [14 x i8] c"<basic class>\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

@str.1 = internal constant [1 x i8] c"\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([1 x i8], [1 x i8]* @str.1, i32 0, i32 0)
}

@str.2 = internal constant [2 x i8] c"\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([2 x i8], [2 x i8]* @str.2, i32 0, i32 0)
}

@str.3 = internal constant [14 x i8] c"typename_o.cl\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.3, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call %Object*(%Main* ) @Main.main( %Main* %main.obj )
	ret i32 0
}

define %String* @Main.func(%Main* %self) {

entry:
	%vtpm.0 = alloca %Main*
	store %Main* %self, %Main** %vtpm.0
	%vtpm.1 = call %Derived* @Derived_new(  )
	%vtpm.2 = icmp eq %Derived* %vtpm.1, null
	br i1 %vtpm.2, label %abort, label %ok.0

ok.0:
	%vtpm.3 = icmp eq %Derived* %vtpm.1, null
	br i1 %vtpm.3, label %abort, label %ok.1

ok.1:
	%vtpm.4 = getelementptr %Derived, %Derived* %vtpm.1, i32 0, i32 0
	%vtpm.5 = load %_Derived_vtable*, %_Derived_vtable** %vtpm.4
	%vtpm.6 = getelementptr %_Derived_vtable, %_Derived_vtable* %vtpm.5, i32 0, i32 8
	%vtpm.7 = load %String* (%Derived*,%String*) *, %String* (%Derived*,%String*) ** %vtpm.6
	%vtpm.8 = call %String*(%Derived*, %String* )%vtpm.7( %Derived* %vtpm.1, %String* @String.1 )
	ret %String* %vtpm.8

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Main.main(%Main* %self) {

entry:
	%vtpm.10 = alloca %Main*
	store %Main* %self, %Main** %vtpm.10
	%vtpm.11 = load %Main*, %Main** %vtpm.10
	%vtpm.12 = icmp eq %Main* %vtpm.11, null
	br i1 %vtpm.12, label %abort, label %ok.2

ok.2:
	%vtpm.13 = getelementptr %Main, %Main* %vtpm.11, i32 0, i32 0
	%vtpm.14 = load %_Main_vtable*, %_Main_vtable** %vtpm.13
	%vtpm.15 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.14, i32 0, i32 11
	%vtpm.16 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.15
	%vtpm.17 = call %String*(%Main* )%vtpm.16( %Main* %vtpm.11 )
	%vtpm.18 = load %Main*, %Main** %vtpm.10
	%vtpm.19 = icmp eq %Main* %vtpm.18, null
	br i1 %vtpm.19, label %abort, label %ok.3

ok.3:
	%vtpm.20 = getelementptr %Main, %Main* %vtpm.18, i32 0, i32 0
	%vtpm.21 = load %_Main_vtable*, %_Main_vtable** %vtpm.20
	%vtpm.22 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.21, i32 0, i32 7
	%vtpm.23 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.22
	%vtpm.24 = call %Main*(%Main*, %String* )%vtpm.23( %Main* %vtpm.18, %String* %vtpm.17 )
	%vtpm.25 = load %Main*, %Main** %vtpm.10
	%vtpm.26 = bitcast %Main* %vtpm.25 to %Object*
	ret %Object* %vtpm.26

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
	br i1 %vtpm.33, label %abort, label %ok.4

ok.4:
	%vtpm.34 = getelementptr %Main, %Main* %vtpm.32, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.34
	store %Main* %vtpm.32, %Main** %vtpm.28
	ret %Main* %vtpm.32

abort:
	call void @abort(  )
	unreachable
}

define %String* @Base.identify(%Base* %self, %Object* %thing, %String* %s) {

entry:
	%vtpm.36 = alloca %Base*
	%vtpm.37 = alloca %Object*
	%vtpm.38 = alloca %String*
	store %Base* %self, %Base** %vtpm.36
	store %Object* %thing, %Object** %vtpm.37
	store %String* %s, %String** %vtpm.38
	%vtpm.39 = load %Object*, %Object** %vtpm.37
	%vtpm.40 = icmp eq %Object* %vtpm.39, null
	br i1 %vtpm.40, label %abort, label %ok.0

ok.0:
	%vtpm.41 = getelementptr %Object, %Object* %vtpm.39, i32 0, i32 0
	%vtpm.42 = load %_Object_vtable*, %_Object_vtable** %vtpm.41
	%vtpm.43 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.42, i32 0, i32 5
	%vtpm.44 = load %String* (%Object*) *, %String* (%Object*) ** %vtpm.43
	%vtpm.45 = call %String*(%Object* )%vtpm.44( %Object* %vtpm.39 )
	%vtpm.46 = load %String*, %String** %vtpm.38
	%vtpm.47 = icmp eq %String* %vtpm.46, null
	br i1 %vtpm.47, label %abort, label %ok.1

ok.1:
	%vtpm.48 = getelementptr %String, %String* %vtpm.46, i32 0, i32 0
	%vtpm.49 = load %_String_vtable*, %_String_vtable** %vtpm.48
	%vtpm.50 = getelementptr %_String_vtable, %_String_vtable* %vtpm.49, i32 0, i32 8
	%vtpm.51 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.50
	%vtpm.52 = call %String*(%String*, %String* )%vtpm.51( %String* %vtpm.46, %String* %vtpm.45 )
	%vtpm.53 = icmp eq %String* %vtpm.52, null
	br i1 %vtpm.53, label %abort, label %ok.2

ok.2:
	%vtpm.54 = getelementptr %String, %String* %vtpm.52, i32 0, i32 0
	%vtpm.55 = load %_String_vtable*, %_String_vtable** %vtpm.54
	%vtpm.56 = getelementptr %_String_vtable, %_String_vtable* %vtpm.55, i32 0, i32 8
	%vtpm.57 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.56
	%vtpm.58 = call %String*(%String*, %String* )%vtpm.57( %String* %vtpm.52, %String* @String.2 )
	ret %String* %vtpm.58

abort:
	call void @abort(  )
	unreachable
}

define %String* @Base.test(%Base* %self, %String* %s) {

entry:
	%vtpm.60 = alloca %Base*
	%vtpm.61 = alloca %String*
	%vtpm.62 = alloca %Base*
	store %Base* %self, %Base** %vtpm.60
	store %String* %s, %String** %vtpm.61
	%vtpm.63 = call %Main* @Main_new(  )
	%vtpm.64 = icmp eq %Main* %vtpm.63, null
	br i1 %vtpm.64, label %abort, label %ok.3

ok.3:
	%vtpm.65 = load %String*, %String** %vtpm.61
	%vtpm.66 = load %Base*, %Base** %vtpm.60
	%vtpm.67 = icmp eq %Base* %vtpm.66, null
	br i1 %vtpm.67, label %abort, label %ok.4

ok.4:
	%vtpm.68 = getelementptr %Base, %Base* %vtpm.66, i32 0, i32 0
	%vtpm.69 = load %_Base_vtable*, %_Base_vtable** %vtpm.68
	%vtpm.70 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.69, i32 0, i32 7
	%vtpm.71 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.70
	%vtpm.72 = bitcast %Main* %vtpm.63 to %Object*
	%vtpm.73 = call %String*(%Base*, %Object*, %String* )%vtpm.71( %Base* %vtpm.66, %Object* %vtpm.72, %String* %vtpm.65 )
	%vtpm.74 = call %Derived* @Derived_new(  )
	%vtpm.75 = icmp eq %Derived* %vtpm.74, null
	br i1 %vtpm.75, label %abort, label %ok.5

ok.5:
	%vtpm.76 = load %String*, %String** %vtpm.61
	%vtpm.77 = load %Base*, %Base** %vtpm.60
	%vtpm.78 = icmp eq %Base* %vtpm.77, null
	br i1 %vtpm.78, label %abort, label %ok.6

ok.6:
	%vtpm.79 = getelementptr %Base, %Base* %vtpm.77, i32 0, i32 0
	%vtpm.80 = load %_Base_vtable*, %_Base_vtable** %vtpm.79
	%vtpm.81 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.80, i32 0, i32 7
	%vtpm.82 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.81
	%vtpm.83 = bitcast %Derived* %vtpm.74 to %Object*
	%vtpm.84 = call %String*(%Base*, %Object*, %String* )%vtpm.82( %Base* %vtpm.77, %Object* %vtpm.83, %String* %vtpm.76 )
	%vtpm.85 = call %Base* @Base_new(  )
	%vtpm.86 = icmp eq %Base* %vtpm.85, null
	br i1 %vtpm.86, label %abort, label %ok.7

ok.7:
	%vtpm.87 = load %String*, %String** %vtpm.61
	%vtpm.88 = load %Base*, %Base** %vtpm.60
	%vtpm.89 = icmp eq %Base* %vtpm.88, null
	br i1 %vtpm.89, label %abort, label %ok.8

ok.8:
	%vtpm.90 = getelementptr %Base, %Base* %vtpm.88, i32 0, i32 0
	%vtpm.91 = load %_Base_vtable*, %_Base_vtable** %vtpm.90
	%vtpm.92 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.91, i32 0, i32 7
	%vtpm.93 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.92
	%vtpm.94 = bitcast %Base* %vtpm.85 to %Object*
	%vtpm.95 = call %String*(%Base*, %Object*, %String* )%vtpm.93( %Base* %vtpm.88, %Object* %vtpm.94, %String* %vtpm.87 )
	%vtpm.96 = load %String*, %String** %vtpm.61
	%vtpm.97 = icmp eq %String* %vtpm.96, null
	br i1 %vtpm.97, label %abort, label %ok.9

ok.9:
	%vtpm.98 = getelementptr %String, %String* %vtpm.96, i32 0, i32 0
	%vtpm.99 = load %_String_vtable*, %_String_vtable** %vtpm.98
	%vtpm.100 = getelementptr %_String_vtable, %_String_vtable* %vtpm.99, i32 0, i32 8
	%vtpm.101 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.100
	%vtpm.102 = call %String*(%String*, %String* )%vtpm.101( %String* %vtpm.96, %String* %vtpm.95 )
	%vtpm.103 = icmp eq %String* %vtpm.102, null
	br i1 %vtpm.103, label %abort, label %ok.10

ok.10:
	%vtpm.104 = getelementptr %String, %String* %vtpm.102, i32 0, i32 0
	%vtpm.105 = load %_String_vtable*, %_String_vtable** %vtpm.104
	%vtpm.106 = getelementptr %_String_vtable, %_String_vtable* %vtpm.105, i32 0, i32 8
	%vtpm.107 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.106
	%vtpm.108 = call %String*(%String*, %String* )%vtpm.107( %String* %vtpm.102, %String* %vtpm.84 )
	%vtpm.109 = icmp eq %String* %vtpm.108, null
	br i1 %vtpm.109, label %abort, label %ok.11

ok.11:
	%vtpm.110 = getelementptr %String, %String* %vtpm.108, i32 0, i32 0
	%vtpm.111 = load %_String_vtable*, %_String_vtable** %vtpm.110
	%vtpm.112 = getelementptr %_String_vtable, %_String_vtable* %vtpm.111, i32 0, i32 8
	%vtpm.113 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.112
	%vtpm.114 = call %String*(%String*, %String* )%vtpm.113( %String* %vtpm.108, %String* %vtpm.73 )
	store %String* %vtpm.114, %String** %vtpm.61
	%vtpm.115 = call %Derived* @Derived_new(  )
	%vtpm.116 = icmp eq %Derived* %vtpm.115, null
	br i1 %vtpm.116, label %abort, label %ok.12

ok.12:
	%vtpm.117 = bitcast %Derived* %vtpm.115 to %Base*
	store %Base* %vtpm.117, %Base** %vtpm.62
	%vtpm.118 = load %Base*, %Base** %vtpm.62
	%vtpm.119 = load %String*, %String** %vtpm.61
	%vtpm.120 = load %Base*, %Base** %vtpm.60
	%vtpm.121 = icmp eq %Base* %vtpm.120, null
	br i1 %vtpm.121, label %abort, label %ok.13

ok.13:
	%vtpm.122 = getelementptr %Base, %Base* %vtpm.120, i32 0, i32 0
	%vtpm.123 = load %_Base_vtable*, %_Base_vtable** %vtpm.122
	%vtpm.124 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.123, i32 0, i32 7
	%vtpm.125 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.124
	%vtpm.126 = bitcast %Base* %vtpm.118 to %Object*
	%vtpm.127 = call %String*(%Base*, %Object*, %String* )%vtpm.125( %Base* %vtpm.120, %Object* %vtpm.126, %String* %vtpm.119 )
	store %String* %vtpm.127, %String** %vtpm.61
	%vtpm.128 = load %Base*, %Base** %vtpm.60
	%vtpm.129 = load %String*, %String** %vtpm.61
	%vtpm.130 = load %Base*, %Base** %vtpm.60
	%vtpm.131 = icmp eq %Base* %vtpm.130, null
	br i1 %vtpm.131, label %abort, label %ok.14

ok.14:
	%vtpm.132 = getelementptr %Base, %Base* %vtpm.130, i32 0, i32 0
	%vtpm.133 = load %_Base_vtable*, %_Base_vtable** %vtpm.132
	%vtpm.134 = getelementptr %_Base_vtable, %_Base_vtable* %vtpm.133, i32 0, i32 7
	%vtpm.135 = load %String* (%Base*,%Object*,%String*) *, %String* (%Base*,%Object*,%String*) ** %vtpm.134
	%vtpm.136 = bitcast %Base* %vtpm.128 to %Object*
	%vtpm.137 = call %String*(%Base*, %Object*, %String* )%vtpm.135( %Base* %vtpm.130, %Object* %vtpm.136, %String* %vtpm.129 )
	ret %String* %vtpm.137

abort:
	call void @abort(  )
	unreachable
}

define %Base* @Base_new() {

entry:
	%vtpm.139 = alloca %Base*
	%vtpm.140 = getelementptr %_Base_vtable, %_Base_vtable* @_Base_vtable_prototype, i32 0, i32 1
	%vtpm.141 = load i32, i32* %vtpm.140
	%vtpm.142 = call i8*(i32 ) @malloc( i32 %vtpm.141 )
	%vtpm.143 = bitcast i8* %vtpm.142 to %Base*
	%vtpm.144 = icmp eq %Base* %vtpm.143, null
	br i1 %vtpm.144, label %abort, label %ok.15

ok.15:
	%vtpm.145 = getelementptr %Base, %Base* %vtpm.143, i32 0, i32 0
	store %_Base_vtable* @_Base_vtable_prototype, %_Base_vtable** %vtpm.145
	store %Base* %vtpm.143, %Base** %vtpm.139
	ret %Base* %vtpm.143

abort:
	call void @abort(  )
	unreachable
}

define %Derived* @Derived_new() {

entry:
	%vtpm.147 = alloca %Derived*
	%vtpm.148 = getelementptr %_Derived_vtable, %_Derived_vtable* @_Derived_vtable_prototype, i32 0, i32 1
	%vtpm.149 = load i32, i32* %vtpm.148
	%vtpm.150 = call i8*(i32 ) @malloc( i32 %vtpm.149 )
	%vtpm.151 = bitcast i8* %vtpm.150 to %Derived*
	%vtpm.152 = icmp eq %Derived* %vtpm.151, null
	br i1 %vtpm.152, label %abort, label %ok.0

ok.0:
	%vtpm.153 = getelementptr %Derived, %Derived* %vtpm.151, i32 0, i32 0
	store %_Derived_vtable* @_Derived_vtable_prototype, %_Derived_vtable** %vtpm.153
	store %Derived* %vtpm.151, %Derived** %vtpm.147
	ret %Derived* %vtpm.151

abort:
	call void @abort(  )
	unreachable
}

