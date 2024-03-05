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
	i32,
	i1,
	%String*,
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

@str.AA = internal constant [3 x i8] c"AA\00"
%AA = type {
	%_AA_vtable*,
	i1,
	i32
}

%_AA_vtable = type {
	i32,
	i32,
	i8*,
	%AA* () *,
	%Object* (%AA*) *,
	%String* (%AA*) *,
	%AA* (%AA*) *,
	i32 (%AA*,i32) *,
	i32 (%AA*) *
}

@_AA_vtable_prototype = constant %_AA_vtable {
	i32 7,
	i32 ptrtoint (%AA* getelementptr (%AA, %AA* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.AA, i32 0, i32 0),
	%AA* () * @AA_new,
	%Object* (%AA*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%AA*) *),
	%String* (%AA*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%AA*) *),
	%AA* (%AA*) * bitcast (%Object* (%Object*) * @Object_copy to %AA* (%AA*) *),
	i32 (%AA*,i32) * @AA.set,
	i32 (%AA*) * @AA.get
}

@str.0 = internal constant [14 x i8] c"<basic class>\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
}

@str.1 = internal constant [8 x i8] c"Error2\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.1, i32 0, i32 0)
}

@str.2 = internal constant [8 x i8] c"Error1\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.2, i32 0, i32 0)
}

@str.3 = internal constant [11 x i8] c"copy_o3.cl\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([11 x i8], [11 x i8]* @str.3, i32 0, i32 0)
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
	%vtpm.1 = alloca %A*
	%vtpm.2 = alloca %A*
	%tmp.0 = alloca %Int*
	%vtpm.3 = alloca %AA*
	%vtpm.4 = alloca %Object*
	%tmp.1 = alloca %Main*
	%vtpm.5 = alloca %AA*
	%vtpm.6 = alloca %Object*
	store %Main* %self, %Main** %vtpm.0
	store %A* null, %A** %vtpm.1
	store %A* null, %A** %vtpm.2
	%vtpm.7 = call %AA* @AA_new(  )
	%vtpm.8 = icmp eq %AA* %vtpm.7, null
	br i1 %vtpm.8, label %abort, label %ok.0

ok.0:
	%vtpm.9 = bitcast %AA* %vtpm.7 to %A*
	store %A* %vtpm.9, %A** %vtpm.1
	%vtpm.10 = load %A*, %A** %vtpm.1
	%tmp.2 = icmp eq %A* %vtpm.10, null
	br i1 %tmp.2, label %abort, label %ok.1

ok.1:
	%vtpm.11 = getelementptr %A, %A* %vtpm.10, i32 0, i32 0
	%vtpm.12 = load %_A_vtable*, %_A_vtable** %vtpm.11
	%vtpm.13 = getelementptr %_A_vtable, %_A_vtable* %vtpm.12, i32 0, i32 0
	%vtpm.14 = load i32, i32* %vtpm.13
	br label %case.hdr.0

case.hdr.0:
	br label %case.7.0

case.7.0:
	%vtpm.15 = icmp slt i32 %vtpm.14, 7
	br i1 %vtpm.15, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.16 = icmp sgt i32 %vtpm.14, 7
	br i1 %vtpm.16, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.17 = bitcast %A* %vtpm.10 to %AA*
	store %AA* %vtpm.17, %AA** %vtpm.3
	%vtpm.18 = load %AA*, %AA** %vtpm.3
	%vtpm.19 = icmp eq %AA* %vtpm.18, null
	br i1 %vtpm.19, label %abort, label %ok.2

ok.2:
	%vtpm.20 = getelementptr %AA, %AA* %vtpm.18, i32 0, i32 0
	%vtpm.21 = load %_AA_vtable*, %_AA_vtable** %vtpm.20
	%vtpm.22 = getelementptr %_AA_vtable, %_AA_vtable* %vtpm.21, i32 0, i32 7
	%vtpm.23 = load i32 (%AA*,i32) *, i32 (%AA*,i32) ** %vtpm.22
	%vtpm.24 = call i32(%AA*, i32 )%vtpm.23( %AA* %vtpm.18, i32 42 )
	%vtpm.25 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.25, i32 %vtpm.24 )
	store %Int* %vtpm.25, %Int** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.0.0

case.0.0:
	%vtpm.27 = icmp slt i32 %vtpm.14, 0
	br i1 %vtpm.27, label %br_exit.0.0, label %src_gte_br.0.0

src_gte_br.0.0:
	%vtpm.28 = icmp sgt i32 %vtpm.14, 7
	br i1 %vtpm.28, label %br_exit.0.0, label %src_lte_mc.0.0

src_lte_mc.0.0:
	%vtpm.29 = bitcast %A* %vtpm.10 to %Object*
	store %Object* %vtpm.29, %Object** %vtpm.4
	%vtpm.30 = load %Main*, %Main** %vtpm.0
	%vtpm.31 = icmp eq %Main* %vtpm.30, null
	br i1 %vtpm.31, label %abort, label %ok.3

