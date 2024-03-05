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

@str.Bazz = internal constant [5 x i8] c"Bazz\00"
%Bazz = type {
	%_Bazz_vtable*,
	i32,
	%Foo*,
	%Object*
}

%_Bazz_vtable = type {
	i32,
	i32,
	i8*,
	%Bazz* () *,
	%Object* (%Bazz*) *,
	%String* (%Bazz*) *,
	%Bazz* (%Bazz*) *,
	%Bazz* (%Bazz*,%String*) *,
	%Bazz* (%Bazz*,i32) *,
	%String* (%Bazz*) *,
	i32 (%Bazz*) *,
	i32 (%Bazz*) *,
	i32 (%Bazz*) *
}

@_Bazz_vtable_prototype = constant %_Bazz_vtable {
	i32 5,
	i32 ptrtoint (%Bazz* getelementptr (%Bazz, %Bazz* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bazz, i32 0, i32 0),
	%Bazz* () * @Bazz_new,
	%Object* (%Bazz*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bazz*) *),
	%String* (%Bazz*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bazz*) *),
	%Bazz* (%Bazz*) * bitcast (%Object* (%Object*) * @Object_copy to %Bazz* (%Bazz*) *),
	%Bazz* (%Bazz*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Bazz* (%Bazz*,%String*) *),
	%Bazz* (%Bazz*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Bazz* (%Bazz*,i32) *),
	%String* (%Bazz*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Bazz*) *),
	i32 (%Bazz*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Bazz*) *),
	i32 (%Bazz*) * @Bazz.printh,
	i32 (%Bazz*) * @Bazz.doh
}

@str.Foo = internal constant [4 x i8] c"Foo\00"
%Foo = type {
	%_Foo_vtable*,
	i32,
	%Foo*,
	%Object*,
	%Razz*,
	i32
}

%_Foo_vtable = type {
	i32,
	i32,
	i8*,
	%Foo* () *,
	%Object* (%Foo*) *,
	%String* (%Foo*) *,
	%Foo* (%Foo*) *,
	%Foo* (%Foo*,%String*) *,
	%Foo* (%Foo*,i32) *,
	%String* (%Foo*) *,
	i32 (%Foo*) *,
	i32 (%Foo*) *,
	i32 (%Foo*) *
}

@_Foo_vtable_prototype = constant %_Foo_vtable {
	i32 6,
	i32 ptrtoint (%Foo* getelementptr (%Foo, %Foo* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Foo, i32 0, i32 0),
	%Foo* () * @Foo_new,
	%Object* (%Foo*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Foo*) *),
	%String* (%Foo*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Foo*) *),
	%Foo* (%Foo*) * bitcast (%Object* (%Object*) * @Object_copy to %Foo* (%Foo*) *),
	%Foo* (%Foo*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Foo* (%Foo*,%String*) *),
	%Foo* (%Foo*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Foo* (%Foo*,i32) *),
	%String* (%Foo*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Foo*) *),
	i32 (%Foo*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Foo*) *),
	i32 (%Foo*) * bitcast (i32 (%Bazz*) * @Bazz.printh to i32 (%Foo*) *),
	i32 (%Foo*) * @Foo.doh
}

@str.Razz = internal constant [5 x i8] c"Razz\00"
%Razz = type {
	%_Razz_vtable*,
	i32,
	%Foo*,
	%Object*,
	%Razz*,
	i32,
	%Bar*,
	i32
}

%_Razz_vtable = type {
	i32,
	i32,
	i8*,
	%Razz* () *,
	%Object* (%Razz*) *,
	%String* (%Razz*) *,
	%Razz* (%Razz*) *,
	%Razz* (%Razz*,%String*) *,
	%Razz* (%Razz*,i32) *,
	%String* (%Razz*) *,
	i32 (%Razz*) *,
	i32 (%Razz*) *,
	i32 (%Razz*) *
}

@_Razz_vtable_prototype = constant %_Razz_vtable {
	i32 7,
	i32 ptrtoint (%Razz* getelementptr (%Razz, %Razz* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Razz, i32 0, i32 0),
	%Razz* () * @Razz_new,
	%Object* (%Razz*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Razz*) *),
	%String* (%Razz*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Razz*) *),
	%Razz* (%Razz*) * bitcast (%Object* (%Object*) * @Object_copy to %Razz* (%Razz*) *),
	%Razz* (%Razz*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Razz* (%Razz*,%String*) *),
	%Razz* (%Razz*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Razz* (%Razz*,i32) *),
	%String* (%Razz*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Razz*) *),
	i32 (%Razz*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Razz*) *),
	i32 (%Razz*) * bitcast (i32 (%Bazz*) * @Bazz.printh to i32 (%Razz*) *),
	i32 (%Razz*) * bitcast (i32 (%Foo*) * @Foo.doh to i32 (%Razz*) *)
}

@str.Bar = internal constant [4 x i8] c"Bar\00"
%Bar = type {
	%_Bar_vtable*,
	i32,
	%Foo*,
	%Object*,
	%Razz*,
	i32,
	%Bar*,
	i32,
	i32,
	%Object*
}

%_Bar_vtable = type {
	i32,
	i32,
	i8*,
	%Bar* () *,
	%Object* (%Bar*) *,
	%String* (%Bar*) *,
	%Bar* (%Bar*) *,
	%Bar* (%Bar*,%String*) *,
	%Bar* (%Bar*,i32) *,
	%String* (%Bar*) *,
	i32 (%Bar*) *,
	i32 (%Bar*) *,
	i32 (%Bar*) *
}

@_Bar_vtable_prototype = constant %_Bar_vtable {
	i32 8,
	i32 ptrtoint (%Bar* getelementptr (%Bar, %Bar* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Bar, i32 0, i32 0),
	%Bar* () * @Bar_new,
	%Object* (%Bar*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bar*) *),
	%String* (%Bar*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bar*) *),
	%Bar* (%Bar*) * bitcast (%Object* (%Object*) * @Object_copy to %Bar* (%Bar*) *),
	%Bar* (%Bar*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Bar* (%Bar*,%String*) *),
	%Bar* (%Bar*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Bar* (%Bar*,i32) *),
	%String* (%Bar*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Bar*) *),
	i32 (%Bar*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Bar*) *),
	i32 (%Bar*) * bitcast (i32 (%Bazz*) * @Bazz.printh to i32 (%Bar*) *),
	i32 (%Bar*) * bitcast (i32 (%Foo*) * @Foo.doh to i32 (%Bar*) *)
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%_Main_vtable*,
	%Bazz*,
	%Foo*,
	%Razz*,
	%Bar*
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
	i32 9,
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

@str.1 = internal constant [11 x i8] c"do nothing\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([11 x i8], [11 x i8]* @str.1, i32 0, i32 0)
}

@str.2 = internal constant [14 x i8] c"hairyscary.cl\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.2, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main* @Main_new(  )
	%main.retval = call %String*(%Main* ) @Main.main( %Main* %main.obj )
	ret i32 0
}

define i32 @Bazz.printh(%Bazz* %self) {

entry:
	%vtpm.0 = alloca %Bazz*
	store %Bazz* %self, %Bazz** %vtpm.0
	%vtpm.1 = load %Bazz*, %Bazz** %vtpm.0
	%vtpm.2 = getelementptr %Bazz, %Bazz* %vtpm.1, i32 0, i32 1
	%vtpm.3 = load i32, i32* %vtpm.2
	%vtpm.4 = load %Bazz*, %Bazz** %vtpm.0
	%vtpm.5 = icmp eq %Bazz* %vtpm.4, null
	br i1 %vtpm.5, label %abort, label %ok.0

ok.0:
	%vtpm.6 = getelementptr %Bazz, %Bazz* %vtpm.4, i32 0, i32 0
	%vtpm.7 = load %_Bazz_vtable*, %_Bazz_vtable** %vtpm.6
	%vtpm.8 = getelementptr %_Bazz_vtable, %_Bazz_vtable* %vtpm.7, i32 0, i32 8
	%vtpm.9 = load %Bazz* (%Bazz*,i32) *, %Bazz* (%Bazz*,i32) ** %vtpm.8
	%vtpm.10 = call %Bazz*(%Bazz*, i32 )%vtpm.9( %Bazz* %vtpm.4, i32 %vtpm.3 )
	ret i32 0

abort:
	call void @abort(  )
	unreachable
}

define i32 @Bazz.doh(%Bazz* %self) {

entry:
	%vtpm.12 = alloca %Bazz*
	%vtpm.13 = alloca i32
	store %Bazz* %self, %Bazz** %vtpm.12
	%vtpm.14 = load %Bazz*, %Bazz** %vtpm.12
	%vtpm.15 = getelementptr %Bazz, %Bazz* %vtpm.14, i32 0, i32 1
	%vtpm.16 = load i32, i32* %vtpm.15
	store i32 %vtpm.16, i32* %vtpm.13
	%vtpm.17 = load %Bazz*, %Bazz** %vtpm.12
	%vtpm.18 = getelementptr %Bazz, %Bazz* %vtpm.17, i32 0, i32 1
	%vtpm.19 = load i32, i32* %vtpm.18
	%vtpm.20 = add i32 %vtpm.19, 1
	%vtpm.21 = load %Bazz*, %Bazz** %vtpm.12
	%vtpm.22 = getelementptr %Bazz, %Bazz* %vtpm.21, i32 0, i32 1
	store i32 %vtpm.20, i32* %vtpm.22
	%vtpm.23 = load i32, i32* %vtpm.13
	ret i32 %vtpm.23

abort:
	call void @abort(  )
	unreachable
}

