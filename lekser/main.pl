use strict;
use warnings;
 
open(STDIN, '<', "table.txt") or die;
open(STDOUT, '>', "generate.h") or die;
my $keys = ' ';
my $i;
print "#pragma once
#include <map>
#include <vector>
#define initial_state 100

using namespace std;

enum TockenType {
	TK_EOF, TK_BEGIN, TK_STR, TK_DO, TK_ELSE, TK_END, TK_FOR, TK_FUNCTION, TK_IF, TK_FORWARD, TK_UNKNOWN,
	TK_INT, TK_HEX, TK_KEYWORD, TK_ARRAY, TK_OF, TK_PROCEDURE, TK_PROGRAM, TK_RECORD, TK_THEN, TK_TO, TK_TYPE,
	TK_SEP, TK_UNOP, TK_BINOP, TK_COMENT, TK_CODE, TK_REAL, TK_EREAL, TK_OP, TK_IDENT, TK_CHAR, TK_ERROR,
	TK_VAR, TK_WHILE, TK_BREAK, TK_CONTINUE, TK_DOWNTO, TK_EXIT, TK_REPEAT, TK_UNTIL, TK_MOD, TK_NOT, TK_OR,
	TK_XOR, TK_ADD, TK_SUB, TK_AND, TK_DIV, TK_MUL, TK_DIVISION, TK_DEGREE, TK_ADDR, TK_SUBR, TK_MULR, TK_DIVISIONR,
	TK_LESS, TK_MORE, TK_LESSR, TK_MORER, TK_MORELESS, TK_ASSIG, TK_DOG, TK_POINT, TK_COMMA, TK_LSQBR, TK_RSQBR,
	TK_SEMICOLON, TK_COLON, TK_POINTPOINT, TK_LROBR, TK_RROBR, TK_SHR, TK_SHL
};

extern map<int, pair<TockenType, int>> final_states;
extern map<int, vector<int>> transition_table;

int chartostate(char c);";
close STDOUT;

# map<int, pair<TockenType, int>> result;
# map<int, vector<int>> transition_table;
open(STDOUT, '>', "generate.cpp") or die;
print '#include "generate.h"

map<int, pair<TockenType, int>> final_states = {';

for ($i = 0; $i < 24; $i++){
	$_ = <>;
	$_ =~ s/^(-\d|\d\d|\d)\t(\w+)\t(\w+)\t(\d).*\n/{$1, make_pair($3, $4)}/g;
	print ;
	if ($i != 23) {print ",\n"};
};
print "};\n\n";
<>;<>;<>;

print 'map<int, vector<int>> transition_table = {';
for ($i = 0; $i < 24; $i++){
	$_ = <>;
	$_ =~ s/^(\d+\t).*?\t/$1/g;
	$_ =~ s/(-?\d+)\s+(-?\d+)/{$1, {$2/;
	$_ =~ s/\s+(-?\d+)/, $1/g;
	$_ =~ s/(.*)/$1}},/;
	if ($i == 23) {$_ =~ s/(.*),/$1};/};
	print;
};

print "\n";
print q`int chartostate(char c) {
	if (c == '0') return 0;
	if (c == '1') return 1;
	if (c == '2') return 2;
	if (c >= '3' && c <= '7') return 3;
	if (c == '8' || c == '9') return 4;
	if (c == 32 || c == 9) return 5;
	if (c >= 'a' && c <= 'd' || c == 'f'
		|| c >= 'A' && c <= 'D' || c == 'F') return 6;
	if (c == 'e' || c == 'E') return 7;
	if (c >= 'g' && c <= 'z' || c == '_' ||
		c >= 'G' && c <= 'Z') return 8;
	switch (c) {
	case 10 : return 9;
	case '#': return 10;
	case '$': return 11;
	case 39: return 12;
	case '(': return 13;
	case ')': return 14;
	case '+': case '-': return 15;
	case '*': return 16;
	case '/': return 17;
	case ',': return 18;
	case '=': return 19;
	case ':': return 20;
	case ';': return 21;
	case '<': return 22;
	case '>': return 23;
	case '@': return 24;
	case '[': case ']': return 25;
	case '^': return 26;
	case '.': return 27;
	case '{': return 28;
	case '}': return 29;
	case 0: return 30;
	default:
		return 31;
	}
};`;


$keys =~ s/ (TK_\w+) (.*) \1/ $1 $2 /g;
print $keys;