ok.3:
	%vtpm.32 = getelementptr %Main, %Main* %vtpm.30, i32 0, i32 0
	%vtpm.33 = load %_Main_vtable*, %_Main_vtable** %vtpm.32
	%vtpm.34 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.33, i32 0, i32 7
	%vtpm.35 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.34
	%vtpm.36 = call %Main*(%Main*, %String* )%vtpm.35( %Main* %vtpm.30, %String* @String.2 )
	%vtpm.37 = bitcast %Main* %vtpm.36 to %Object*
	%vtpm.38 = bitcast %Object* %vtpm.37 to %Int*
	store %Int* %vtpm.38, %Int** %tmp.0
	br label %case.exit.0

br_exit.0.0:
	br label %abort

case.exit.0:
	%tmp.3 = load %Int*, %Int** %tmp.0
	%vtpm.39 = load %A*, %A** %vtpm.1
	%vtpm.40 = icmp eq %A* %vtpm.39, null
	br i1 %vtpm.40, label %abort, label %ok.4

ok.4:
	%vtpm.41 = getelementptr %A, %A* %vtpm.39, i32 0, i32 0
	%vtpm.42 = load %_A_vtable*, %_A_vtable** %vtpm.41
	%vtpm.43 = getelementptr %_A_vtable, %_A_vtable* %vtpm.42, i32 0, i32 6
	%vtpm.44 = load %A* (%A*) *, %A* (%A*) ** %vtpm.43
	%vtpm.45 = call %A*(%A* )%vtpm.44( %A* %vtpm.39 )
	store %A* %vtpm.45, %A** %vtpm.2
	%vtpm.46 = load %A*, %A** %vtpm.2
	%tmp.4 = icmp eq %A* %vtpm.46, null
	br i1 %tmp.4, label %abort, label %ok.5

ok.5:
	%vtpm.47 = getelementptr %A, %A* %vtpm.46, i32 0, i32 0
	%vtpm.48 = load %_A_vtable*, %_A_vtable** %vtpm.47
	%vtpm.49 = getelementptr %_A_vtable, %_A_vtable* %vtpm.48, i32 0, i32 0
	%vtpm.50 = load i32, i32* %vtpm.49
	br label %case.hdr.1

case.hdr.1:
	br label %case.7.1

case.7.1:
	%vtpm.51 = icmp slt i32 %vtpm.50, 7
	br i1 %vtpm.51, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.52 = icmp sgt i32 %vtpm.50, 7
	br i1 %vtpm.52, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%vtpm.53 = bitcast %A* %vtpm.46 to %AA*
	store %AA* %vtpm.53, %AA** %vtpm.5
	%vtpm.54 = load %AA*, %AA** %vtpm.5
	%vtpm.55 = icmp eq %AA* %vtpm.54, null
	br i1 %vtpm.55, label %abort, label %ok.6

ok.6:
	%vtpm.56 = getelementptr %AA, %AA* %vtpm.54, i32 0, i32 0
	%vtpm.57 = load %_AA_vtable*, %_AA_vtable** %vtpm.56
	%vtpm.58 = getelementptr %_AA_vtable, %_AA_vtable* %vtpm.57, i32 0, i32 8
	%vtpm.59 = load i32 (%AA*) *, i32 (%AA*) ** %vtpm.58
	%vtpm.60 = call i32(%AA* )%vtpm.59( %AA* %vtpm.54 )
	%vtpm.61 = load %Main*, %Main** %vtpm.0
	%vtpm.62 = icmp eq %Main* %vtpm.61, null
	br i1 %vtpm.62, label %abort, label %ok.7

ok.7:
	%vtpm.63 = getelementptr %Main, %Main* %vtpm.61, i32 0, i32 0
	%vtpm.64 = load %_Main_vtable*, %_Main_vtable** %vtpm.63
	%vtpm.65 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.64, i32 0, i32 8
	%vtpm.66 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %vtpm.65
	%vtpm.67 = call %Main*(%Main*, i32 )%vtpm.66( %Main* %vtpm.61, i32 %vtpm.60 )
	store %Main* %vtpm.67, %Main** %tmp.1
	br label %case.exit.1

br_exit.7.1:
	br label %case.0.1

case.0.1:
	%vtpm.68 = icmp slt i32 %vtpm.50, 0
	br i1 %vtpm.68, label %br_exit.0.1, label %src_gte_br.0.1

src_gte_br.0.1:
	%vtpm.69 = icmp sgt i32 %vtpm.50, 7
	br i1 %vtpm.69, label %br_exit.0.1, label %src_lte_mc.0.1

src_lte_mc.0.1:
	%vtpm.70 = bitcast %A* %vtpm.46 to %Object*
	store %Object* %vtpm.70, %Object** %vtpm.6
	%vtpm.71 = load %Main*, %Main** %vtpm.0
	%vtpm.72 = icmp eq %Main* %vtpm.71, null
	br i1 %vtpm.72, label %abort, label %ok.8