define %Bazz* @Bazz_new() {

entry:
	%vtpm.25 = alloca %Bazz*
	%tmp.0 = alloca %Foo*
	%vtpm.26 = alloca %Bazz*
	%vtpm.27 = alloca %Razz*
	%vtpm.28 = alloca %Foo*
	%vtpm.29 = alloca %Bar*
	%vtpm.30 = getelementptr %_Bazz_vtable, %_Bazz_vtable* @_Bazz_vtable_prototype, i32 0, i32 1
	%vtpm.31 = load i32, i32* %vtpm.30
	%vtpm.32 = call i8*(i32 ) @malloc( i32 %vtpm.31 )
	%vtpm.33 = bitcast i8* %vtpm.32 to %Bazz*
	%vtpm.34 = icmp eq %Bazz* %vtpm.33, null
	br i1 %vtpm.34, label %abort, label %ok.1

ok.1:
	%vtpm.35 = getelementptr %Bazz, %Bazz* %vtpm.33, i32 0, i32 0
	store %_Bazz_vtable* @_Bazz_vtable_prototype, %_Bazz_vtable** %vtpm.35
	store %Bazz* %vtpm.33, %Bazz** %vtpm.25
	%vtpm.36 = getelementptr %Bazz, %Bazz* %vtpm.33, i32 0, i32 1
	store i32 0, i32* %vtpm.36
	%vtpm.37 = getelementptr %Bazz, %Bazz* %vtpm.33, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.37
	%vtpm.38 = getelementptr %Bazz, %Bazz* %vtpm.33, i32 0, i32 3
	store %Object* null, %Object** %vtpm.38
	%vtpm.39 = getelementptr %Bazz, %Bazz* %vtpm.33, i32 0, i32 1
	store i32 1, i32* %vtpm.39
	%vtpm.40 = load %Bazz*, %Bazz** %vtpm.25
	%tmp.1 = icmp eq %Bazz* %vtpm.40, null
	br i1 %tmp.1, label %abort, label %ok.2

ok.2:
	%vtpm.41 = getelementptr %Bazz, %Bazz* %vtpm.40, i32 0, i32 0
	%vtpm.42 = load %_Bazz_vtable*, %_Bazz_vtable** %vtpm.41
	%vtpm.43 = getelementptr %_Bazz_vtable, %_Bazz_vtable* %vtpm.42, i32 0, i32 0
	%vtpm.44 = load i32, i32* %vtpm.43
	br label %case.hdr.0

case.hdr.0:
	br label %case.8.0

case.8.0:
	%vtpm.45 = icmp slt i32 %vtpm.44, 8
	br i1 %vtpm.45, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.46 = icmp sgt i32 %vtpm.44, 8
	br i1 %vtpm.46, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%vtpm.47 = bitcast %Bazz* %vtpm.40 to %Bar*
	store %Bar* %vtpm.47, %Bar** %vtpm.29
	%vtpm.48 = load %Bar*, %Bar** %vtpm.29
	%vtpm.49 = bitcast %Bar* %vtpm.48 to %Foo*
	store %Foo* %vtpm.49, %Foo** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%vtpm.50 = icmp slt i32 %vtpm.44, 7
	br i1 %vtpm.50, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.51 = icmp sgt i32 %vtpm.44, 8
	br i1 %vtpm.51, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.52 = bitcast %Bazz* %vtpm.40 to %Razz*
	store %Razz* %vtpm.52, %Razz** %vtpm.27
	%vtpm.53 = call %Bar* @Bar_new(  )
	%vtpm.54 = icmp eq %Bar* %vtpm.53, null
	br i1 %vtpm.54, label %abort, label %ok.3

ok.3:
	%vtpm.55 = bitcast %Bar* %vtpm.53 to %Foo*
	store %Foo* %vtpm.55, %Foo** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%vtpm.56 = icmp slt i32 %vtpm.44, 6
	br i1 %vtpm.56, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.57 = icmp sgt i32 %vtpm.44, 8
	br i1 %vtpm.57, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.58 = bitcast %Bazz* %vtpm.40 to %Foo*
	store %Foo* %vtpm.58, %Foo** %vtpm.28
	%vtpm.59 = call %Razz* @Razz_new(  )
	%vtpm.60 = icmp eq %Razz* %vtpm.59, null
	br i1 %vtpm.60, label %abort, label %ok.4

ok.4:
	%vtpm.61 = bitcast %Razz* %vtpm.59 to %Foo*
	store %Foo* %vtpm.61, %Foo** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.62 = icmp slt i32 %vtpm.44, 5
	br i1 %vtpm.62, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.63 = icmp sgt i32 %vtpm.44, 8
	br i1 %vtpm.63, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	store %Bazz* %vtpm.40, %Bazz** %vtpm.26
	%vtpm.64 = call %Foo* @Foo_new(  )
	%vtpm.65 = icmp eq %Foo* %vtpm.64, null
	br i1 %vtpm.65, label %abort, label %ok.5

ok.5:
	store %Foo* %vtpm.64, %Foo** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.2 = load %Foo*, %Foo** %tmp.0
	%vtpm.66 = getelementptr %Bazz, %Bazz* %vtpm.33, i32 0, i32 2
	store %Foo* %tmp.2, %Foo** %vtpm.66
	%vtpm.67 = load %Bazz*, %Bazz** %vtpm.25
	%vtpm.68 = icmp eq %Bazz* %vtpm.67, null
	br i1 %vtpm.68, label %abort, label %ok.6

ok.6:
	%vtpm.69 = getelementptr %Bazz, %Bazz* %vtpm.67, i32 0, i32 0
	%vtpm.70 = load %_Bazz_vtable*, %_Bazz_vtable** %vtpm.69
	%vtpm.71 = getelementptr %_Bazz_vtable, %_Bazz_vtable* %vtpm.70, i32 0, i32 11
	%vtpm.72 = load i32 (%Bazz*) *, i32 (%Bazz*) ** %vtpm.71
	%vtpm.73 = call i32(%Bazz* )%vtpm.72( %Bazz* %vtpm.67 )
	%vtpm.74 = getelementptr %Bazz, %Bazz* %vtpm.33, i32 0, i32 3
	%vtpm.75 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.75, i32 %vtpm.73 )
	%vtpm.77 = bitcast %Int* %vtpm.75 to %Object*
	store %Object* %vtpm.77, %Object** %vtpm.74
	ret %Bazz* %vtpm.33

abort:
	call void @abort(  )
	unreachable
}

define i32 @Foo.doh(%Foo* %self) {

entry:
	%vtpm.79 = alloca %Foo*
	%vtpm.80 = alloca i32
	store %Foo* %self, %Foo** %vtpm.79
	%vtpm.81 = load %Foo*, %Foo** %vtpm.79
	%vtpm.82 = getelementptr %Foo, %Foo* %vtpm.81, i32 0, i32 1
	%vtpm.83 = load i32, i32* %vtpm.82
	store i32 %vtpm.83, i32* %vtpm.80
	%vtpm.84 = load %Foo*, %Foo** %vtpm.79
	%vtpm.85 = getelementptr %Foo, %Foo* %vtpm.84, i32 0, i32 1
	%vtpm.86 = load i32, i32* %vtpm.85
	%vtpm.87 = add i32 %vtpm.86, 2
	%vtpm.88 = load %Foo*, %Foo** %vtpm.79
	%vtpm.89 = getelementptr %Foo, %Foo* %vtpm.88, i32 0, i32 1
	store i32 %vtpm.87, i32* %vtpm.89
	%vtpm.90 = load i32, i32* %vtpm.80
	ret i32 %vtpm.90

abort:
	call void @abort(  )
	unreachable
}

