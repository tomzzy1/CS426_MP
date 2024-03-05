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
@str.Object = internal constant [7 x i8] c"Object\00", align 1
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

@str.Int = internal constant [4 x i8] c"Int\00", align 1
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

@str.Bool = internal constant [5 x i8] c"Bool\00", align 1
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

@str.String = internal constant [7 x i8] c"String\00", align 1
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

@str.IO = internal constant [3 x i8] c"IO\00", align 1
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

@str.Main = internal constant [5 x i8] c"Main\00", align 1
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
	%Object* (%Main*) * @Main.main
}

@str.1 = internal constant [14 x i8] c"<basic class>\00", align 1
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [9 x i8] c"test2.cl\00", align 1
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([9 x i8], [9 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {
entry:
	%main.obj = call %Main*() @Main_new( )
	%main.retval = call %Object*(%Main*) @Main.main( %Main* %main.obj )
	ret i32 0
}

define %Object* @Main.main(%Main* %self) {

entry:
	%tmp.1 = alloca i32
	%tmp.2 = alloca i32
	%tmp.3 = alloca i32
	%tmp.4 = alloca i32
	%tmp.5 = alloca i32
	%tmp.6 = alloca i32
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	store i32 0, i32* %tmp.1
	store i32 0, i32* %tmp.2
	store i32 0, i32* %tmp.3
	store i32 10, i32* %tmp.4
	store i32 20, i32* %tmp.5
	%tmp.7 = load i32, i32* %tmp.4
	%tmp.8 = load i32, i32* %tmp.5
	%tmp.9 = icmp slt i32 %tmp.7, %tmp.8
	br i1 %tmp.9, label %true.0, label %false.0

true.0:
	%tmp.10 = load i32, i32* %tmp.5
	store i32 %tmp.10, i32* %tmp.4
	store i32 %tmp.10, i32* %tmp.6
	br label %end.0

false.0:
	%tmp.11 = load i32, i32* %tmp.4
	store i32 %tmp.11, i32* %tmp.5
	store i32 %tmp.11, i32* %tmp.6
	br label %end.0

end.0:
	%tmp.12 = load i32, i32* %tmp.6
	br label %loop.1

loop.1:
	%tmp.13 = load i32, i32* %tmp.1
	%tmp.14 = icmp slt i32 %tmp.13, 100
	br i1 %tmp.14, label %true.1, label %false.1

true.1:
	%tmp.15 = load i32, i32* %tmp.4
	%tmp.16 = load i32, i32* %tmp.5
	%tmp.17 = mul i32 %tmp.15, %tmp.16
	store i32 %tmp.17, i32* %tmp.2
	%tmp.18 = load i32, i32* %tmp.2
	%tmp.19 = load i32, i32* %tmp.1
	%tmp.20 = mul i32 %tmp.18, %tmp.19
	store i32 %tmp.20, i32* %tmp.3
	%tmp.21 = load i32, i32* %tmp.3
	%tmp.22 = add i32 %tmp.21, 1
	store i32 %tmp.22, i32* %tmp.2
	%tmp.23 = load i32, i32* %tmp.1
	%tmp.24 = add i32 %tmp.23, 1
	store i32 %tmp.24, i32* %tmp.1
	br label %loop.1

false.1:
	%tmp.25 = load %Main*, %Main** %tmp.0
	%tmp.26 = bitcast %Main* %tmp.25 to %Object*
	ret %Object* %tmp.26

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.27 = alloca %Main*
	%tmp.28 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%tmp.29 = load i32, i32* %tmp.28
	%tmp.30 = call i8*(i32) @malloc( i32 %tmp.29 )
	%tmp.31 = bitcast i8* %tmp.30 to %Main*
	%malloc.null = icmp eq %Main* %tmp.31, null
	br i1 %malloc.null, label %abort, label %okay

okay:
	%tmp.32 = getelementptr %Main, %Main* %tmp.31, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %tmp.32
	store %Main* %tmp.31, %Main** %tmp.27
	ret %Main* %tmp.31

abort:
	call void @abort(  )
	unreachable
}