ok.8:
	%vtpm.73 = getelementptr %Main, %Main* %vtpm.71, i32 0, i32 0
	%vtpm.74 = load %_Main_vtable*, %_Main_vtable** %vtpm.73
	%vtpm.75 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.74, i32 0, i32 7
	%vtpm.76 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %vtpm.75
	%vtpm.77 = call %Main*(%Main*, %String* )%vtpm.76( %Main* %vtpm.71, %String* @String.1 )
	store %Main* %vtpm.77, %Main** %tmp.1
	br label %case.exit.1

br_exit.0.1:
	br label %abort

case.exit.1:
	%tmp.5 = load %Main*, %Main** %tmp.1
	%vtpm.78 = load %Main*, %Main** %vtpm.0
	ret %Main* %vtpm.78

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.80 = alloca %Main*
	%vtpm.81 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.82 = load i32, i32* %vtpm.81
	%vtpm.83 = call i8*(i32 ) @malloc( i32 %vtpm.82 )
	%vtpm.84 = bitcast i8* %vtpm.83 to %Main*
	%vtpm.85 = icmp eq %Main* %vtpm.84, null
	br i1 %vtpm.85, label %abort, label %ok.9

ok.9:
	%vtpm.86 = getelementptr %Main, %Main* %vtpm.84, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.86
	store %Main* %vtpm.84, %Main** %vtpm.80
	ret %Main* %vtpm.84

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.88 = alloca %A*
	%vtpm.89 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.90 = load i32, i32* %vtpm.89
	%vtpm.91 = call i8*(i32 ) @malloc( i32 %vtpm.90 )
	%vtpm.92 = bitcast i8* %vtpm.91 to %A*
	%vtpm.93 = icmp eq %A* %vtpm.92, null
	br i1 %vtpm.93, label %abort, label %ok.0

ok.0:
	%vtpm.94 = getelementptr %A, %A* %vtpm.92, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.94
	store %A* %vtpm.92, %A** %vtpm.88
	%vtpm.95 = getelementptr %A, %A* %vtpm.92, i32 0, i32 1
	store i32 0, i32* %vtpm.95
	%vtpm.96 = getelementptr %A, %A* %vtpm.92, i32 0, i32 2
	store i1 false, i1* %vtpm.96
	%vtpm.97 = getelementptr %A, %A* %vtpm.92, i32 0, i32 3
	store %String* null, %String** %vtpm.97
	%vtpm.98 = getelementptr %A, %A* %vtpm.92, i32 0, i32 4
	store i32 0, i32* %vtpm.98
	ret %A* %vtpm.92

abort:
	call void @abort(  )
	unreachable
}

define i32 @AA.set(%AA* %self, i32 %x) {

entry:
	%vtpm.100 = alloca %AA*
	%vtpm.101 = alloca i32
	store %AA* %self, %AA** %vtpm.100
	store i32 %x, i32* %vtpm.101
	%vtpm.102 = load i32, i32* %vtpm.101
	%vtpm.103 = load %AA*, %AA** %vtpm.100
	%vtpm.104 = getelementptr %AA, %AA* %vtpm.103, i32 0, i32 2
	store i32 %vtpm.102, i32* %vtpm.104
	ret i32 %vtpm.102

abort:
	call void @abort(  )
	unreachable
}

define i32 @AA.get(%AA* %self) {

entry:
	%vtpm.106 = alloca %AA*
	store %AA* %self, %AA** %vtpm.106
	%vtpm.107 = load %AA*, %AA** %vtpm.106
	%vtpm.108 = getelementptr %AA, %AA* %vtpm.107, i32 0, i32 2
	%vtpm.109 = load i32, i32* %vtpm.108
	ret i32 %vtpm.109

abort:
	call void @abort(  )
	unreachable
}

define %AA* @AA_new() {

entry:
	%vtpm.111 = alloca %AA*
	%vtpm.112 = getelementptr %_AA_vtable, %_AA_vtable* @_AA_vtable_prototype, i32 0, i32 1
	%vtpm.113 = load i32, i32* %vtpm.112
	%vtpm.114 = call i8*(i32 ) @malloc( i32 %vtpm.113 )
	%vtpm.115 = bitcast i8* %vtpm.114 to %AA*
	%vtpm.116 = icmp eq %AA* %vtpm.115, null
	br i1 %vtpm.116, label %abort, label %ok.0

ok.0:
	%vtpm.117 = getelementptr %AA, %AA* %vtpm.115, i32 0, i32 0
	store %_AA_vtable* @_AA_vtable_prototype, %_AA_vtable** %vtpm.117
	store %AA* %vtpm.115, %AA** %vtpm.111
	%vtpm.118 = getelementptr %AA, %AA* %vtpm.115, i32 0, i32 1
	store i1 false, i1* %vtpm.118
	%vtpm.119 = getelementptr %AA, %AA* %vtpm.115, i32 0, i32 2
	store i32 0, i32* %vtpm.119
	ret %AA* %vtpm.115

abort:
	call void @abort(  )
	unreachable
}