define %Foo* @Foo_new() {

entry:
	%vtpm.92 = alloca %Foo*
	%tmp.0 = alloca %Foo*
	%vtpm.93 = alloca %Bazz*
	%vtpm.94 = alloca %Razz*
	%vtpm.95 = alloca %Foo*
	%vtpm.96 = alloca %Bar*
	%tmp.1 = alloca %Bar*
	%vtpm.97 = alloca %Razz*
	%vtpm.98 = alloca %Foo*
	%vtpm.99 = alloca %Bar*
	%vtpm.100 = getelementptr %_Foo_vtable, %_Foo_vtable* @_Foo_vtable_prototype, i32 0, i32 1
	%vtpm.101 = load i32, i32* %vtpm.100
	%vtpm.102 = call i8*(i32 ) @malloc( i32 %vtpm.101 )
	%vtpm.103 = bitcast i8* %vtpm.102 to %Foo*
	%vtpm.104 = icmp eq %Foo* %vtpm.103, null
	br i1 %vtpm.104, label %abort, label %ok.0

ok.0:
	%vtpm.105 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 0
	store %_Foo_vtable* @_Foo_vtable_prototype, %_Foo_vtable** %vtpm.105
	store %Foo* %vtpm.103, %Foo** %vtpm.92
	%vtpm.106 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 1
	store i32 0, i32* %vtpm.106
	%vtpm.107 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.107
	%vtpm.108 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 3
	store %Object* null, %Object** %vtpm.108
	%vtpm.109 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 4
	store %Razz* null, %Razz** %vtpm.109
	%vtpm.110 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 5
	store i32 0, i32* %vtpm.110
	%vtpm.111 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 1
	store i32 1, i32* %vtpm.111
	%vtpm.112 = load %Foo*, %Foo** %vtpm.92
	%tmp.2 = icmp eq %Foo* %vtpm.112, null
	br i1 %tmp.2, label %abort, label %ok.1

ok.1:
	%vtpm.113 = getelementptr %Foo, %Foo* %vtpm.112, i32 0, i32 0
	%vtpm.114 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.113
	%vtpm.115 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.114, i32 0, i32 0
	%vtpm.116 = load i32, i32* %vtpm.115
	br label %case.hdr.0

case.hdr.0:
	br label %case.8.0

case.8.0:
	%vtpm.117 = icmp slt i32 %vtpm.116, 8
	br i1 %vtpm.117, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.118 = icmp sgt i32 %vtpm.116, 8
	br i1 %vtpm.118, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%vtpm.119 = bitcast %Foo* %vtpm.112 to %Bar*
	store %Bar* %vtpm.119, %Bar** %vtpm.96
	%vtpm.120 = load %Bar*, %Bar** %vtpm.96
	%vtpm.121 = bitcast %Bar* %vtpm.120 to %Foo*
	store %Foo* %vtpm.121, %Foo** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%vtpm.122 = icmp slt i32 %vtpm.116, 7
	br i1 %vtpm.122, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.123 = icmp sgt i32 %vtpm.116, 8
	br i1 %vtpm.123, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.124 = bitcast %Foo* %vtpm.112 to %Razz*
	store %Razz* %vtpm.124, %Razz** %vtpm.94
	%vtpm.125 = call %Bar* @Bar_new(  )
	%vtpm.126 = icmp eq %Bar* %vtpm.125, null
	br i1 %vtpm.126, label %abort, label %ok.2

ok.2:
	%vtpm.127 = bitcast %Bar* %vtpm.125 to %Foo*
	store %Foo* %vtpm.127, %Foo** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%vtpm.128 = icmp slt i32 %vtpm.116, 6
	br i1 %vtpm.128, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.129 = icmp sgt i32 %vtpm.116, 8
	br i1 %vtpm.129, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	store %Foo* %vtpm.112, %Foo** %vtpm.95
	%vtpm.130 = call %Razz* @Razz_new(  )
	%vtpm.131 = icmp eq %Razz* %vtpm.130, null
	br i1 %vtpm.131, label %abort, label %ok.3

ok.3:
	%vtpm.132 = bitcast %Razz* %vtpm.130 to %Foo*
	store %Foo* %vtpm.132, %Foo** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.133 = icmp slt i32 %vtpm.116, 5
	br i1 %vtpm.133, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.134 = icmp sgt i32 %vtpm.116, 8
	br i1 %vtpm.134, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%vtpm.135 = bitcast %Foo* %vtpm.112 to %Bazz*
	store %Bazz* %vtpm.135, %Bazz** %vtpm.93
	%vtpm.136 = call %Foo* @Foo_new(  )
	%vtpm.137 = icmp eq %Foo* %vtpm.136, null
	br i1 %vtpm.137, label %abort, label %ok.4

ok.4:
	store %Foo* %vtpm.136, %Foo** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.3 = load %Foo*, %Foo** %tmp.0
	%vtpm.138 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 2
	store %Foo* %tmp.3, %Foo** %vtpm.138
	%vtpm.139 = load %Foo*, %Foo** %vtpm.92
	%vtpm.140 = icmp eq %Foo* %vtpm.139, null
	br i1 %vtpm.140, label %abort, label %ok.5

ok.5:
	%vtpm.141 = getelementptr %Foo, %Foo* %vtpm.139, i32 0, i32 0
	%vtpm.142 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.141
	%vtpm.143 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.142, i32 0, i32 11
	%vtpm.144 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.143
	%vtpm.145 = call i32(%Foo* )%vtpm.144( %Foo* %vtpm.139 )
	%vtpm.146 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 3
	%vtpm.147 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.147, i32 %vtpm.145 )
	%vtpm.149 = bitcast %Int* %vtpm.147 to %Object*
	store %Object* %vtpm.149, %Object** %vtpm.146
	%vtpm.150 = load %Foo*, %Foo** %vtpm.92
	%tmp.4 = icmp eq %Foo* %vtpm.150, null
	br i1 %tmp.4, label %abort, label %ok.6

ok.6:
	%vtpm.151 = getelementptr %Foo, %Foo* %vtpm.150, i32 0, i32 0
	%vtpm.152 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.151
	%vtpm.153 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.152, i32 0, i32 0
	%vtpm.154 = load i32, i32* %vtpm.153
	br label %case.hdr.1

case.hdr.1:
	br label %case.8.1

case.8.1:
	%vtpm.155 = icmp slt i32 %vtpm.154, 8
	br i1 %vtpm.155, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%vtpm.156 = icmp sgt i32 %vtpm.154, 8
	br i1 %vtpm.156, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%vtpm.157 = bitcast %Foo* %vtpm.150 to %Bar*
	store %Bar* %vtpm.157, %Bar** %vtpm.99
	%vtpm.158 = load %Bar*, %Bar** %vtpm.99
	%vtpm.159 = bitcast %Bar* %vtpm.158 to %Razz*
	%vtpm.160 = bitcast %Razz* %vtpm.159 to %Bar*
	store %Bar* %vtpm.160, %Bar** %tmp.1
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%vtpm.161 = icmp slt i32 %vtpm.154, 7
	br i1 %vtpm.161, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.162 = icmp sgt i32 %vtpm.154, 8
	br i1 %vtpm.162, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%vtpm.163 = bitcast %Foo* %vtpm.150 to %Razz*
	store %Razz* %vtpm.163, %Razz** %vtpm.97
	%vtpm.164 = call %Bar* @Bar_new(  )
	%vtpm.165 = icmp eq %Bar* %vtpm.164, null
	br i1 %vtpm.165, label %abort, label %ok.7

ok.7:
	%vtpm.166 = bitcast %Bar* %vtpm.164 to %Razz*
	%vtpm.167 = bitcast %Razz* %vtpm.166 to %Bar*
	store %Bar* %vtpm.167, %Bar** %tmp.1
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%vtpm.168 = icmp slt i32 %vtpm.154, 6
	br i1 %vtpm.168, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%vtpm.169 = icmp sgt i32 %vtpm.154, 8
	br i1 %vtpm.169, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	store %Foo* %vtpm.150, %Foo** %vtpm.98
	%vtpm.170 = call %Razz* @Razz_new(  )
	%vtpm.171 = icmp eq %Razz* %vtpm.170, null
	br i1 %vtpm.171, label %abort, label %ok.8

ok.8:
	%vtpm.172 = bitcast %Razz* %vtpm.170 to %Bar*
	store %Bar* %vtpm.172, %Bar** %tmp.1
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%tmp.5 = load %Bar*, %Bar** %tmp.1
	%vtpm.173 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 4
	%vtpm.174 = bitcast %Bar* %tmp.5 to %Razz*
	store %Razz* %vtpm.174, %Razz** %vtpm.173
	%vtpm.175 = load %Foo*, %Foo** %vtpm.92
	%vtpm.176 = getelementptr %Foo, %Foo* %vtpm.175, i32 0, i32 4
	%vtpm.177 = load %Razz*, %Razz** %vtpm.176
	%vtpm.178 = icmp eq %Razz* %vtpm.177, null
	br i1 %vtpm.178, label %abort, label %ok.9

ok.9:
	%vtpm.179 = getelementptr %Razz, %Razz* %vtpm.177, i32 0, i32 0
	%vtpm.180 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.179
	%vtpm.181 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.180, i32 0, i32 12
	%vtpm.182 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.181
	%vtpm.183 = call i32(%Razz* )%vtpm.182( %Razz* %vtpm.177 )
	%vtpm.184 = load %Foo*, %Foo** %vtpm.92
	%vtpm.185 = getelementptr %Foo, %Foo* %vtpm.184, i32 0, i32 2
	%vtpm.186 = load %Foo*, %Foo** %vtpm.185
	%vtpm.187 = icmp eq %Foo* %vtpm.186, null
	br i1 %vtpm.187, label %abort, label %ok.10

