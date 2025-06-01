grammar dscript;

// ------ GRAMMAR RULES ------ //

script: schema? metadata* permissions* contract EOF;

// Top-level metadata

metadata:
	name
	| description
	| author
	| version
	| license
	| repo
	| website;

schema: SCHEMA STRING SEMI;
author: AUTHOR STRING SEMI;
description: DESCRIPTION STRING SEMI;
version: VERSION SEMVER SEMI;
license: LICENSE STRING SEMI;
repo: REPO STRING SEMI;
website: WEBSITE STRING SEMI;
name: NAME STRING SEMI;

// Permissions declarations
permissions: PERMISSIONS permission (COMMA permission)* SEMI;
permission:
	namespace = identifier DOUBLE_COLON perm = identifier;

// The single contract
contract:
	CONTRACT identifier OPEN_BRACE (varDecl SEMI)* (
		hook
		| impl
		| func
	)* CLOSE_BRACE;

// Hooks and impls
hook: HOOK identifier OPEN_PAREN params? CLOSE_PAREN block;
impl:
	IMPL identifier OPEN_PAREN params? CLOSE_PAREN ARROW dataType block;

func:
	FUNC identifier OPEN_PAREN params? CLOSE_PAREN ARROW dataType block;

// Function parameters
params: param (COMMA param)*;
param: dataType identifier;
dataType:
	identifier Q?
	| LIST LT dataType GT Q?
	| MAP LT dataType ',' dataType GT Q?;

// Control-flow

stmt:
	varDecl
	| assignment
	| returnStmt
	| breakStmt
	| continueStmt
	| throwStmt
	| ifStmt
	| whileStmt
	| forStmt
	| tryStmt;
// switch postponed | switchStmt;

throwStmt: THROW expr;

ifStmt: IF OPEN_PAREN expr CLOSE_PAREN block elseStmt?;
elseStmt: ELSE (ifStmt | block);
whileStmt: WHILE OPEN_PAREN expr CLOSE_PAREN block;
forStmt:
	FOR OPEN_PAREN (
		(varDecl | IDENT) SEMI expr SEMI assignment
		| varDecl IN expr
	) CLOSE_PAREN block;
returnStmt: RETURN expr?;
breakStmt: BREAK;
continueStmt: CONTINUE;
// switch is postponed until further notice switchStmt: SWITCH OPEN_PAREN expr CLOSE_PAREN
// OPEN_BRACE caseStmt* defaultStmt? CLOSE_BRACE; caseStmt: CASE (literal | identifier) COLON block;
// defaultStmt: DEFAULT COLON block;
/*
 * Try block for exception handling.
 */
tryStmt: TRY block catchBlock;
/*
 * Catch block for exception handling.
 */
catchBlock: CATCH OPEN_PAREN identifier CLOSE_PAREN block;

line: (stmt | expr) SEMI | block;

// Variable declarations & assignments
varType: FINAL | CONST | VAR;
assignment: simpleAssignment | compoundAssignment;

simpleAssignment: identifier ASSIGN expr;

compoundAssignment:
	identifier op = PLUS_ASSIGN expr
	| identifier op = MINUS_ASSIGN expr
	| identifier op = MULTIPLY_ASSIGN expr
	| identifier op = DIVIDE_ASSIGN expr
	| identifier op = MOD_ASSIGN expr;

varDecl:
	varType dataType identifier
	| varType dataType? assignment;

// Expressions 

expr: logicalExpr;

logicalExpr:
	left = relationalExpr (
		op = (AND | OR) right = relationalExpr
	)*;

relationalExpr:
	left = bitwiseExpr (
		op = (GT | LT | EQ | NE | GTE | LTE) right = bitwiseExpr
	)*;

bitwiseExpr:
	left = shiftExpr (
		op = (BIT_AND | BIT_OR | BIT_XOR) right = shiftExpr
	)*;

shiftExpr:
	left = additiveExpr (
		op = (BIT_LEFT_SHIFT | BIT_RIGHT_SHIFT) right = additiveExpr
	)*;

additiveExpr:
	left = multiplicativeExpr (
		op = (PLUS | MINUS) right = multiplicativeExpr
	)*;

multiplicativeExpr:
	left = unaryExpr (
		op = (MULTIPLY | DIVIDE | MOD) right = unaryExpr
	)*;

unaryExpr:
	op = (PLUS | MINUS | NOT | BIT_NOT) unaryExpr
	| suffixExpr;

suffixExpr: primaryExpr op = (PLUS_PLUS | MINUS_MINUS)?;

primaryExpr:
	OPEN_PAREN expr CLOSE_PAREN
	| functionCall
	| externalFunctionCall
	| literal
	| identifier;

externalFunctionCall:
	namespace = identifier DOUBLE_COLON functionCall;

functionCall: method = identifier OPEN_PAREN args? CLOSE_PAREN;

args:
	positionalArg (COMMA positionalArg)*
	| namedArg (COMMA namedArg)*
	| positionalArg (COMMA positionalArg)* COMMA namedArg (
		COMMA namedArg
	)*;

namedArg: identifier COLON expr;

positionalArg: expr;

// Literals
literal:
	INT
	| DOUBLE
	| BOOL
	| STRING
	| NULL
	| arrayLiteral
	| mapLiteral
	| objectLiteral;

