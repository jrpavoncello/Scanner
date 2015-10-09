class CSXToken
{
	int linenum;
	int colnum;

	CSXToken()
	{

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
	CSXFloatLitToken(float floatValue, Position p)
	{
		super(p);
		this.floatValue = floatValue;
	}
}

class CSXIdentifierToken extends CSXToken
{
	String identifierValue;
	CSXIdentifierToken(String identifierValue, Position p)
	{
		super(p);
		this.identifierValue = identifierValue;
	}

}

class CSXCharLitToken extends CSXToken
{
	char charValue;
	CSXCharLitToken(char charValue, Position p)
	{
		super(p);
		this.charValue = charValue;
	}
}

class CSXStringLitToken extends CSXToken
{
	String stringValue;
	CSXStringLitToken(String stringValue, Position p)
	{
		super(p);
		this.stringValue = stringValue;
	}
}

class CSXErrorToken extends CSXToken
{
	String error;
	CSXErrorToken(String error, Position p)
	{
		super(p);
		this.error = error;
	}
}

// This class is used to track line and column numbers
// Feel free to change to extend it
class Position
{
	int  linenum; 			/* maintain this as line number current token was scanned on */
	int  colnum; 			/* maintain this as column number current token began at */
	int  line; 				/* maintain this as line number after scanning current token  */
	int  col; 				/* maintain this as column number after scanning current token  */
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
} ;


//This class is used by the scanner to return token information that is useful for the parser
//This class will be replaced in our parser project by the java_cup.runtime.Symbol class
class Symbol
{
	public int sym;
	public CSXToken value;
	public Symbol(int tokenType, CSXToken theToken)
	{
		sym = tokenType;
		value = theToken;
	}
}

%%

BLOCKCOMMENT = ##((#[^#])|[^#])*#?##
SINGLELINECOMMENT = [/][/].*[\n\r]?

DIGIT=[0-9]
STRLIT = \"((\\[\\\"rnt])|[\040!#-\[\]-~])*\"
RUNSTRLIT = \"((\\[\\\"rnt]*)|[\040!#-\[\]-~])*
STRLIT = \"([^\" \\ ]|\\n|\\t|\\\"|\\\\|" ")*\"		// to be fixed

IDENTIFIER = ([a-zA-Z][_0-9]?)+
ILLEGALIDENTIFIER = _?([0-9]*[a-zA-Z][_0-9]?)+

FLOAT = [fF][lL][oO][aA][tT]
WHILE = [wW][hH][iI][lL][eE]
BOOL = [bB][oO][oO][lL]
CONTINUE = [cC][oO][nN][tT][iI][nN][uU][eE]
FALSE = [fF][aA][lL][sS][eE]
TRUE = [tT][rR][uU][eE]
VOID = [vV][oO][iI][dD]
PRINT = [pP][rR][iI][nN][tT]
IF = [iI][fF]

BREAK = [Bb][Rr][Ee][Aa][Kk]
CHAR = [Cc][Hh][Aa][Rr]
NEWLINE = \n|(\r\n)

CHARLIT = ['](([\\][ntr\'\"\\])|[\040-&(\[\]-~])[']
RUNCHARLIT = ['](([\\][ntr\'\"\\])|[\040-&(\[\]-~])*
RETURN = [Rr][Ee][Tt][Uu][Rr][Nn]
CLASS = [Cc][Ll][Aa][Ss][Ss]
INT = [Ii][Nn][Tt]
READ = [Rr][Ee][Aa][Dd]
ELSE = [Ee][Ll][Ss][Ee]
CONST = [Cc][Oo][Nn][Ss][Tt]


RESERVED_WORD = {FLOAT}|{WHILE}|{BOOL}|{CONTINUE}|{FALSE}|{TRUE}|{VOID}|{PRINT}|{BREAK}|{CHAR}|{CLASS}|{RETURN}|{INT}|{READ}|{ELSE}|{CONST}|{IF}

%states FoundIdentifier
%xstates FoundIncOrDec, FoundIdentifierMatch

%type Symbol

%eofval{
	return new Symbol(sym.EOF, new CSXToken(0,0));
%eofval}

%{
Position Pos = new Position();
%}

%%
/***********************************************************************
Tokens for the CSX language are defined here using regular expressions
************************************************************************/

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

"<="
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.LEQ, new CSXToken(Pos));
}

">="
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.GEQ, new CSXToken(Pos));
}

"!="
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.NOTEQ, new CSXToken(Pos));
}

<FoundIdentifier> "++"
{
	yybegin(YYINITIAL);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.INC, new CSXToken(Pos));
}

"++" / {RESERVED_WORD}
{
	yybegin(YYINITIAL);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.error,
			new CSXErrorToken("Found reserved word after \"++\" operator", Pos));
}

"++" / {IDENTIFIER}
{
	yybegin(FoundIdentifierMatch);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.INC, new CSXToken(Pos));
}

"++"
{
	yybegin(YYINITIAL);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.error,
			new CSXErrorToken("Could not find matching identifier for \"++\" operator", Pos));
}

<FoundIdentifier> "--"
{
	yybegin(YYINITIAL);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.DEC, new CSXToken(Pos));
}

"--" / {RESERVED_WORD}
{
	yybegin(YYINITIAL);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.error,
			new CSXErrorToken("Found reserved word after \"--\" operator", Pos));
}

"--" / {IDENTIFIER}
{
	yybegin(FoundIdentifierMatch);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.DEC, new CSXToken(Pos));
}