ok.10:
	%vtpm.188 = getelementptr %Foo, %Foo* %vtpm.186, i32 0, i32 0
	%vtpm.189 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.188
	%vtpm.190 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.189, i32 0, i32 12
	%vtpm.191 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.190
	%vtpm.192 = call i32(%Foo* )%vtpm.191( %Foo* %vtpm.186 )
	%vtpm.193 = add i32 %vtpm.183, %vtpm.192
	%vtpm.194 = load %Foo*, %Foo** %vtpm.92
	%vtpm.195 = icmp eq %Foo* %vtpm.194, null
	br i1 %vtpm.195, label %abort, label %ok.11

ok.11:
	%vtpm.196 = getelementptr %Foo, %Foo* %vtpm.194, i32 0, i32 0
	%vtpm.197 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.196
	%vtpm.198 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.197, i32 0, i32 12
	%vtpm.199 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.198
	%vtpm.200 = call i32(%Foo* )%vtpm.199( %Foo* %vtpm.194 )
	%vtpm.201 = add i32 %vtpm.193, %vtpm.200
	%vtpm.202 = load %Foo*, %Foo** %vtpm.92
	%vtpm.203 = icmp eq %Foo* %vtpm.202, null
	br i1 %vtpm.203, label %abort, label %ok.12

ok.12:
	%vtpm.204 = getelementptr %Foo, %Foo* %vtpm.202, i32 0, i32 0
	%vtpm.205 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.204
	%vtpm.206 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.205, i32 0, i32 11
	%vtpm.207 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.206
	%vtpm.208 = call i32(%Foo* )%vtpm.207( %Foo* %vtpm.202 )
	%vtpm.209 = add i32 %vtpm.201, %vtpm.208
	%vtpm.210 = getelementptr %Foo, %Foo* %vtpm.103, i32 0, i32 5
	store i32 %vtpm.209, i32* %vtpm.210
	ret %Foo* %vtpm.103

abort:
	call void @abort(  )
	unreachable
}

define %Razz* @Razz_new() {

entry:
	%vtpm.212 = alloca %Razz*
	%tmp.0 = alloca %Foo*
	%vtpm.213 = alloca %Bazz*
	%vtpm.214 = alloca %Razz*
	%vtpm.215 = alloca %Foo*
	%vtpm.216 = alloca %Bar*
	%tmp.1 = alloca %Bar*
	%vtpm.217 = alloca %Razz*
	%vtpm.218 = alloca %Foo*
	%vtpm.219 = alloca %Bar*
	%tmp.2 = alloca %Bar*
	%vtpm.220 = alloca %Razz*
	%vtpm.221 = alloca %Bar*
	%vtpm.222 = getelementptr %_Razz_vtable, %_Razz_vtable* @_Razz_vtable_prototype, i32 0, i32 1
	%vtpm.223 = load i32, i32* %vtpm.222
	%vtpm.224 = call i8*(i32 ) @malloc( i32 %vtpm.223 )
	%vtpm.225 = bitcast i8* %vtpm.224 to %Razz*
	%vtpm.226 = icmp eq %Razz* %vtpm.225, null
	br i1 %vtpm.226, label %abort, label %ok.0

ok.0:
	%vtpm.227 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 0
	store %_Razz_vtable* @_Razz_vtable_prototype, %_Razz_vtable** %vtpm.227
	store %Razz* %vtpm.225, %Razz** %vtpm.212
	%vtpm.228 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 1
	store i32 0, i32* %vtpm.228
	%vtpm.229 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.229
	%vtpm.230 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 3
	store %Object* null, %Object** %vtpm.230
	%vtpm.231 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 4
	store %Razz* null, %Razz** %vtpm.231
	%vtpm.232 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 5
	store i32 0, i32* %vtpm.232
	%vtpm.233 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 6
	store %Bar* null, %Bar** %vtpm.233
	%vtpm.234 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 7
	store i32 0, i32* %vtpm.234
	%vtpm.235 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 1
	store i32 1, i32* %vtpm.235
	%vtpm.236 = load %Razz*, %Razz** %vtpm.212
	%tmp.3 = icmp eq %Razz* %vtpm.236, null
	br i1 %tmp.3, label %abort, label %ok.1

ok.1:
	%vtpm.237 = getelementptr %Razz, %Razz* %vtpm.236, i32 0, i32 0
	%vtpm.238 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.237
	%vtpm.239 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.238, i32 0, i32 0
	%vtpm.240 = load i32, i32* %vtpm.239
	br label %case.hdr.0

case.hdr.0:
	br label %case.8.0

case.8.0:
	%vtpm.241 = icmp slt i32 %vtpm.240, 8
	br i1 %vtpm.241, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.242 = icmp sgt i32 %vtpm.240, 8
	br i1 %vtpm.242, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	%vtpm.243 = bitcast %Razz* %vtpm.236 to %Bar*
	store %Bar* %vtpm.243, %Bar** %vtpm.216
	%vtpm.244 = load %Bar*, %Bar** %vtpm.216
	%vtpm.245 = bitcast %Bar* %vtpm.244 to %Foo*
	store %Foo* %vtpm.245, %Foo** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%vtpm.246 = icmp slt i32 %vtpm.240, 7
	br i1 %vtpm.246, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.247 = icmp sgt i32 %vtpm.240, 8
	br i1 %vtpm.247, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	store %Razz* %vtpm.236, %Razz** %vtpm.214
	%vtpm.248 = call %Bar* @Bar_new(  )
	%vtpm.249 = icmp eq %Bar* %vtpm.248, null
	br i1 %vtpm.249, label %abort, label %ok.2

ok.2:
	%vtpm.250 = bitcast %Bar* %vtpm.248 to %Foo*
	store %Foo* %vtpm.250, %Foo** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%vtpm.251 = icmp slt i32 %vtpm.240, 6
	br i1 %vtpm.251, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.252 = icmp sgt i32 %vtpm.240, 8
	br i1 %vtpm.252, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.253 = bitcast %Razz* %vtpm.236 to %Foo*
	store %Foo* %vtpm.253, %Foo** %vtpm.215
	%vtpm.254 = call %Razz* @Razz_new(  )
	%vtpm.255 = icmp eq %Razz* %vtpm.254, null
	br i1 %vtpm.255, label %abort, label %ok.3

ok.3:
	%vtpm.256 = bitcast %Razz* %vtpm.254 to %Foo*
	store %Foo* %vtpm.256, %Foo** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.257 = icmp slt i32 %vtpm.240, 5
	br i1 %vtpm.257, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.258 = icmp sgt i32 %vtpm.240, 8
	br i1 %vtpm.258, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%vtpm.259 = bitcast %Razz* %vtpm.236 to %Bazz*
	store %Bazz* %vtpm.259, %Bazz** %vtpm.213
	%vtpm.260 = call %Foo* @Foo_new(  )
	%vtpm.261 = icmp eq %Foo* %vtpm.260, null
	br i1 %vtpm.261, label %abort, label %ok.4

ok.4:
	store %Foo* %vtpm.260, %Foo** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.4 = load %Foo*, %Foo** %tmp.0
	%vtpm.262 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 2
	store %Foo* %tmp.4, %Foo** %vtpm.262
	%vtpm.263 = load %Razz*, %Razz** %vtpm.212
	%vtpm.264 = icmp eq %Razz* %vtpm.263, null
	br i1 %vtpm.264, label %abort, label %ok.5

ok.5:
	%vtpm.265 = getelementptr %Razz, %Razz* %vtpm.263, i32 0, i32 0
	%vtpm.266 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.265
	%vtpm.267 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.266, i32 0, i32 11
	%vtpm.268 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.267
	%vtpm.269 = call i32(%Razz* )%vtpm.268( %Razz* %vtpm.263 )
	%vtpm.270 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 3
	%vtpm.271 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.271, i32 %vtpm.269 )
	%vtpm.273 = bitcast %Int* %vtpm.271 to %Object*
	store %Object* %vtpm.273, %Object** %vtpm.270
	%vtpm.274 = load %Razz*, %Razz** %vtpm.212
	%tmp.5 = icmp eq %Razz* %vtpm.274, null
	br i1 %tmp.5, label %abort, label %ok.6

ok.6:
	%vtpm.275 = getelementptr %Razz, %Razz* %vtpm.274, i32 0, i32 0
	%vtpm.276 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.275
	%vtpm.277 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.276, i32 0, i32 0
	%vtpm.278 = load i32, i32* %vtpm.277
	br label %case.hdr.1

case.hdr.1:
	br label %case.8.1

case.8.1:
	%vtpm.279 = icmp slt i32 %vtpm.278, 8
	br i1 %vtpm.279, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%vtpm.280 = icmp sgt i32 %vtpm.278, 8
	br i1 %vtpm.280, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	%vtpm.281 = bitcast %Razz* %vtpm.274 to %Bar*
	store %Bar* %vtpm.281, %Bar** %vtpm.219
	%vtpm.282 = load %Bar*, %Bar** %vtpm.219
	%vtpm.283 = bitcast %Bar* %vtpm.282 to %Razz*
	%vtpm.284 = bitcast %Razz* %vtpm.283 to %Bar*
	store %Bar* %vtpm.284, %Bar** %tmp.1
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%vtpm.285 = icmp slt i32 %vtpm.278, 7
	br i1 %vtpm.285, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.286 = icmp sgt i32 %vtpm.278, 8
	br i1 %vtpm.286, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	store %Razz* %vtpm.274, %Razz** %vtpm.217
	%vtpm.287 = call %Bar* @Bar_new(  )
	%vtpm.288 = icmp eq %Bar* %vtpm.287, null
	br i1 %vtpm.288, label %abort, label %ok.7

