class CSXToken
{
int linenum;
int colnum;

CSXToken()
{

<<<<<<< HEAD
}

CSXToken(int line,int col)
{
linenum = line;
colnum = col;
}

CSXToken(Position p)
{
linenum = p.linenum;
colnum = p.colnum;

}

}

class CSXIntLitToken extends CSXToken
{
int intValue;
CSXIntLitToken(int val, Position p)
{
super(p);
intValue=val;
}
}

class CSXFloatLitToken extends CSXToken
{
float floatValue;
CSXFloatLitToken(float val, Position p)
{
super(p);
floatValue = val;
}
}

class CSXIdentifierToken extends CSXToken
{
String identifierValue;
CSXIdentifierToken(String val, Position p)
{
super(p);
identifierValue = val;
}

}

class CSXCharLitToken extends CSXToken
{
char charValue;
CSXCharLitToken(char val, Position p)
{
super(p);
charValue = val;
}
}

class CSXStringLitToken extends CSXToken
{
String stringValue;
CSXStringLitToken(String val, Position p)
{
super(p);
stringValue = val;
}
}

class CSXErrorToken extends CSXToken
{
String error;
CSXErrorToken(String errorMessage, Position p)
{
super(p);
error = errorMessage;
}
}

class CSXEOFToken extends CSXToken
{
String error;
CSXEOFToken(int line, int col)
{
super(line, col);
}

CSXEOFToken(String errorMessage, Position p)
{
super(p);
error = errorMessage;
}
=======
	}
	
	CSXToken(int line,int col) 
	{
		linenum = line;
		colnum = col;
	}
	
	CSXToken(Position p) 
	{
		linenum = p.linenum;
		colnum = p.colnum;
		
	}

}

class CSXIntLitToken extends CSXToken
{
	int intValue;
	CSXIntLitToken(int val, Position p) 
	{
	   super(p);
	   intValue=val; 
	}
}

class CSXFloatLitToken extends CSXToken
{
	float floatValue;
	CSXFloatLitToken(float val, Position p)
	{
		super(p);
		floatValue = val;
	}
}

class CSXIdentifierToken extends CSXToken
{
	String identifierValue;
	CSXIdentifierToken(String val, Position p)
	{
		super(p);
		identifierValue = val;
	}
	
}

class CSXCharLitToken extends CSXToken
{
	char charValue;
	CSXCharLitToken(char val, Position p)
	{
		super(p);
		charValue = val;
	}
}

class CSXStringLitToken extends CSXToken
{
	String stringValue;
	CSXStringLitToken(String val, Position p)
	{
		super(p);
		stringValue = val;
	}
>>>>>>> origin/master
}

class CSXErrorToken extends CSXToken
{
	String error;
	CSXErrorToken(String errorMessage, Position p)
	{
		super(p);
		error = errorMessage;
	}
}

class CSXEOFToken extends CSXToken
{
	String error;
	CSXEOFToken(int line, int col)
	{
		super(line, col);
	}
	
	CSXEOFToken(String errorMessage, Position p)
	{
		super(p);
		error = errorMessage;
	}
}

// This class is used to track line and column numbers
// Feel free to change to extend it
class Position
{
<<<<<<< HEAD
int  linenum; 			/* maintain this as line number current
token was scanned on */
int  colnum; 			/* maintain this as column number current
token began at */
int  line; 				/* maintain this as line number after
scanning current token  */
int  col; 				/* maintain this as column number after
scanning current token  */
Position()
{
linenum = 1;
colnum = 1;
line = 1;
col = 1;
}
void setpos()
{ // set starting position for current token
linenum = line;
colnum = col;
}
=======
	int  linenum; 			/* maintain this as line number current
                                 		   token was scanned on */
	int  colnum; 			/* maintain this as column number current
                                 		   token began at */
	int  line; 				/* maintain this as line number after
										   scanning current token  */
	int  col; 				/* maintain this as column number after
										   scanning current token  */
	Position()
	{
  		linenum = 1; 	
  		colnum = 1; 	
  		line = 1;  
  		col = 1;
	}
	void setpos() 
	{ // set starting position for current token
		linenum = line;
		colnum = col;
	}
>>>>>>> origin/master
} ;