"--"
{
	yybegin(YYINITIAL);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.error,
			new CSXErrorToken("Could not find matching identifier for \"--\" operator", Pos));
}

">"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.GT, new CSXToken(Pos));
}

"<"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.LT, new CSXToken(Pos));
}

"*"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.TIMES, new CSXToken(Pos));
}

"="
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.ASG, new CSXToken(Pos));
}

"+"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.PLUS, new CSXToken(Pos));
}

"-"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.MINUS, new CSXToken(Pos));
}

"!"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.NOT, new CSXToken(Pos));
}

";"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.SEMI, new CSXToken(Pos));
}

":"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.COLON, new CSXToken(Pos));
}

","
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.COMMA, new CSXToken(Pos));
}

"{"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.LBRACKET, new CSXToken(Pos));
}

"}"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.RBRACKET, new CSXToken(Pos));
}

"["
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.LBRACE, new CSXToken(Pos));
}

"]"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.RBRACE, new CSXToken(Pos));
}

"/"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.SLASH, new CSXToken(Pos));
}

"("
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.LPAREN, new CSXToken(Pos));
}

")"
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.RPAREN, new CSXToken(Pos));
}

{SINGLELINECOMMENT}
{
	String comment = yytext();
    System.out.println("Line Comment: " + comment);
    Pos.setpos();
    Pos.col += comment.length();
}

{BLOCKCOMMENT}
{
	Pos.setpos();
	
    int rowsSkipped = 0;
    String parseString = yytext();
	for(int i = 0; i < parseString.length(); i++)
	{
		Pos.col++;
		if(parseString.charAt(i) == '\n')
		{
			Pos.col=1;
			Pos.line++;
		}
	}
	
    System.out.println("Block Comment: " + parseString);
}

{CHARLIT}
{
	Pos.setpos();
	String charString = yytext();
	Pos.col += charString.length();

	char parsedChar;
	switch(charString)
	{
		case "'\\n'":
			parsedChar = '\n';
			break;
		case "'\\t'":
			parsedChar = '\t';
			break;
		case "'\\\\'":
			parsedChar = '\\';
			break;
		case "'\\''":
			parsedChar = '\'';
			break;
		default:
			parsedChar = charString.charAt(1);
			break;
	}
	
	return new Symbol(sym.CHARLIT,
			new CSXCharLitToken(parsedChar, Pos));
}

{RUNCHARLIT}
{	
	Pos.setpos();
	
	String parsed = yytext();
	Pos.col += parsed.length();
	return new Symbol(sym.error,
			new CSXErrorToken("Runaway character found: " + parsed, Pos));
}

([~]?{DIGIT}+\.{DIGIT}*)|([~]?{DIGIT}*\.{DIGIT}+)
{
	Pos.setpos();
	String parsedString = yytext();
	Pos.col += parsedString.length();
	parsedString = parsedString.replace('~', '-');
	
    float parsedFloat = Float.parseFloat(parsedString);
    if(parsedFloat == Float.NEGATIVE_INFINITY || parsedFloat == Float.POSITIVE_INFINITY)
    {
		System.out.println("Float Overflow Error");

		return new Symbol(sym.FLOATLIT,
				new CSXFloatLitToken(Float.MAX_VALUE, Pos));
    }
    else
    {
		return new Symbol(sym.FLOATLIT,
			new CSXFloatLitToken(parsedFloat, Pos));
	}
}

[~]?{DIGIT}+
{
	Pos.setpos();
	
	String parsedString = yytext();
	Pos.col += parsedString.length();
	parsedString = parsedString.replace('~', '-');

	try{
		return new Symbol(sym.INTLIT,
				new CSXIntLitToken(Integer.parseInt(parsedString), Pos));

	} catch (NumberFormatException e) {

		System.out.println("Overflow Error");
		System.out.println(e.getMessage());

		return new Symbol(sym.INTLIT,
				new CSXIntLitToken(Integer.MAX_VALUE, Pos));
	}
}

{STRLIT}
{
	Pos.setpos();
	Pos.col += yytext().length();

	return new Symbol(sym.STRLIT,
			new CSXStringLitToken(yytext(), Pos));
}

{RUNSTRLIT}
{
	Pos.setpos();
	
	String parsed = yytext();
	Pos.col += parsed.length();
	return new Symbol(sym.error,
			new CSXErrorToken("Runaway string found: " + parsed, Pos));
}

" "
{
	Pos.setpos();
	yybegin(YYINITIAL);
	Pos.col += 1;
}

\t
{
	Pos.setpos();
    yybegin(YYINITIAL);
    Pos.col += 1;

}
{NEWLINE}
{
	yybegin(YYINITIAL);
	Pos.setpos();
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
	Pos.col += yytext().length();
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
	Pos.col += yytext().length();
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

<FoundIncOrDec> {IDENTIFIER}
{
	yybegin(FoundIdentifier);
	Pos.setpos();
	Pos.col += yytext().length();

	return new Symbol(sym.IDENTIFIER,
			new CSXIdentifierToken(yytext(), Pos));
}

<FoundIdentifierMatch> {IDENTIFIER}
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

{ILLEGALIDENTIFIER}
{
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.error,
	new CSXErrorToken("Found invalid Identifier: " + yytext(), Pos));
}

[^\Z]
{
	yybegin(YYINITIAL);
	Pos.setpos();
	Pos.col += yytext().length();
	return new Symbol(sym.error,
			new CSXErrorToken("Found invalid token: " + yytext(), Pos));
}