ok.7:
	%vtpm.289 = bitcast %Bar* %vtpm.287 to %Razz*
	%vtpm.290 = bitcast %Razz* %vtpm.289 to %Bar*
	store %Bar* %vtpm.290, %Bar** %tmp.1
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%vtpm.291 = icmp slt i32 %vtpm.278, 6
	br i1 %vtpm.291, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%vtpm.292 = icmp sgt i32 %vtpm.278, 8
	br i1 %vtpm.292, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%vtpm.293 = bitcast %Razz* %vtpm.274 to %Foo*
	store %Foo* %vtpm.293, %Foo** %vtpm.218
	%vtpm.294 = call %Razz* @Razz_new(  )
	%vtpm.295 = icmp eq %Razz* %vtpm.294, null
	br i1 %vtpm.295, label %abort, label %ok.8

ok.8:
	%vtpm.296 = bitcast %Razz* %vtpm.294 to %Bar*
	store %Bar* %vtpm.296, %Bar** %tmp.1
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%tmp.6 = load %Bar*, %Bar** %tmp.1
	%vtpm.297 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 4
	%vtpm.298 = bitcast %Bar* %tmp.6 to %Razz*
	store %Razz* %vtpm.298, %Razz** %vtpm.297
	%vtpm.299 = load %Razz*, %Razz** %vtpm.212
	%vtpm.300 = getelementptr %Razz, %Razz* %vtpm.299, i32 0, i32 4
	%vtpm.301 = load %Razz*, %Razz** %vtpm.300
	%vtpm.302 = icmp eq %Razz* %vtpm.301, null
	br i1 %vtpm.302, label %abort, label %ok.9

ok.9:
	%vtpm.303 = getelementptr %Razz, %Razz* %vtpm.301, i32 0, i32 0
	%vtpm.304 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.303
	%vtpm.305 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.304, i32 0, i32 12
	%vtpm.306 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.305
	%vtpm.307 = call i32(%Razz* )%vtpm.306( %Razz* %vtpm.301 )
	%vtpm.308 = load %Razz*, %Razz** %vtpm.212
	%vtpm.309 = getelementptr %Razz, %Razz* %vtpm.308, i32 0, i32 2
	%vtpm.310 = load %Foo*, %Foo** %vtpm.309
	%vtpm.311 = icmp eq %Foo* %vtpm.310, null
	br i1 %vtpm.311, label %abort, label %ok.10

ok.10:
	%vtpm.312 = getelementptr %Foo, %Foo* %vtpm.310, i32 0, i32 0
	%vtpm.313 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.312
	%vtpm.314 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.313, i32 0, i32 12
	%vtpm.315 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.314
	%vtpm.316 = call i32(%Foo* )%vtpm.315( %Foo* %vtpm.310 )
	%vtpm.317 = add i32 %vtpm.307, %vtpm.316
	%vtpm.318 = load %Razz*, %Razz** %vtpm.212
	%vtpm.319 = icmp eq %Razz* %vtpm.318, null
	br i1 %vtpm.319, label %abort, label %ok.11

ok.11:
	%vtpm.320 = getelementptr %Razz, %Razz* %vtpm.318, i32 0, i32 0
	%vtpm.321 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.320
	%vtpm.322 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.321, i32 0, i32 12
	%vtpm.323 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.322
	%vtpm.324 = call i32(%Razz* )%vtpm.323( %Razz* %vtpm.318 )
	%vtpm.325 = add i32 %vtpm.317, %vtpm.324
	%vtpm.326 = load %Razz*, %Razz** %vtpm.212
	%vtpm.327 = icmp eq %Razz* %vtpm.326, null
	br i1 %vtpm.327, label %abort, label %ok.12

ok.12:
	%vtpm.328 = getelementptr %Razz, %Razz* %vtpm.326, i32 0, i32 0
	%vtpm.329 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.328
	%vtpm.330 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.329, i32 0, i32 11
	%vtpm.331 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.330
	%vtpm.332 = call i32(%Razz* )%vtpm.331( %Razz* %vtpm.326 )
	%vtpm.333 = add i32 %vtpm.325, %vtpm.332
	%vtpm.334 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 5
	store i32 %vtpm.333, i32* %vtpm.334
	%vtpm.335 = load %Razz*, %Razz** %vtpm.212
	%tmp.7 = icmp eq %Razz* %vtpm.335, null
	br i1 %tmp.7, label %abort, label %ok.13

ok.13:
	%vtpm.336 = getelementptr %Razz, %Razz* %vtpm.335, i32 0, i32 0
	%vtpm.337 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.336
	%vtpm.338 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.337, i32 0, i32 0
	%vtpm.339 = load i32, i32* %vtpm.338
	br label %case.hdr.2

case.hdr.2:
	br label %case.8.2

case.8.2:
	%vtpm.340 = icmp slt i32 %vtpm.339, 8
	br i1 %vtpm.340, label %br_exit.8.2, label %src_gte_br.8.2

src_gte_br.8.2:
	%vtpm.341 = icmp sgt i32 %vtpm.339, 8
	br i1 %vtpm.341, label %br_exit.8.2, label %src_lte_mc.8.2

src_lte_mc.8.2:
	%vtpm.342 = bitcast %Razz* %vtpm.335 to %Bar*
	store %Bar* %vtpm.342, %Bar** %vtpm.221
	%vtpm.343 = load %Bar*, %Bar** %vtpm.221
	store %Bar* %vtpm.343, %Bar** %tmp.2
	br label %case.exit.2

br_exit.8.2:
	br label %case.7.2

case.7.2:
	%vtpm.344 = icmp slt i32 %vtpm.339, 7
	br i1 %vtpm.344, label %br_exit.7.2, label %src_gte_br.7.2

src_gte_br.7.2:
	%vtpm.345 = icmp sgt i32 %vtpm.339, 8
	br i1 %vtpm.345, label %br_exit.7.2, label %src_lte_mc.7.2

src_lte_mc.7.2:
	store %Razz* %vtpm.335, %Razz** %vtpm.220
	%vtpm.346 = call %Bar* @Bar_new(  )
	%vtpm.347 = icmp eq %Bar* %vtpm.346, null
	br i1 %vtpm.347, label %abort, label %ok.14

ok.14:
	store %Bar* %vtpm.346, %Bar** %tmp.2
	br label %case.exit.2

br_exit.7.2:
	br label %abort

case.exit.2:
	%tmp.8 = load %Bar*, %Bar** %tmp.2
	%vtpm.348 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 6
	store %Bar* %tmp.8, %Bar** %vtpm.348
	%vtpm.349 = load %Razz*, %Razz** %vtpm.212
	%vtpm.350 = getelementptr %Razz, %Razz* %vtpm.349, i32 0, i32 4
	%vtpm.351 = load %Razz*, %Razz** %vtpm.350
	%vtpm.352 = icmp eq %Razz* %vtpm.351, null
	br i1 %vtpm.352, label %abort, label %ok.15

ok.15:
	%vtpm.353 = getelementptr %_Bazz_vtable, %_Bazz_vtable* @_Bazz_vtable_prototype, i32 0, i32 12
	%vtpm.354 = load i32 (%Bazz*) *, i32 (%Bazz*) ** %vtpm.353
	%vtpm.355 = bitcast %Razz* %vtpm.351 to %Bazz*
	%vtpm.356 = call i32(%Bazz* )%vtpm.354( %Bazz* %vtpm.355 )
	%vtpm.357 = load %Razz*, %Razz** %vtpm.212
	%vtpm.358 = getelementptr %Razz, %Razz* %vtpm.357, i32 0, i32 2
	%vtpm.359 = load %Foo*, %Foo** %vtpm.358
	%vtpm.360 = icmp eq %Foo* %vtpm.359, null
	br i1 %vtpm.360, label %abort, label %ok.16

ok.16:
	%vtpm.361 = getelementptr %Foo, %Foo* %vtpm.359, i32 0, i32 0
	%vtpm.362 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.361
	%vtpm.363 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.362, i32 0, i32 12
	%vtpm.364 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.363
	%vtpm.365 = call i32(%Foo* )%vtpm.364( %Foo* %vtpm.359 )
	%vtpm.366 = add i32 %vtpm.356, %vtpm.365
	%vtpm.367 = load %Razz*, %Razz** %vtpm.212
	%vtpm.368 = getelementptr %Razz, %Razz* %vtpm.367, i32 0, i32 6
	%vtpm.369 = load %Bar*, %Bar** %vtpm.368
	%vtpm.370 = icmp eq %Bar* %vtpm.369, null
	br i1 %vtpm.370, label %abort, label %ok.17

