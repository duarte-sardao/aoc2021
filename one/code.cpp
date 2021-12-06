#include <iostream> 
#include <fstream> 
#include <string> 
#include <fstream>
#include <iostream>
#include <vector>

using namespace std;

int main() {
	ifstream file("input.txt");
	vector<int> vec;
	if (file.is_open())
	{

		while (true)
		{
			int x;
			file >> x;
			if (file.eof())
				break;
			vec.push_back(x);
			//cout << x;
			//cout << "\n";
		}
	}
	else
	{
		cout << "Unable to open file";
		return -1;
	}
	vec.push_back(0);
	vec.push_back(0);
	int last = 0;
	int count = -1; //LMFAO
	for (int i = 0; i < vec.size()-2; i++) {
		int sum = vec[i] + vec[i + 1] + vec[i + 2];
		if (sum > last) {
			count++;
		}
		last = sum;
	}
	cout << count;
	return count;
}