#include <iostream> 
#include <fstream> 
#include <string>
#include <vector>
#include <sstream>

using namespace std;

class bingoSpot {
public:
	int num;
	bool marked;

	explicit bingoSpot(int n) {
		num = n;
		marked = false;
	}
};

class bingoBoard {
public:
	vector<vector<bingoSpot>> numbers;

	void markNum(int num) {
		for (auto & number : numbers) {
			for (auto & j : number) {
				if (j.num == num) {
					j.marked = true;
				}
			}
		}
	}

	int checkWin() {
		int val = 0;
		//horizontal check
		for (auto & number : numbers) {
			int sum = 0;
			for (auto & j : number) {
				if (j.marked) {
					sum += j.num;
				}
				else {
					sum = -1;
					break;
				}
			}
			if (sum > val)
				val = sum;
		}
		//vertical check
		for (int i = 0; i < numbers[i].size(); i++) { //lets hope its correctly rectangular
			int sum = 0;
			for (auto & number : numbers) {
				if (number[i].marked) {
					sum += number[i].num;
				}
				else {
					sum = -1;
					break;
				}
			}
			if (sum > val)
				val = sum;
		}
		return val;
	}

	int sum() {
        int sum = 0;
        for (auto &number : numbers) {
            for (auto &j : number) {
                if(!j.marked)
                    sum += j.num;
            }
        }
        return sum;
    }
};

vector<int> stringToVec(const string& str) {
	vector<int> ints;
	stringstream ss(str);
	int n;
	char ch;

	while (ss >> n) {
		if (ss >> ch)
			ints.push_back(n);
		else
			ints.push_back(n);
	}
	return ints;
}

vector<bingoSpot> stringToBVec(const string& str) {
	vector<bingoSpot> ints;
	stringstream ss(str);
	int n;

	while (ss >> n) {
	    ints.emplace_back(n);
	}
	return ints;
}

int main() {
	ifstream file("input.txt");
	string str;
	file >> str;
	vector<int> res = stringToVec(str);
	for (int re : res) {
		printf("%d ", re);
	}
    getline(file, str);
    getline(file, str);
	vector<bingoBoard> boards;
	while (!file.eof()) {
        bingoBoard newBoard;
        string s;
        while (true) {
            getline(file, s);
            if (s.empty()) {
                break;
            } else {
                newBoard.numbers.push_back(stringToBVec(s));
            }
        }
        boards.push_back(newBoard);
	}
    for(int re : res) {
        //int maxWin = 0;
        for(auto it = boards.begin(); it != boards.end(); it++) {
            it->markNum(re);
            int win = it->checkWin();
            if(win > 0 && boards.size() == 1) {
                int sum = it->sum()*re;
                return(sum);
            } else if(win > 0) {
                boards.erase(it);
                it--;
            }
        }
    }
	return 0;
}