ok.17:
	%vtpm.371 = getelementptr %Bar, %Bar* %vtpm.369, i32 0, i32 0
	%vtpm.372 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.371
	%vtpm.373 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.372, i32 0, i32 12
	%vtpm.374 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.373
	%vtpm.375 = call i32(%Bar* )%vtpm.374( %Bar* %vtpm.369 )
	%vtpm.376 = add i32 %vtpm.366, %vtpm.375
	%vtpm.377 = load %Razz*, %Razz** %vtpm.212
	%vtpm.378 = icmp eq %Razz* %vtpm.377, null
	br i1 %vtpm.378, label %abort, label %ok.18

ok.18:
	%vtpm.379 = getelementptr %Razz, %Razz* %vtpm.377, i32 0, i32 0
	%vtpm.380 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.379
	%vtpm.381 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.380, i32 0, i32 12
	%vtpm.382 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.381
	%vtpm.383 = call i32(%Razz* )%vtpm.382( %Razz* %vtpm.377 )
	%vtpm.384 = add i32 %vtpm.376, %vtpm.383
	%vtpm.385 = load %Razz*, %Razz** %vtpm.212
	%vtpm.386 = icmp eq %Razz* %vtpm.385, null
	br i1 %vtpm.386, label %abort, label %ok.19

ok.19:
	%vtpm.387 = getelementptr %Razz, %Razz* %vtpm.385, i32 0, i32 0
	%vtpm.388 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.387
	%vtpm.389 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.388, i32 0, i32 11
	%vtpm.390 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.389
	%vtpm.391 = call i32(%Razz* )%vtpm.390( %Razz* %vtpm.385 )
	%vtpm.392 = add i32 %vtpm.384, %vtpm.391
	%vtpm.393 = getelementptr %Razz, %Razz* %vtpm.225, i32 0, i32 7
	store i32 %vtpm.392, i32* %vtpm.393
	ret %Razz* %vtpm.225

abort:
	call void @abort(  )
	unreachable
}

define %Bar* @Bar_new() {

entry:
	%vtpm.395 = alloca %Bar*
	%tmp.0 = alloca %Foo*
	%vtpm.396 = alloca %Bazz*
	%vtpm.397 = alloca %Razz*
	%vtpm.398 = alloca %Foo*
	%vtpm.399 = alloca %Bar*
	%tmp.1 = alloca %Bar*
	%vtpm.400 = alloca %Razz*
	%vtpm.401 = alloca %Foo*
	%vtpm.402 = alloca %Bar*
	%tmp.2 = alloca %Bar*
	%vtpm.403 = alloca %Razz*
	%vtpm.404 = alloca %Bar*
	%vtpm.405 = getelementptr %_Bar_vtable, %_Bar_vtable* @_Bar_vtable_prototype, i32 0, i32 1
	%vtpm.406 = load i32, i32* %vtpm.405
	%vtpm.407 = call i8*(i32 ) @malloc( i32 %vtpm.406 )
	%vtpm.408 = bitcast i8* %vtpm.407 to %Bar*
	%vtpm.409 = icmp eq %Bar* %vtpm.408, null
	br i1 %vtpm.409, label %abort, label %ok.0

ok.0:
	%vtpm.410 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 0
	store %_Bar_vtable* @_Bar_vtable_prototype, %_Bar_vtable** %vtpm.410
	store %Bar* %vtpm.408, %Bar** %vtpm.395
	%vtpm.411 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 1
	store i32 0, i32* %vtpm.411
	%vtpm.412 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.412
	%vtpm.413 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 3
	store %Object* null, %Object** %vtpm.413
	%vtpm.414 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 4
	store %Razz* null, %Razz** %vtpm.414
	%vtpm.415 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 5
	store i32 0, i32* %vtpm.415
	%vtpm.416 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 6
	store %Bar* null, %Bar** %vtpm.416
	%vtpm.417 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 7
	store i32 0, i32* %vtpm.417
	%vtpm.418 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 8
	store i32 0, i32* %vtpm.418
	%vtpm.419 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 9
	store %Object* null, %Object** %vtpm.419
	%vtpm.420 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 1
	store i32 1, i32* %vtpm.420
	%vtpm.421 = load %Bar*, %Bar** %vtpm.395
	%tmp.3 = icmp eq %Bar* %vtpm.421, null
	br i1 %tmp.3, label %abort, label %ok.1

ok.1:
	%vtpm.422 = getelementptr %Bar, %Bar* %vtpm.421, i32 0, i32 0
	%vtpm.423 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.422
	%vtpm.424 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.423, i32 0, i32 0
	%vtpm.425 = load i32, i32* %vtpm.424
	br label %case.hdr.0

case.hdr.0:
	br label %case.8.0

case.8.0:
	%vtpm.426 = icmp slt i32 %vtpm.425, 8
	br i1 %vtpm.426, label %br_exit.8.0, label %src_gte_br.8.0

src_gte_br.8.0:
	%vtpm.427 = icmp sgt i32 %vtpm.425, 8
	br i1 %vtpm.427, label %br_exit.8.0, label %src_lte_mc.8.0

src_lte_mc.8.0:
	store %Bar* %vtpm.421, %Bar** %vtpm.399
	%vtpm.428 = load %Bar*, %Bar** %vtpm.399
	%vtpm.429 = bitcast %Bar* %vtpm.428 to %Foo*
	store %Foo* %vtpm.429, %Foo** %tmp.0
	br label %case.exit.0

br_exit.8.0:
	br label %case.7.0

case.7.0:
	%vtpm.430 = icmp slt i32 %vtpm.425, 7
	br i1 %vtpm.430, label %br_exit.7.0, label %src_gte_br.7.0

src_gte_br.7.0:
	%vtpm.431 = icmp sgt i32 %vtpm.425, 8
	br i1 %vtpm.431, label %br_exit.7.0, label %src_lte_mc.7.0

src_lte_mc.7.0:
	%vtpm.432 = bitcast %Bar* %vtpm.421 to %Razz*
	store %Razz* %vtpm.432, %Razz** %vtpm.397
	%vtpm.433 = call %Bar* @Bar_new(  )
	%vtpm.434 = icmp eq %Bar* %vtpm.433, null
	br i1 %vtpm.434, label %abort, label %ok.2

ok.2:
	%vtpm.435 = bitcast %Bar* %vtpm.433 to %Foo*
	store %Foo* %vtpm.435, %Foo** %tmp.0
	br label %case.exit.0

br_exit.7.0:
	br label %case.6.0

case.6.0:
	%vtpm.436 = icmp slt i32 %vtpm.425, 6
	br i1 %vtpm.436, label %br_exit.6.0, label %src_gte_br.6.0

src_gte_br.6.0:
	%vtpm.437 = icmp sgt i32 %vtpm.425, 8
	br i1 %vtpm.437, label %br_exit.6.0, label %src_lte_mc.6.0

src_lte_mc.6.0:
	%vtpm.438 = bitcast %Bar* %vtpm.421 to %Foo*
	store %Foo* %vtpm.438, %Foo** %vtpm.398
	%vtpm.439 = call %Razz* @Razz_new(  )
	%vtpm.440 = icmp eq %Razz* %vtpm.439, null
	br i1 %vtpm.440, label %abort, label %ok.3

ok.3:
	%vtpm.441 = bitcast %Razz* %vtpm.439 to %Foo*
	store %Foo* %vtpm.441, %Foo** %tmp.0
	br label %case.exit.0

br_exit.6.0:
	br label %case.5.0

case.5.0:
	%vtpm.442 = icmp slt i32 %vtpm.425, 5
	br i1 %vtpm.442, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.443 = icmp sgt i32 %vtpm.425, 8
	br i1 %vtpm.443, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	%vtpm.444 = bitcast %Bar* %vtpm.421 to %Bazz*
	store %Bazz* %vtpm.444, %Bazz** %vtpm.396
	%vtpm.445 = call %Foo* @Foo_new(  )
	%vtpm.446 = icmp eq %Foo* %vtpm.445, null
	br i1 %vtpm.446, label %abort, label %ok.4

ok.4:
	store %Foo* %vtpm.445, %Foo** %tmp.0
	br label %case.exit.0

br_exit.5.0:
	br label %abort

case.exit.0:
	%tmp.4 = load %Foo*, %Foo** %tmp.0
	%vtpm.447 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 2
	store %Foo* %tmp.4, %Foo** %vtpm.447
	%vtpm.448 = load %Bar*, %Bar** %vtpm.395
	%vtpm.449 = icmp eq %Bar* %vtpm.448, null
	br i1 %vtpm.449, label %abort, label %ok.5

ok.5:
	%vtpm.450 = getelementptr %Bar, %Bar* %vtpm.448, i32 0, i32 0
	%vtpm.451 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.450
	%vtpm.452 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.451, i32 0, i32 11
	%vtpm.453 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.452
	%vtpm.454 = call i32(%Bar* )%vtpm.453( %Bar* %vtpm.448 )
	%vtpm.455 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 3
	%vtpm.456 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.456, i32 %vtpm.454 )
	%vtpm.458 = bitcast %Int* %vtpm.456 to %Object*
	store %Object* %vtpm.458, %Object** %vtpm.455
	%vtpm.459 = load %Bar*, %Bar** %vtpm.395
	%tmp.5 = icmp eq %Bar* %vtpm.459, null
	br i1 %tmp.5, label %abort, label %ok.6