//This class is used by the scanner to return token information that is useful for the parser
//This class will be replaced in our parser project by the java_cup.runtime.Symbol class
class Symbol
<<<<<<< HEAD
{
public int sym;
public CSXToken value;
public Symbol(int tokenType, CSXToken theToken)
{
sym = tokenType;
value = theToken;
}
=======
{ 
	public int sym;
	public CSXToken value;
	public Symbol(int tokenType, CSXToken theToken)
	{
		sym = tokenType;
		value = theToken;
	}
>>>>>>> origin/master
}

%%



BLOCKCOMMENT = [#][#]{ANYTHING}+[#][#]
SINGLELINECOMMENT = [/][/]{ANYTHING}+[$]



DIGIT=[0-9]
STRLIT = \"([^\" \\ ]|\\n|\\t|\\\"|\\\\)*\"		// to be fixed
IDENTIFIER = ([a-zA-Z][_0-9]?)+
FLOAT = [fF][lL][oO][aA][tT]
WHILE = [wW][hH][iI][lL][eE]
BOOL = [bB][oO][oO][lL]
CONTINUE = [cC][oO][nN][tT][iI][nN][uU][eE]
FALSE = [fF][aA][lL][sS][eE]
TRUE = [tT][rR][uU][eE]
VOID = [vV][oO][iI][dD]
PRINT = [pP][rR][iI][nN][tT]
IF = [iI][fF]

<<<<<<< HEAD
BREAK = [Bb][Rr][Ee][Aa][Kk]
CHAR = [Cc][Hh][Aa][Rr]

CHARLIT = [']([a-zA-Z]|([\\][nNtTrR\'\"\\]))[']

RETURN = [Rr][Ee][Tt][Uu][Rr][Nn]
CLASS = [Cc][Ll][Aa][Ss][Ss]
INT = [Ii][Nn][Tt]
READ = [Rr][Ee][Aa][Dd]
ELSE = [Ee][Ll][Ss][Ee]
CONST = [Cc][Oo][Nn][Ss][Tt]



RESERVED_WORD = {FLOAT}|{WHILE}|{BOOL}|{CONTINUE}|{FALSE}|{TRUE}|{VOID}|{PRINT}|{BREAK}|{CHAR}|{CLASS}|{RETURN}|{INT}|{READ}|{ELSE}|{CONST}|{IF}

=======
RESERVED_WORD = {FLOAT}|{WHILE}|{BOOL}|{CONTINUE}|{FALSE}|{TRUE}|{VOID}|{PRINT}
>>>>>>> origin/master
ANYTHING = [^\Z]

%states FoundIdentifier
%xstates FoundIncOrDec

%type Symbol

%eofval{

<<<<<<< HEAD
CSXEOFToken token = new CSXEOFToken(0,0);

if(yystate() == FoundIncOrDec)
{
token.error = "Could not find identifier after Increment or Decrement before end of file.";
}

return new Symbol(sym.EOF, token);

=======
	CSXEOFToken token = new CSXEOFToken(0,0);
	
	if(yystate() == FoundIncOrDec)
	{
		token.error = "Could not find identifier after Increment or Decrement before end of file.";
	}
	
	return new Symbol(sym.EOF, token);
	
>>>>>>> origin/master
%eofval}

%{
Position Pos = new Position();
%}

%%
/***********************************************************************
Tokens for the CSX language are defined here using regular expressions
************************************************************************/
<<<<<<< HEAD

"||"
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.COR,
new CSXToken(Pos));
}

"&&"
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.CAND,
new CSXToken(Pos));
}

"=="
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.EQ,
new CSXToken(Pos));
}

"="
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.ASG,
new CSXToken(Pos));
}

"+"
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.PLUS,
new CSXToken(Pos));
=======
"+"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.PLUS,
		new CSXToken(Pos));
>>>>>>> origin/master
}

"-"
{
<<<<<<< HEAD
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.MINUS,
new CSXToken(Pos));
=======
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.MINUS,
		new CSXToken(Pos));
>>>>>>> origin/master
}

"!="
{
<<<<<<< HEAD
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.NOTEQ,
new CSXToken(Pos));
=======
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.NOTEQ,
		new CSXToken(Pos));
>>>>>>> origin/master
}

"!"
{
<<<<<<< HEAD
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.NOT,
new CSXToken(Pos));
=======
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.NOT,
		new CSXToken(Pos));
>>>>>>> origin/master
}

";"
{
<<<<<<< HEAD
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.SEMI,
new CSXToken(Pos));
}

":"
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.COLON,
new CSXToken(Pos));
}

{SINGLELINECOMMENT}
{

Pos.setpos();
Pos.col += yytext().length();

return new Symbol(sym.LT,
new CSXStringLitToken(yytext(), Pos));	

}

