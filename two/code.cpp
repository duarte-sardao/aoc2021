#include <iostream> 
#include <fstream> 
#include <string> 
#include <fstream>
#include <iostream>
#include <vector>

using namespace std;

int main() {
	ifstream file("input.txt");
	vector<int> vals;
	vector<string> moves;
	if (file.is_open())
	{

		while (true)
		{
			string move;
			int val;
			file >> move;
			file >> val;
			if (file.eof())
				break;
			vals.push_back(val);
			moves.push_back(move);
			//cout << x;
			//cout << "\n";
		}
	}
	else
	{
		cout << "Unable to open file";
		return -1;
	}
	/*int f = 0;
	int d = 0;
	for (int i = 0; i < moves.size(); i++) {
		if (moves[i] == "forward") {
			f += vals[i];
		}
		else if (moves[i] == "up") {
			d -= vals[i];
		}
		else if (moves[i] == "down") {
			d += vals[i];
		}
	}*/

	int f = 0;
	int d = 0;
	int a = 0;
	for (int i = 0; i < moves.size(); i++) {
		if (moves[i] == "forward") {
			f += vals[i];
			d += a * vals[i];
		}
		else if (moves[i] == "up") {
			a -= vals[i];
		}
		else if (moves[i] == "down") {
			a += vals[i];
		}
	}
	cout << f*d;
	return 0;
}