ok.6:
	%vtpm.460 = getelementptr %Bar, %Bar* %vtpm.459, i32 0, i32 0
	%vtpm.461 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.460
	%vtpm.462 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.461, i32 0, i32 0
	%vtpm.463 = load i32, i32* %vtpm.462
	br label %case.hdr.1

case.hdr.1:
	br label %case.8.1

case.8.1:
	%vtpm.464 = icmp slt i32 %vtpm.463, 8
	br i1 %vtpm.464, label %br_exit.8.1, label %src_gte_br.8.1

src_gte_br.8.1:
	%vtpm.465 = icmp sgt i32 %vtpm.463, 8
	br i1 %vtpm.465, label %br_exit.8.1, label %src_lte_mc.8.1

src_lte_mc.8.1:
	store %Bar* %vtpm.459, %Bar** %vtpm.402
	%vtpm.466 = load %Bar*, %Bar** %vtpm.402
	%vtpm.467 = bitcast %Bar* %vtpm.466 to %Razz*
	%vtpm.468 = bitcast %Razz* %vtpm.467 to %Bar*
	store %Bar* %vtpm.468, %Bar** %tmp.1
	br label %case.exit.1

br_exit.8.1:
	br label %case.7.1

case.7.1:
	%vtpm.469 = icmp slt i32 %vtpm.463, 7
	br i1 %vtpm.469, label %br_exit.7.1, label %src_gte_br.7.1

src_gte_br.7.1:
	%vtpm.470 = icmp sgt i32 %vtpm.463, 8
	br i1 %vtpm.470, label %br_exit.7.1, label %src_lte_mc.7.1

src_lte_mc.7.1:
	%vtpm.471 = bitcast %Bar* %vtpm.459 to %Razz*
	store %Razz* %vtpm.471, %Razz** %vtpm.400
	%vtpm.472 = call %Bar* @Bar_new(  )
	%vtpm.473 = icmp eq %Bar* %vtpm.472, null
	br i1 %vtpm.473, label %abort, label %ok.7

ok.7:
	%vtpm.474 = bitcast %Bar* %vtpm.472 to %Razz*
	%vtpm.475 = bitcast %Razz* %vtpm.474 to %Bar*
	store %Bar* %vtpm.475, %Bar** %tmp.1
	br label %case.exit.1

br_exit.7.1:
	br label %case.6.1

case.6.1:
	%vtpm.476 = icmp slt i32 %vtpm.463, 6
	br i1 %vtpm.476, label %br_exit.6.1, label %src_gte_br.6.1

src_gte_br.6.1:
	%vtpm.477 = icmp sgt i32 %vtpm.463, 8
	br i1 %vtpm.477, label %br_exit.6.1, label %src_lte_mc.6.1

src_lte_mc.6.1:
	%vtpm.478 = bitcast %Bar* %vtpm.459 to %Foo*
	store %Foo* %vtpm.478, %Foo** %vtpm.401
	%vtpm.479 = call %Razz* @Razz_new(  )
	%vtpm.480 = icmp eq %Razz* %vtpm.479, null
	br i1 %vtpm.480, label %abort, label %ok.8

ok.8:
	%vtpm.481 = bitcast %Razz* %vtpm.479 to %Bar*
	store %Bar* %vtpm.481, %Bar** %tmp.1
	br label %case.exit.1

br_exit.6.1:
	br label %abort

case.exit.1:
	%tmp.6 = load %Bar*, %Bar** %tmp.1
	%vtpm.482 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 4
	%vtpm.483 = bitcast %Bar* %tmp.6 to %Razz*
	store %Razz* %vtpm.483, %Razz** %vtpm.482
	%vtpm.484 = load %Bar*, %Bar** %vtpm.395
	%vtpm.485 = getelementptr %Bar, %Bar* %vtpm.484, i32 0, i32 4
	%vtpm.486 = load %Razz*, %Razz** %vtpm.485
	%vtpm.487 = icmp eq %Razz* %vtpm.486, null
	br i1 %vtpm.487, label %abort, label %ok.9

ok.9:
	%vtpm.488 = getelementptr %Razz, %Razz* %vtpm.486, i32 0, i32 0
	%vtpm.489 = load %_Razz_vtable*, %_Razz_vtable** %vtpm.488
	%vtpm.490 = getelementptr %_Razz_vtable, %_Razz_vtable* %vtpm.489, i32 0, i32 12
	%vtpm.491 = load i32 (%Razz*) *, i32 (%Razz*) ** %vtpm.490
	%vtpm.492 = call i32(%Razz* )%vtpm.491( %Razz* %vtpm.486 )
	%vtpm.493 = load %Bar*, %Bar** %vtpm.395
	%vtpm.494 = getelementptr %Bar, %Bar* %vtpm.493, i32 0, i32 2
	%vtpm.495 = load %Foo*, %Foo** %vtpm.494
	%vtpm.496 = icmp eq %Foo* %vtpm.495, null
	br i1 %vtpm.496, label %abort, label %ok.10

ok.10:
	%vtpm.497 = getelementptr %Foo, %Foo* %vtpm.495, i32 0, i32 0
	%vtpm.498 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.497
	%vtpm.499 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.498, i32 0, i32 12
	%vtpm.500 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.499
	%vtpm.501 = call i32(%Foo* )%vtpm.500( %Foo* %vtpm.495 )
	%vtpm.502 = add i32 %vtpm.492, %vtpm.501
	%vtpm.503 = load %Bar*, %Bar** %vtpm.395
	%vtpm.504 = icmp eq %Bar* %vtpm.503, null
	br i1 %vtpm.504, label %abort, label %ok.11

ok.11:
	%vtpm.505 = getelementptr %Bar, %Bar* %vtpm.503, i32 0, i32 0
	%vtpm.506 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.505
	%vtpm.507 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.506, i32 0, i32 12
	%vtpm.508 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.507
	%vtpm.509 = call i32(%Bar* )%vtpm.508( %Bar* %vtpm.503 )
	%vtpm.510 = add i32 %vtpm.502, %vtpm.509
	%vtpm.511 = load %Bar*, %Bar** %vtpm.395
	%vtpm.512 = icmp eq %Bar* %vtpm.511, null
	br i1 %vtpm.512, label %abort, label %ok.12

ok.12:
	%vtpm.513 = getelementptr %Bar, %Bar* %vtpm.511, i32 0, i32 0
	%vtpm.514 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.513
	%vtpm.515 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.514, i32 0, i32 11
	%vtpm.516 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.515
	%vtpm.517 = call i32(%Bar* )%vtpm.516( %Bar* %vtpm.511 )
	%vtpm.518 = add i32 %vtpm.510, %vtpm.517
	%vtpm.519 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 5
	store i32 %vtpm.518, i32* %vtpm.519
	%vtpm.520 = load %Bar*, %Bar** %vtpm.395
	%tmp.7 = icmp eq %Bar* %vtpm.520, null
	br i1 %tmp.7, label %abort, label %ok.13

ok.13:
	%vtpm.521 = getelementptr %Bar, %Bar* %vtpm.520, i32 0, i32 0
	%vtpm.522 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.521
	%vtpm.523 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.522, i32 0, i32 0
	%vtpm.524 = load i32, i32* %vtpm.523
	br label %case.hdr.2

case.hdr.2:
	br label %case.8.2

case.8.2:
	%vtpm.525 = icmp slt i32 %vtpm.524, 8
	br i1 %vtpm.525, label %br_exit.8.2, label %src_gte_br.8.2

src_gte_br.8.2:
	%vtpm.526 = icmp sgt i32 %vtpm.524, 8
	br i1 %vtpm.526, label %br_exit.8.2, label %src_lte_mc.8.2

src_lte_mc.8.2:
	store %Bar* %vtpm.520, %Bar** %vtpm.404
	%vtpm.527 = load %Bar*, %Bar** %vtpm.404
	store %Bar* %vtpm.527, %Bar** %tmp.2
	br label %case.exit.2

br_exit.8.2:
	br label %case.7.2

case.7.2:
	%vtpm.528 = icmp slt i32 %vtpm.524, 7
	br i1 %vtpm.528, label %br_exit.7.2, label %src_gte_br.7.2

src_gte_br.7.2:
	%vtpm.529 = icmp sgt i32 %vtpm.524, 8
	br i1 %vtpm.529, label %br_exit.7.2, label %src_lte_mc.7.2

src_lte_mc.7.2:
	%vtpm.530 = bitcast %Bar* %vtpm.520 to %Razz*
	store %Razz* %vtpm.530, %Razz** %vtpm.403
	%vtpm.531 = call %Bar* @Bar_new(  )
	%vtpm.532 = icmp eq %Bar* %vtpm.531, null
	br i1 %vtpm.532, label %abort, label %ok.14

ok.14:
	store %Bar* %vtpm.531, %Bar** %tmp.2
	br label %case.exit.2

br_exit.7.2:
	br label %abort

