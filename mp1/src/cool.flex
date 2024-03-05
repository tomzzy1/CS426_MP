/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
  if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
    YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;

extern YYSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */
#include <cstring>
using std::memcpy;

int comment_depth;
bool string_error;

%}

%option noyywrap

%x string
%x comment

/*
 * Define names for regular expressions here.
 */
/* make keyword case insensitive */
digit       [0-9]
id          [0-9a-zA-Z]|"_"
whitespace  [ \f\r\t\v]
class       [Cc][Ll][Aa][Ss][Ss]
else        [Ee][Ll][Ss][Ee]
fi          [Ff][Ii]
if          [Ii][Ff]
in          [Ii][Nn]
inherits    [Ii][Nn][Hh][Ee][Rr][Ii][Tt][Ss]
isvoid      [Ii][Ss][Vv][Oo][Ii][Dd]
let         [Ll][Ee][Tt]
loop        [Ll][Oo][Oo][Pp]
pool        [Pp][Oo][Oo][Ll]
then        [Tt][Hh][Ee][Nn]
while       [Ww][Hh][Ii][Ll][Ee]
case        [Cc][Aa][Ss][Ee]
esac        [Ee][Ss][Aa][Cc]
new         [Nn][Ee][Ww]
of          [Oo][Ff]
not         [Nn][Oo][Tt]
true        t[Rr][Uu][Ee]
false       f[Aa][Ll][Ss][Ee]

%%

 /*
  * Define regular expressions for the tokens of COOL here. Make sure, you
  * handle correctly special cases, like:
  *   - Nested comments
  *   - String constants: They use C like systax and can contain escape
  *     sequences. Escape sequence \c is accepted for all characters c. Except
  *     for \n \t \b \f, the result is c.
  *   - Keywords: They are case-insensitive except for the values true and
  *     false, which must begin with a lower-case letter.
  *   - Multiple-character operators (like <-): The scanner should produce a
  *     single token for every such operator.
  *   - Line counting: You should keep the global variable curr_lineno updated
  *     with the correct line number
  */
{whitespace}+
"\n" {
  curr_lineno++;
}
{digit}+  {
  auto entry = inttable.add_string(yytext);
  //auto entry = inttable.add_int(atoi(yytext));
  cool_yylval.symbol = entry;
  return INT_CONST;
}
{class}   {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return CLASS;
}
{else} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return ELSE;
}
{fi} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return FI;
}
{if} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return IF;
}
{in} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return IN;
}
{inherits} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return INHERITS;
}
{isvoid} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return ISVOID;
}
{let} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return LET;
}
{loop} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return LOOP;
}
{pool} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return POOL;
}
{then} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return THEN;
}
{while} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return WHILE;
}
{case} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return CASE;
}
{esac} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return ESAC;
}
{new} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return NEW;
}
{of} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return OF;
}
{not} {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return NOT;
}
{true} {
  cool_yylval.boolean = true;
  return BOOL_CONST;
}
{false} {
  cool_yylval.boolean = false;
  return BOOL_CONST;
}
"<-" {
  return ASSIGN;
}
"=>" {
  return DARROW;
}
"<=" {
  return LE;
}
[A-Z]{id}* {
  auto entry = idtable.add_string(yytext);
  //printf("ID: %s\n", yytext);
  cool_yylval.symbol = entry;
  return TYPEID;
}
[a-z]{id}* {
  auto entry = idtable.add_string(yytext);
  cool_yylval.symbol = entry;
  return OBJECTID;
}
"+"|"/"|"-"|"*"|"="|"<"|"."|"~"|","|";"|":"|"("|")"|"@"|"{"|"}" {
  return *yytext;
}

"\"" {
  BEGIN(string);
  string_error = false;
  string_buf_ptr = string_buf;
}

"(*" {
  BEGIN(comment);
  //printf("begin comment\n");
  comment_depth = 1;
}

"*)" {
  cool_yylval.error_msg = "Unmatched *)";
  return ERROR;
}

"--".*"\n" { ++curr_lineno; } /* match normal comment since it's longer */
"--".* {  } /*match EOF*/

<string>[^\\\"\n\0]+ {
  //printf("copy str\n");
  if (string_buf_ptr - string_buf + yyleng < MAX_STR_CONST)
  {
    memcpy(string_buf_ptr, yytext, yyleng);
    string_buf_ptr += yyleng;
  }
  else
  {
    cool_yylval.error_msg = "String constant too long";
    string_error = true;
    //return ERROR;
  }
}

<string>"\n" {
  cool_yylval.error_msg = "Unterminated string constant";
  ++curr_lineno;
  BEGIN(0);
  return ERROR;
}

<string>"\0" {
  cool_yylval.error_msg = "\0 in string constant";
  BEGIN(0);
  return ERROR;
}

<string><<EOF>> {
  cool_yylval.error_msg = "EOF in string constant";
  BEGIN(0);
  return ERROR;
}

<string>"\\"(.|"\n") {
  //printf("process escape\n");
  //printf("%x abc", *(yytext + 1));
  if (*(yytext + 1) == 'b')
  {
    *string_buf_ptr = '\b';
    ++string_buf_ptr;
  }
  else if (*(yytext + 1) == 't')
  {
    *string_buf_ptr = '\t';
    ++string_buf_ptr;
  }
  else if (*(yytext + 1) == 'n')
  {
    *string_buf_ptr = '\n';
    //printf("meet a escaped newline");
    ++string_buf_ptr;
  }
  else if (*(yytext + 1) == 'f')
  {
    *string_buf_ptr = '\f';
    ++string_buf_ptr;
  }
  else if (*(yytext + 1) == '\n')
  {
    //printf("meet a newline");
    *string_buf_ptr = '\n';
    ++string_buf_ptr;
    ++curr_lineno;
  }
  else
  {
    *string_buf_ptr = *(yytext + 1);
    ++string_buf_ptr;
    //printf("else");
  }
  if (string_buf_ptr - string_buf >= MAX_STR_CONST)
  {
    cool_yylval.error_msg = "String constant too long";
    string_error = true;
    //return ERROR;
  }
} 

<string>"\"" {
  //printf("string length: %d", string_buf_ptr - string_buf);
  if (!string_error) // don't produce string if erorr 
  {
    auto entry = stringtable.add_string(string_buf, string_buf_ptr - string_buf);
    cool_yylval.symbol = entry;
    BEGIN(0);
    return STR_CONST;
  }
  else
  {
    BEGIN(0);
    return ERROR;
  }

}

<comment>[^(*\n]+
<comment>"*"[^)*\n]*
<comment>"("[^*\n]*
<comment>"\n" {
  ++curr_lineno;
}
<comment>"(*" {
  ++comment_depth;
}
<comment>"*)" {
  --comment_depth;
  if (comment_depth == 0)
  BEGIN(0);
}
<comment><<EOF>> {
  cool_yylval.error_msg = "EOF in comment";
  BEGIN(0);
  return ERROR;
}

<INITIAL,comment>. {
  cool_yylval.error_msg = yytext;
  return ERROR;
}
<string>. {
  cool_yylval.error_msg = yytext;
  string_error = true;
  //return ERROR;
}
%%