{BLOCKCOMMENT}
{

Pos.setpos();
Pos.col += yytext().length();

return new Symbol(sym.GT,
new CSXStringLitToken(yytext(), Pos));
	

}



{CHARLIT}
{

Pos.setpos();
Pos.col += yytext().length();

return new Symbol(sym.CHARLIT,
new CSXCharLitToken(yycharat(Pos.col), Pos));
	

=======
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.SEMI,
		new CSXToken(Pos));
>>>>>>> origin/master
}

{DIGIT}+
{
<<<<<<< HEAD

Pos.setpos();
Pos.col += yytext().length();

try{
	return new Symbol(sym.INTLIT,
	new CSXIntLitToken(Integer.parseInt(yytext()), Pos));
	
} catch (NumberFormatException e) {

    System.out.println("Overflow Error");
    System.out.println(e.getMessage());
 
 	return new Symbol(sym.INTLIT,
	new CSXIntLitToken(Integer.MAX_VALUE, Pos));
 }
        
=======
	// This def doesn't check for overflow -- be sure to update it
	Pos.setpos(); 
	Pos.col += yytext().length();
	return new Symbol(sym.INTLIT,
		new CSXIntLitToken(Integer.parseInt(yytext()), Pos));
>>>>>>> origin/master
}

{STRLIT}+
{
<<<<<<< HEAD
Pos.setpos();
Pos.col += yytext().length();

return new Symbol(sym.STRLIT,
new CSXStringLitToken(yytext(), Pos));
}

" "
{
yybegin(YYINITIAL);
Pos.col += 1;
}

\n|(\r\n)
{
yybegin(YYINITIAL);
Pos.line += 1;
Pos.col = 1;
}

{BREAK}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_BREAK,
new CSXToken(Pos));
}

{CHAR}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_CHAR,
new CSXToken(Pos));
}


{RETURN}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_RETURN,
new CSXToken(Pos));
}


{CLASS}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_CLASS,
new CSXToken(Pos));
}


{INT}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_INT,
new CSXToken(Pos));
}

{READ}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_READ,
new CSXToken(Pos));
}

{ELSE}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_ELSE,
new CSXToken(Pos));
}

{CONST}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_CONST,
new CSXToken(Pos));
}


{FLOAT}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_FLOAT,
new CSXToken(Pos));
}

{WHILE}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_WHILE,
new CSXToken(Pos));
}

{BOOL}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_BOOL,
new CSXToken(Pos));
}

{CONTINUE}
{
Pos.setpos();
Pos.col = yytext().length();
return new Symbol(sym.rw_CONTINUE,
new CSXToken(Pos));
}

{FALSE}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_FALSE,
new CSXToken(Pos));
}

{TRUE}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_TRUE,
new CSXToken(Pos));
}

{VOID}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_VOID,
new CSXToken(Pos));
}

{PRINT}
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.rw_PRINT,
new CSXToken(Pos));
}

{IF}
{
Pos.setpos();
Pos.col = yytext().length();
return new Symbol(sym.rw_IF,
new CSXToken(Pos));
}

<FoundIncOrDec> {RESERVED_WORD}
{
Pos.setpos();
Pos.col += yytext().length();
yybegin(YYINITIAL);
return new Symbol(sym.error,
new CSXErrorToken("Found reserved word '" +  yytext() + "' after an Increment or Decrement operator, expected an identifier.", Pos));
}

<FoundIncOrDec> {ANYTHING}
{
Pos.setpos();
Pos.col += yytext().length();
yybegin(YYINITIAL);
return new Symbol(sym.error,
new CSXErrorToken("Found something other than an identifier after an Increment or Decrement operator", Pos));
}

","
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.COMMA,
new CSXToken(Pos));
}

"{"
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.LBRACKET,
new CSXToken(Pos));
}

"}"
{
Pos.setpos();
Pos.col = yytext().length();
return new Symbol(sym.RBRACKET,
new CSXToken(Pos));
}

"["
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.LBRACE,
new CSXToken(Pos));
}

"]"
{
Pos.setpos();
Pos.col = yytext().length();
return new Symbol(sym.RBRACE,
new CSXToken(Pos));
}

"/"
{
Pos.setpos();
Pos.col = yytext().length();
return new Symbol(sym.SLASH,
new CSXToken(Pos));
}

"("
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.LPAREN,
new CSXToken(Pos));
}

")"
{
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.RPAREN,
new CSXToken(Pos));
}

<FoundIdentifier> "++"
{
yybegin(YYINITIAL);
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.INC,
new CSXToken(Pos));
}

