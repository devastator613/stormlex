#pragma once
#include "generate.h"
#include <fstream>
#include <string>
#include <iostream>
#include <algorithm>
#include <map>
#include <vector>

using namespace std;

struct Token {
	TockenType type;
	string value;
	string description();
	int col, row;
};

class Tokenizer {
	string data;
	int nextcol, nextrow;
	int index;
	void SetTocken(int i, string val);
	void inccol(char c, bool flag);
	Token token;
public:
	Tokenizer(string str);
	bool NextTocken();
	Token GetToken();
	
};