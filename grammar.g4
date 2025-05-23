grammar DSCRIPT;

script
    : permissionDecl* metadataDecl* contractDecl EOF
    ;

permissionDecl
    : 'permissions' permission (',' permission)* ';' 
    ;

permission
    : IDENT DOUBLE_COLON IDENT                                           // fs::read, http::client … :contentReference[oaicite:0]{index=0}
    ;

metadataDecl
    : 'author'      STRING ';'                                           // author "Alice"; :contentReference[oaicite:1]{index=1}
    | 'version'     STRING ';'                                           // version "1.2.3"; :contentReference[oaicite:2]{index=2}
    | 'name'        STRING ';'                                           // name "MyScript"; :contentReference[oaicite:3]{index=3}
    | 'description' STRING ';'                                           // description "…"; :contentReference[oaicite:4]{index=4}
    | 'license'     STRING ';'                                           // license "MIT"; :contentReference[oaicite:5]{index=5}
    | 'website'     STRING ';'                                           // website "https://…"; :contentReference[oaicite:6]{index=6}
    | 'repo'        STRING ';'                                           // repo "https://…"; :contentReference[oaicite:7]{index=7}
    ;

contractDecl
    : 'contract' IDENT '{' contractBody* '}'                              // contract MyContract { … } :contentReference[oaicite:8]{index=8}
    ;

contractBody
    : implDecl
    | hookDecl
    ;

implDecl
    : 'impl' IDENT parameterList returnType? block                        // impl foo(int x) -> double { … } :contentReference[oaicite:9]{index=9}
    ;

hookDecl
    : 'hook' IDENT parameterList ('->' 'void')? block                     // hook onLogin(string u) { … } :contentReference[oaicite:10]{index=10}
    ;

parameterList
    : '(' (parameter (',' parameter)*)? ')'                               // parses (type name, …) :contentReference[oaicite:11]{index=11}
    ;

parameter
    : IDENT nullable? IDENT                                              // string username, int? foo :contentReference[oaicite:12]{index=12}
    ;

returnType
    : '->' IDENT nullable?                                               // -> double, -> string? :contentReference[oaicite:13]{index=13}
    ;

block
    : '{' statement* '}'                                                  // { … } :contentReference[oaicite:14]{index=14}
    ;

statement
    : variableDecl
    | assignment
    | returnStmt
    | expressionStmt
    | block                                                             // nested blocks if desired
    ;

variableDecl
    : ('var' | 'final' | 'const') type? IDENT ('=' expression)? ';'      // var x = 5; const pi = 3.14;
    ;

assignment
    : IDENT ('::' IDENT)? '=' expression ';'                             // x = 5; fs::write = …;
    ;

returnStmt
    : 'return' expression? ';'                                           // return x * 2.0;
    ;

expressionStmt
    : expression ';'
    ;

expression
    : equalityExpr
    ;

equalityExpr
    : relationalExpr ( ( '==' | '!=' ) relationalExpr )*
    ;

relationalExpr
    : additiveExpr ( ( '>' | '>=' | '<' | '<=' ) additiveExpr )*
    ;

additiveExpr
    : multiplicativeExpr ( ( '+' | '-' ) multiplicativeExpr )*
    ;

multiplicativeExpr
    : primaryExpr ( ( '*' | '/' | '%' ) primaryExpr )*
    ;

primaryExpr
    : literal
    | IDENT ( DOUBLE_COLON IDENT )? '(' argList? ')'
    | IDENT ( DOUBLE_COLON IDENT )?
    | '(' expression ')'
    ;

argList
    : expression ( ',' expression )*
    ;

literal
    : INT
    | FLOAT
    | STRING
    | BOOLEAN
    | 'null'
    ;

nullable
    : '?'
    ;

// Lexer rules
IDENT       : [a-zA-Z_][a-zA-Z0-9_]* ;
INT         : [0-9]+ ;
FLOAT       : [0-9]+ '.' [0-9]+ ;
STRING      : '"' ( ~["\\] | '\\' . )* '"' 
            | '\'' ( ~['\\] | '\\' . )* '\'' ;
BOOLEAN     : 'true' | 'false' ;
DOUBLE_COLON: '::' ;
ARROW       : '->' ;
SEMI        : ';' ;
COMMA       : ',' ;
LPAREN      : '(' ;
RPAREN      : ')' ;
LBRACE      : '{' ;
RBRACE      : '}' ;
PLUS        : '+' ;
MINUS       : '-' ;
STAR        : '*' ;
SLASH       : '/' ;
PERCENT     : '%' ;
EQ          : '=' ;
EQEQ        : '==' ;
NEQ         : '!=' ;
GTE         : '>=' ;
LTE         : '<=' ;
GT          : '>' ;
LT          : '<' ;
AND         : '&&' ;
OR          : '||' ;
QUESTION    : '?' ;
DOT         : '.' ;

// Whitespace and comments
WS              : [ \t\r\n]+          -> skip ;
LINE_COMMENT    : '//' ~[\r\n]*       -> skip ;