case.exit.2:
	%tmp.8 = load %Bar*, %Bar** %tmp.2
	%vtpm.533 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 6
	store %Bar* %tmp.8, %Bar** %vtpm.533
	%vtpm.534 = load %Bar*, %Bar** %vtpm.395
	%vtpm.535 = getelementptr %Bar, %Bar* %vtpm.534, i32 0, i32 4
	%vtpm.536 = load %Razz*, %Razz** %vtpm.535
	%vtpm.537 = icmp eq %Razz* %vtpm.536, null
	br i1 %vtpm.537, label %abort, label %ok.15

ok.15:
	%vtpm.538 = getelementptr %_Bazz_vtable, %_Bazz_vtable* @_Bazz_vtable_prototype, i32 0, i32 12
	%vtpm.539 = load i32 (%Bazz*) *, i32 (%Bazz*) ** %vtpm.538
	%vtpm.540 = bitcast %Razz* %vtpm.536 to %Bazz*
	%vtpm.541 = call i32(%Bazz* )%vtpm.539( %Bazz* %vtpm.540 )
	%vtpm.542 = load %Bar*, %Bar** %vtpm.395
	%vtpm.543 = getelementptr %Bar, %Bar* %vtpm.542, i32 0, i32 2
	%vtpm.544 = load %Foo*, %Foo** %vtpm.543
	%vtpm.545 = icmp eq %Foo* %vtpm.544, null
	br i1 %vtpm.545, label %abort, label %ok.16

ok.16:
	%vtpm.546 = getelementptr %Foo, %Foo* %vtpm.544, i32 0, i32 0
	%vtpm.547 = load %_Foo_vtable*, %_Foo_vtable** %vtpm.546
	%vtpm.548 = getelementptr %_Foo_vtable, %_Foo_vtable* %vtpm.547, i32 0, i32 12
	%vtpm.549 = load i32 (%Foo*) *, i32 (%Foo*) ** %vtpm.548
	%vtpm.550 = call i32(%Foo* )%vtpm.549( %Foo* %vtpm.544 )
	%vtpm.551 = add i32 %vtpm.541, %vtpm.550
	%vtpm.552 = load %Bar*, %Bar** %vtpm.395
	%vtpm.553 = getelementptr %Bar, %Bar* %vtpm.552, i32 0, i32 6
	%vtpm.554 = load %Bar*, %Bar** %vtpm.553
	%vtpm.555 = icmp eq %Bar* %vtpm.554, null
	br i1 %vtpm.555, label %abort, label %ok.17

ok.17:
	%vtpm.556 = getelementptr %Bar, %Bar* %vtpm.554, i32 0, i32 0
	%vtpm.557 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.556
	%vtpm.558 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.557, i32 0, i32 12
	%vtpm.559 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.558
	%vtpm.560 = call i32(%Bar* )%vtpm.559( %Bar* %vtpm.554 )
	%vtpm.561 = add i32 %vtpm.551, %vtpm.560
	%vtpm.562 = load %Bar*, %Bar** %vtpm.395
	%vtpm.563 = icmp eq %Bar* %vtpm.562, null
	br i1 %vtpm.563, label %abort, label %ok.18

ok.18:
	%vtpm.564 = getelementptr %Bar, %Bar* %vtpm.562, i32 0, i32 0
	%vtpm.565 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.564
	%vtpm.566 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.565, i32 0, i32 12
	%vtpm.567 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.566
	%vtpm.568 = call i32(%Bar* )%vtpm.567( %Bar* %vtpm.562 )
	%vtpm.569 = add i32 %vtpm.561, %vtpm.568
	%vtpm.570 = load %Bar*, %Bar** %vtpm.395
	%vtpm.571 = icmp eq %Bar* %vtpm.570, null
	br i1 %vtpm.571, label %abort, label %ok.19

ok.19:
	%vtpm.572 = getelementptr %Bar, %Bar* %vtpm.570, i32 0, i32 0
	%vtpm.573 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.572
	%vtpm.574 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.573, i32 0, i32 11
	%vtpm.575 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.574
	%vtpm.576 = call i32(%Bar* )%vtpm.575( %Bar* %vtpm.570 )
	%vtpm.577 = add i32 %vtpm.569, %vtpm.576
	%vtpm.578 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 7
	store i32 %vtpm.577, i32* %vtpm.578
	%vtpm.579 = load %Bar*, %Bar** %vtpm.395
	%vtpm.580 = icmp eq %Bar* %vtpm.579, null
	br i1 %vtpm.580, label %abort, label %ok.20

ok.20:
	%vtpm.581 = getelementptr %Bar, %Bar* %vtpm.579, i32 0, i32 0
	%vtpm.582 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.581
	%vtpm.583 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.582, i32 0, i32 12
	%vtpm.584 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.583
	%vtpm.585 = call i32(%Bar* )%vtpm.584( %Bar* %vtpm.579 )
	%vtpm.586 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 8
	store i32 %vtpm.585, i32* %vtpm.586
	%vtpm.587 = load %Bar*, %Bar** %vtpm.395
	%vtpm.588 = icmp eq %Bar* %vtpm.587, null
	br i1 %vtpm.588, label %abort, label %ok.21

ok.21:
	%vtpm.589 = getelementptr %Bar, %Bar* %vtpm.587, i32 0, i32 0
	%vtpm.590 = load %_Bar_vtable*, %_Bar_vtable** %vtpm.589
	%vtpm.591 = getelementptr %_Bar_vtable, %_Bar_vtable* %vtpm.590, i32 0, i32 11
	%vtpm.592 = load i32 (%Bar*) *, i32 (%Bar*) ** %vtpm.591
	%vtpm.593 = call i32(%Bar* )%vtpm.592( %Bar* %vtpm.587 )
	%vtpm.594 = getelementptr %Bar, %Bar* %vtpm.408, i32 0, i32 9
	%vtpm.595 = call %Int* @Int_new(  )
	call void(%Int*, i32 ) @Int_init( %Int* %vtpm.595, i32 %vtpm.593 )
	%vtpm.597 = bitcast %Int* %vtpm.595 to %Object*
	store %Object* %vtpm.597, %Object** %vtpm.594
	ret %Bar* %vtpm.408

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main.main(%Main* %self) {

entry:
	%vtpm.599 = alloca %Main*
	store %Main* %self, %Main** %vtpm.599
	ret %String* @String.1

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.601 = alloca %Main*
	%vtpm.602 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.603 = load i32, i32* %vtpm.602
	%vtpm.604 = call i8*(i32 ) @malloc( i32 %vtpm.603 )
	%vtpm.605 = bitcast i8* %vtpm.604 to %Main*
	%vtpm.606 = icmp eq %Main* %vtpm.605, null
	br i1 %vtpm.606, label %abort, label %ok.0

ok.0:
	%vtpm.607 = getelementptr %Main, %Main* %vtpm.605, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.607
	store %Main* %vtpm.605, %Main** %vtpm.601
	%vtpm.608 = getelementptr %Main, %Main* %vtpm.605, i32 0, i32 1
	store %Bazz* null, %Bazz** %vtpm.608
	%vtpm.609 = getelementptr %Main, %Main* %vtpm.605, i32 0, i32 2
	store %Foo* null, %Foo** %vtpm.609
	%vtpm.610 = getelementptr %Main, %Main* %vtpm.605, i32 0, i32 3
	store %Razz* null, %Razz** %vtpm.610
	%vtpm.611 = getelementptr %Main, %Main* %vtpm.605, i32 0, i32 4
	store %Bar* null, %Bar** %vtpm.611
	%vtpm.612 = call %Bazz* @Bazz_new(  )
	%vtpm.613 = icmp eq %Bazz* %vtpm.612, null
	br i1 %vtpm.613, label %abort, label %ok.1

ok.1:
	%vtpm.614 = getelementptr %Main, %Main* %vtpm.605, i32 0, i32 1
	store %Bazz* %vtpm.612, %Bazz** %vtpm.614
	%vtpm.615 = call %Foo* @Foo_new(  )
	%vtpm.616 = icmp eq %Foo* %vtpm.615, null
	br i1 %vtpm.616, label %abort, label %ok.2

ok.2:
	%vtpm.617 = getelementptr %Main, %Main* %vtpm.605, i32 0, i32 2
	store %Foo* %vtpm.615, %Foo** %vtpm.617
	%vtpm.618 = call %Razz* @Razz_new(  )
	%vtpm.619 = icmp eq %Razz* %vtpm.618, null
	br i1 %vtpm.619, label %abort, label %ok.3

ok.3:
	%vtpm.620 = getelementptr %Main, %Main* %vtpm.605, i32 0, i32 3
	store %Razz* %vtpm.618, %Razz** %vtpm.620
	%vtpm.621 = call %Bar* @Bar_new(  )
	%vtpm.622 = icmp eq %Bar* %vtpm.621, null
	br i1 %vtpm.622, label %abort, label %ok.4

ok.4:
	%vtpm.623 = getelementptr %Main, %Main* %vtpm.605, i32 0, i32 4
	store %Bar* %vtpm.621, %Bar** %vtpm.623
	ret %Main* %vtpm.605

abort:
	call void @abort(  )
	unreachable
}

