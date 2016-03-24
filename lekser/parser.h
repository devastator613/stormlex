#pragma once
#include "leckser.h"

struct expression {
	exception *left, *right;
	Token tk;
};

class Node {
	virtual void print(int offset) {};
};

class BinOpNode : public Node {
	Token tk;
	Node *left, *right;
public:
	void SetOp(Token atk, Node* aleft, Node *aright) { tk = atk; left = left; right = aright; };
	void print(int offset) {};
};

class UnOpNode : public Node {
	Token tk;
	Node *left;
public:
	void SetOp(Token atk, Node* aleft) { tk = atk; left = left;};
	void print(int offset) {};
};

class ParseExp {
	//Tokenizer tokenizer;
	/*expression* e(Token tk);
	expression* t(Token tk);
	expression* f(Token tk);*/
public:
	ParseExp(string str);
};



vector<expression*> parse_trees;

