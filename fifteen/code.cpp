// C++ program to print all paths
// from a source to destination.
#include <iostream>
#include <map>
#include <vector>
#include <fstream>
#include <string>
#include <algorithm>
using namespace std;

int count = 0;

struct Edge {
    string dest;
    int weight;
};
class Graph {
public:
    map<string, vector<Edge>> adj;
    map<string, int> distance;
    Graph(vector<vector<int>> vec); // Constructor
    void djikstra();
};

string stringify(int i, int j) { //vertex identifier needs two digits so x = 09, y = 10 and x = 91, y= 0 dont both become 910
    string left = to_string(i);
    if(left.size() == 1) {
        left = '0'+left;
    }
    string right = to_string(j);
    if(right.size() == 1) {
        right = '0'+right;
    }
    string pos = left + right;
    return pos;
}

Graph::Graph(vector<vector<int>> vec) {
    cout << "constructing\n";
    for (int i = 0; i < vec.size(); i++)
    {
        for (int j = 0; j < vec[i].size(); j++)
        {
            string pos = stringify(i, j);
            cout << pos << "\n";
            vector<Edge> edges;
            if(i-1 >= 0) {
                Edge e;
                e.dest = stringify(i-1, j);
                e.weight = vec[i-1][j];
                edges.push_back(e);
            }
            if(i+1 < vec.size()) {
                Edge e;
                e.dest = stringify(i+1, j); //was string() for quite a bit was bugging shit out the naughty lad
                e.weight = vec[i+1][j];
                edges.push_back(e);
            }
            if(j-1 >= 0) {
                Edge e;
                e.dest = stringify(i, j-1);
                e.weight = vec[i][j-1];
                edges.push_back(e);
            }
            if(j+1 < vec[i].size()) {
                Edge e;
                e.dest = stringify(i, j+1);
                e.weight = vec[i][j+1];
                edges.push_back(e);
            }
            adj.insert(pair<string, vector<Edge>>(pos, edges));
            distance.insert(pair<string, int>(pos, 999999));
        }
    }
    cout << "constructed\n";
}

void Graph::djikstra() {
    distance["0000"] = 0;
    vector<string> q;
    for(auto it = adj.begin(); it != adj.end(); ++it) {
        cout << it->first << " ";
        q.push_back(it->first);
    }
    while(!q.empty()) {
        //get min
        int minin = -1;
        string vex;
        for(auto v: q) {
            if(distance[v] < minin || minin == -1) {
                minin = distance[v];
                vex = v;
            }
        }
        cout << "New min: " << vex << "\n";
        auto position = find(q.begin(), q.end(), vex);
        q.erase(position);
        //got and rmeoved min shouldve use prio queue but by now w/e
        vector<Edge> vec = adj[vex];
        for(auto edge: vec) {
            cout << edge.dest << " ";
            int alt = minin + edge.weight;
            if(alt < distance[edge.dest]) {
                distance[edge.dest] = alt;
            }
        }
        cout << "\n";
    }
}

void vecprint(vector<vector<int>> vec) {
    for (int i = 0; i < vec.size(); i++)
    {
        for (int j = 0; j < vec[i].size(); j++)
        {
            cout << vec[i][j];
        }
    }
}
 

int main()
{

    string s;
    ifstream myfile("intput.txt");
    vector<vector<int>> vals;
    while (std::getline(myfile, s)) {
        vector<int> lol;
        cout << s << "\n";
        for(int i = 0; i < s.size(); i++) {
            if(!isdigit(s[i]))
                break;
            int x = s[i] - '0';
            lol.push_back(x);
        }
        vals.push_back(lol);
    }
    cout << "here\n";
    Graph g(vals);
    g.djikstra();
    for(const auto& elem : g.distance)
    {
    std::cout << elem.first << " " << elem.second << "\n";
    }

    return 0;
}