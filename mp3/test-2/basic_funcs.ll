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

@str.0 = internal constant [14 x i8] c"<basic class>\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

@str.1 = internal constant [7 x i8] c"Frugel\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @str.1, i32 0, i32 0)
}

@str.2 = internal constant [15 x i8] c"basic_funcs.cl\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @str.2, i32 0, i32 0)
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
	%vtpm.2 = icmp eq %Main* %vtpm.1, null
	br i1 %vtpm.2, label %abort, label %ok.0

ok.0:
	%vtpm.3 = getelementptr %Main, %Main* %vtpm.1, i32 0, i32 0
	%vtpm.4 = load %_Main_vtable*, %_Main_vtable** %vtpm.3
	%vtpm.5 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.4, i32 0, i32 5
	%vtpm.6 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.5
	%vtpm.7 = call %String*(%Main* )%vtpm.6( %Main* %vtpm.1 )
	%vtpm.8 = load %Main*, %Main** %vtpm.0
	%vtpm.9 = icmp eq %Main* %vtpm.8, null
	br i1 %vtpm.9, label %abort, label %ok.1

ok.1:
	%vtpm.10 = getelementptr %Main, %Main* %vtpm.8, i32 0, i32 0
	%vtpm.11 = load %_Main_vtable*, %_Main_vtable** %vtpm.10
	%vtpm.12 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.11, i32 0, i32 7
	%vtpm.13 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.12
	%vtpm.14 = call %Main*(%Main*, %String* )%vtpm.13( %Main* %vtpm.8, %String* %vtpm.7 )
	%vtpm.15 = load %Main*, %Main** %vtpm.0
	%vtpm.16 = icmp eq %Main* %vtpm.15, null
	br i1 %vtpm.16, label %abort, label %ok.2

ok.2:
	%vtpm.17 = getelementptr %Main, %Main* %vtpm.15, i32 0, i32 0
	%vtpm.18 = load %_Main_vtable*, %_Main_vtable** %vtpm.17
	%vtpm.19 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.18, i32 0, i32 8
	%vtpm.20 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.19
	%vtpm.21 = call %Main*(%Main*, i32 )%vtpm.20( %Main* %vtpm.15, i32 879 )
	%vtpm.22 = load %Main*, %Main** %vtpm.0
	%vtpm.23 = icmp eq %Main* %vtpm.22, null
	br i1 %vtpm.23, label %abort, label %ok.3

ok.3:
	%vtpm.24 = getelementptr %Main, %Main* %vtpm.22, i32 0, i32 0
	%vtpm.25 = load %_Main_vtable*, %_Main_vtable** %vtpm.24
	%vtpm.26 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.25, i32 0, i32 5
	%vtpm.27 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.26
	%vtpm.28 = call %String*(%Main* )%vtpm.27( %Main* %vtpm.22 )
	%vtpm.29 = icmp eq %String* %vtpm.28, null
	br i1 %vtpm.29, label %abort, label %ok.4

ok.4:
	%vtpm.30 = getelementptr %String, %String* %vtpm.28, i32 0, i32 0
	%vtpm.31 = load %_String_vtable*, %_String_vtable** %vtpm.30
	%vtpm.32 = getelementptr %_String_vtable, %_String_vtable* %vtpm.31, i32 0, i32 8
	%vtpm.33 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.32
	%vtpm.34 = call %String*(%String*, %String* )%vtpm.33( %String* %vtpm.28, %String* @String.1 )
	%vtpm.35 = load %Main*, %Main** %vtpm.0
	%vtpm.36 = icmp eq %Main* %vtpm.35, null
	br i1 %vtpm.36, label %abort, label %ok.5

ok.5:
	%vtpm.37 = getelementptr %Main, %Main* %vtpm.35, i32 0, i32 0
	%vtpm.38 = load %_Main_vtable*, %_Main_vtable** %vtpm.37
	%vtpm.39 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.38, i32 0, i32 7
	%vtpm.40 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.39
	%vtpm.41 = call %Main*(%Main*, %String* )%vtpm.40( %Main* %vtpm.35, %String* %vtpm.34 )
	%vtpm.42 = load %Main*, %Main** %vtpm.0
	%vtpm.43 = icmp eq %Main* %vtpm.42, null
	br i1 %vtpm.43, label %abort, label %ok.6