"++"
{
yybegin(FoundIncOrDec);
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.INC,
new CSXToken(Pos));
}

<FoundIdentifier> "--"
{
yybegin(YYINITIAL);
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.DEC,
new CSXToken(Pos));
}

"--"
{
yybegin(FoundIncOrDec);
Pos.setpos();
Pos.col += yytext().length();
return new Symbol(sym.DEC,
new CSXToken(Pos));
}

<FoundIncOrDec> {IDENTIFIER}
{
yybegin(FoundIdentifier);
Pos.setpos();
Pos.col += yytext().length();

return new Symbol(sym.IDENTIFIER,
new CSXIdentifierToken(yytext(), Pos));
}

{IDENTIFIER}
{
yybegin(FoundIdentifier);
Pos.setpos();
Pos.col += yytext().length();

return new Symbol(sym.IDENTIFIER,
new CSXIdentifierToken(yytext(), Pos));
=======
	Pos.setpos(); 
	Pos.col += yytext().length();
	
	return new Symbol(sym.STRLIT,
		new CSXStringLitToken(yytext(), Pos));
}

" "
{
	yybegin(YYINITIAL);
	Pos.col += 1;
}

\n|(\r\n)
{
	yybegin(YYINITIAL);
	Pos.line += 1;
	Pos.col = 1;
}

{FLOAT}
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.rw_FLOAT,
		new CSXToken(Pos));
}

{WHILE}
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.rw_WHILE,
		new CSXToken(Pos));
}

{BOOL}
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.rw_BOOL,
		new CSXToken(Pos));
}

{CONTINUE}
{
	Pos.setpos();
	Pos.col = yytext().length();
	return new Symbol(sym.rw_CONTINUE,
		new CSXToken(Pos));
}

{FALSE}
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.rw_FALSE,
		new CSXToken(Pos));
}

{TRUE}
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.rw_TRUE,
		new CSXToken(Pos));
>>>>>>> origin/master
}

{VOID}
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.rw_VOID,
		new CSXToken(Pos));
}

{PRINT}
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.rw_PRINT,
		new CSXToken(Pos));
}

{IF}
{
	Pos.setpos();
	Pos.col = yytext().length();
	return new Symbol(sym.rw_IF,
		new CSXToken(Pos));
}

<FoundIncOrDec> {RESERVED_WORD}
{
	Pos.setpos();
	Pos.col += yytext().length();
	yybegin(YYINITIAL);
	return new Symbol(sym.error,
		new CSXErrorToken("Found reserved word '" +  yytext() + "' after an Increment or Decrement operator, expected an identifier.", Pos));
}

<FoundIncOrDec> {ANYTHING}
{
	Pos.setpos();
	Pos.col += yytext().length();
	yybegin(YYINITIAL);
	return new Symbol(sym.error,
		new CSXErrorToken("Found something other than an identifier after an Increment or Decrement operator", Pos));
}

"{"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.LBRACKET,
		new CSXToken(Pos));
}

"}"
{
	Pos.setpos();
	Pos.col = yytext().length();
	return new Symbol(sym.RBRACKET,
		new CSXToken(Pos));
}

"/"
{
	Pos.setpos();
	Pos.col = yytext().length();
	return new Symbol(sym.SLASH,
		new CSXToken(Pos));
}

"("
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.LPAREN,
		new CSXToken(Pos));
}

")"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.RPAREN,
		new CSXToken(Pos));
}

<FoundIdentifier> "++"
{
	yybegin(YYINITIAL);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.INC,
		new CSXToken(Pos));
}

"++"
{
	yybegin(FoundIncOrDec);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.INC,
		new CSXToken(Pos));
}

<FoundIdentifier> "--"
{
	yybegin(YYINITIAL);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.DEC,
		new CSXToken(Pos));
}

"--"
{
	yybegin(FoundIncOrDec);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.DEC,
		new CSXToken(Pos));
}

<FoundIncOrDec> {IDENTIFIER}
{
	yybegin(YYINITIAL);
	Pos.setpos(); 
	Pos.col += yytext().length();
	
	return new Symbol(sym.IDENTIFIER,
		new CSXIdentifierToken(yytext(), Pos));
}

{IDENTIFIER}
{
	yybegin(FoundIdentifier);
	Pos.setpos(); 
	Pos.col += yytext().length();
	
	return new Symbol(sym.IDENTIFIER,
		new CSXIdentifierToken(yytext(), Pos));
}