identifier:
	(
		ident = IDENT
		| ident = AUTHOR
		| ident = NAME
		| ident = DESCRIPTION
		| ident = VERSION
		| ident = LICENSE
		| ident = REPO
		| ident = WEBSITE
		| ident = PERMISSIONS
		| ident = CONTRACT
		| ident = IMPL
		| ident = HOOK
		| ident = FUNC
		| ident = LIST
		| ident = MAP
		| ident = SCHEMA
	) (nullAware = NOT | allowNull = Q)?
	// Indexing an identifier
	| indexIdent = identifier OPEN_BRACKET index = expr CLOSE_BRACKET (
		nullAware = NOT
		| allowNull = Q
	)?
	// Accessing a property of an identifier
	| objIdent = identifier DOT property = identifier;

arrayLiteral: OPEN_BRACKET (expr (COMMA expr)*)? CLOSE_BRACKET;
objectLiteral:
	AT identifier OPEN_BRACE (
		objectProperty (COMMA objectProperty)*
	)? CLOSE_BRACE;
objectProperty: identifier COLON expr;

mapLiteral:
	OPEN_BRACE (mapEntry (COMMA mapEntry)*)? CLOSE_BRACE;

mapEntry: key = expr COLON value = expr;

/*
 * A sequence of statements enclosed in braces.
 */
block: (OPEN_BRACE line* CLOSE_BRACE)
	| ifStmt
	| whileStmt
	| forStmt
	//| switchStmt
	| tryStmt
	| catchBlock;

// ------ LEXER RULES ------ //

// Operators & punctuation
PLUS: '+';
MINUS: '-';
MULTIPLY: '*';
DIVIDE: '/';
MOD: '%';
OPEN_PAREN: '(';
CLOSE_PAREN: ')';
OPEN_BRACE: '{';
CLOSE_BRACE: '}';
OPEN_BRACKET: '[';
CLOSE_BRACKET: ']';
GT: '>';
LT: '<';
EQ: '==';
ASSIGN: '=';
NE: '!=';
GTE: '>=';
LTE: '<=';
COLON: ':';
DOUBLE_COLON: '::';
COMMA: ',';
SEMI: ';';
AND: '&&';
OR: '||';
NOT: '!';
BIT_AND: '&';
BIT_OR: '|';
BIT_XOR: '^';
BIT_NOT: '~';
BIT_LEFT_SHIFT: '<<';
BIT_RIGHT_SHIFT: '>>';
ARROW: '->';
Q: '?';
DOT: '.';
PLUS_ASSIGN: '+=';
MINUS_ASSIGN: '-=';
MULTIPLY_ASSIGN: '*=';
DIVIDE_ASSIGN: '/=';
MOD_ASSIGN: '%=';
PLUS_PLUS: '++';
MINUS_MINUS: '--';
AT: '@';
DOLLAR: '$';

// Keywords

/*
 * Schema keyword declaring the script's schema it's following.
 */
SCHEMA: 'schema';

/*
 * Metadata keyword declaring the script's author.
 */
AUTHOR: 'author';

/*
 * Metadata keyword declaring a new line in the script's description.
 */
DESCRIPTION: 'description';

/*
 * Metadata keyword declaring the script's version.
 */
VERSION: 'version';

/*
 * Metadata keyword declaring the script's license.
 */
LICENSE: 'license';

/*
 * Metadata keyword declaring the script's repository.
 */
REPO: 'repo';

/*
 * Metadata keyword declaring the script's website.
 */
WEBSITE: 'website';

/*
 * Metadata keyword declaring the script's name.
 */
NAME: 'name';

/*
 * Metadata keyword declaring the permissions required by the script.
 */
PERMISSIONS: 'permissions';

/*
 * Metadata keyword declaring the contract of the script.
 */
CONTRACT: 'contract';

/*
 * Metadata keyword declaring a contractualy mandated implementation.
 */
IMPL: 'impl';

/*
 * Metadata keyword declaring a hook in the script.
 */
HOOK: 'hook';

/*
 * Metadata keyword declaring a function in the script not exposed to the host.
 */
FUNC: 'func';

// Data types
LIST: 'List';
MAP: 'Map';

// Control flow keywords

IF: 'if';
ELSE: 'else';
WHILE: 'while';
FOR: 'for';
IN: 'in';
DO: 'do';
RETURN: 'return';
BREAK: 'break';
CONTINUE: 'continue';
SWITCH: 'switch';
CASE: 'case';
DEFAULT: 'default';
TRY: 'try';
CATCH: 'catch';
THROW: 'throw';

FINAL: 'final';
CONST: 'const';
VAR: 'var';

// Fragments
fragment DIGIT: [0-9];
fragment DOUBLE_QUOTE: '"';
fragment QUOTE: '\'';

/**
 * Version rule following [Semver 2.0](https://semver.org/).
 * 
 * Matches versions like 1.0.0, 2.1.3, etc.
 */
SEMVER:
	VERSION_CORE
	| VERSION_CORE MINUS PRE_RELEASE (PLUS BUILD)?
	| VERSION_CORE PLUS BUILD;

fragment VERSION_CORE: MAJOR DOT MINOR DOT PATCH;

fragment MAJOR: DIGIT+;
fragment MINOR: DIGIT+;
fragment PATCH: DIGIT+;
fragment BUILD: DIGIT+;
fragment PRE_RELEASE: IDENT (DOT IDENT)*;

// identifiers, numbers, strings

BOOL: 'true' | 'false';
NULL: 'null';

INT: DIGIT+;

DOUBLE: DIGIT+ DOT DIGIT+;

IDENT: [a-zA-Z_][a-zA-Z0-9_]*;
STRING:
	DOUBLE_QUOTE (~["\\\r\n] | '\\' .)* DOUBLE_QUOTE
	| QUOTE ( ~['\\\r\n] | '\\' .)* QUOTE;

WS: [ \t\r\n]+ -> skip;
COMMENT: '//' ~[\r\n]* -> skip;
DOC_COMMENT: '///' ~[\r\n]* -> skip;