ok.6:
	%vtpm.44 = getelementptr %Main, %Main* %vtpm.42, i32 0, i32 0
	%vtpm.45 = load %_Main_vtable*, %_Main_vtable** %vtpm.44
	%vtpm.46 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.45, i32 0, i32 5
	%vtpm.47 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.46
	%vtpm.48 = call %String*(%Main* )%vtpm.47( %Main* %vtpm.42 )
	%vtpm.49 = icmp eq %String* %vtpm.48, null
	br i1 %vtpm.49, label %abort, label %ok.7

ok.7:
	%vtpm.50 = getelementptr %String, %String* %vtpm.48, i32 0, i32 0
	%vtpm.51 = load %_String_vtable*, %_String_vtable** %vtpm.50
	%vtpm.52 = getelementptr %_String_vtable, %_String_vtable* %vtpm.51, i32 0, i32 7
	%vtpm.53 = load i32 (%String*) *, i32 (%String*) ** %vtpm.52
	%vtpm.54 = call i32(%String* )%vtpm.53( %String* %vtpm.48 )
	%vtpm.55 = load %Main*, %Main** %vtpm.0
	%vtpm.56 = icmp eq %Main* %vtpm.55, null
	br i1 %vtpm.56, label %abort, label %ok.8

ok.8:
	%vtpm.57 = getelementptr %Main, %Main* %vtpm.55, i32 0, i32 0
	%vtpm.58 = load %_Main_vtable*, %_Main_vtable** %vtpm.57
	%vtpm.59 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.58, i32 0, i32 8
	%vtpm.60 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.59
	%vtpm.61 = call %Main*(%Main*, i32 )%vtpm.60( %Main* %vtpm.55, i32 %vtpm.54 )
	%vtpm.62 = load %Main*, %Main** %vtpm.0
	%vtpm.63 = icmp eq %Main* %vtpm.62, null
	br i1 %vtpm.63, label %abort, label %ok.9

ok.9:
	%vtpm.64 = getelementptr %Main, %Main* %vtpm.62, i32 0, i32 0
	%vtpm.65 = load %_Main_vtable*, %_Main_vtable** %vtpm.64
	%vtpm.66 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.65, i32 0, i32 5
	%vtpm.67 = load %String* (%Main*) *, %String* (%Main*) ** %vtpm.66
	%vtpm.68 = call %String*(%Main* )%vtpm.67( %Main* %vtpm.62 )
	%vtpm.69 = icmp eq %String* %vtpm.68, null
	br i1 %vtpm.69, label %abort, label %ok.10

ok.10:
	%vtpm.70 = getelementptr %String, %String* %vtpm.68, i32 0, i32 0
	%vtpm.71 = load %_String_vtable*, %_String_vtable** %vtpm.70
	%vtpm.72 = getelementptr %_String_vtable, %_String_vtable* %vtpm.71, i32 0, i32 9
	%vtpm.73 = load %String* (%String*,i32,i32) *, %String* (%String*,i32,i32) ** %vtpm.72
	%vtpm.74 = call %String*(%String*, i32, i32 )%vtpm.73( %String* %vtpm.68, i32 2, i32 2 )
	%vtpm.75 = load %Main*, %Main** %vtpm.0
	%vtpm.76 = icmp eq %Main* %vtpm.75, null
	br i1 %vtpm.76, label %abort, label %ok.11

ok.11:
	%vtpm.77 = getelementptr %Main, %Main* %vtpm.75, i32 0, i32 0
	%vtpm.78 = load %_Main_vtable*, %_Main_vtable** %vtpm.77
	%vtpm.79 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.78, i32 0, i32 7
	%vtpm.80 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.79
	%vtpm.81 = call %Main*(%Main*, %String* )%vtpm.80( %Main* %vtpm.75, %String* %vtpm.74 )
	%vtpm.82 = load %Main*, %Main** %vtpm.0
	%vtpm.83 = bitcast %Main* %vtpm.82 to %Object*
	ret %Object* %vtpm.83

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.85 = alloca %Main*
	%vtpm.86 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.87 = load i32, i32* %vtpm.86
	%vtpm.88 = call i8*(i32 ) @malloc( i32 %vtpm.87 )
	%vtpm.89 = bitcast i8* %vtpm.88 to %Main*
	%vtpm.90 = icmp eq %Main* %vtpm.89, null
	br i1 %vtpm.90, label %abort, label %ok.12

ok.12:
	%vtpm.91 = getelementptr %Main, %Main* %vtpm.89, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.91
	store %Main* %vtpm.89, %Main** %vtpm.85
	ret %Main* %vtpm.89

abort:
	call void @abort(  )
	unreachable
}

