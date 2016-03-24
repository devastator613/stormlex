#include "leckser.h"
#include <iomanip>

enum {TK_Q, TK_W, TK_E, TK_R};
int main(int argc, char *argv[]) {
	if (argc != 2) {
		printf("Wrong number of parametrs\n");
		exit(1);
	}
	ifstream fin(argv[1]);
	string str;
	if (!fin.is_open()) {
		cout << "Can't open file " << argv[1] << endl;
		return 0;
	}
	else getline(fin, str, '\0');

	Tokenizer tokenizer(str);

	while (tokenizer.NextTocken()) {
		Token tk = tokenizer.GetToken();
		cout << tk.row << '\t' << tk.col << '\t' << tk.description()  <<  '\t' << tk.value << endl;
		}

}
