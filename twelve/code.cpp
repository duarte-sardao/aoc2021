// C++ program to print all paths
// from a source to destination.
#include <iostream>
#include <map>
#include <vector>
#include <fstream>
#include <string>
using namespace std;

int count = 0;
 
// A directed graph using
// adjacency list representation
class Graph {
    map<string, vector<string>> adj; // Pointer to an array containing adjacency lists
 
    // A recursive function used by printAllPaths()
    void printAllPathsUtil(const string&, const string&,  map<string, bool>, map<int, string>, int&, bool);
 
public:
    Graph(); // Constructor
    void addEdge(const string& u, const string& v);
    void printAllPaths(string s, const string& d, bool);
};
 
Graph::Graph()
= default;
 
void Graph::addEdge(const string& u, const string& v)
{
    adj[u].push_back(v); // Add v to u’s list.
}
 
// Prints all paths from 's' to 'd'
void Graph::printAllPaths(string s, const string& d, bool tolerance)
{
    int V = adj.size();
    // Mark all the vertices as not visited
    map<string, bool> visited;
 
    // Create an array to store paths
    map<int, string> path;
    int path_index = 0; // Initialize path[] as empty
 
    // Initialize all vertices as not visited
    for(auto & it : adj) {
        string vert = (it.first);
        /**vector<string> v= it->second;
        cout << vert;
        for(string l: v)
            cout << " " << l;
        cout << "\n";**/
        visited.insert(pair<string, bool>(vert, false));
    }
    // Call the recursive helper function to print all paths
    count = 0;
    printAllPathsUtil(s, d, visited, path, path_index, tolerance);
    cout << count;
}
 
// A recursive function to print all paths from 'u' to 'd'.
// visited[] keeps track of vertices in current path.
// path[] stores actual vertices and path_index is current
// index in path[]
void Graph::printAllPathsUtil(const string& u, const string& d, map<string, bool> visited,
                              map<int, string> path, int& path_index, bool tolerance)
{
    // Mark the current node and store it in path[]
    if(!isupper(u[0]))
        visited[u] = true;
    path[path_index] = u;
    path_index++;
 
    // If current vertex is same as destination, then print
    // current path[]
    if (u == d) {
        for (int i = 0; i < path_index; i++)
            cout << path[i] << " ";
        cout << endl;
        count++;
    }
    else // If current vertex is not destination
    {
        // Recur for all the vertices adjacent to current vertex
        vector<string>::iterator i;
        for (i = adj[u].begin(); i != adj[u].end(); ++i)
            if (!visited[*i])
                printAllPathsUtil(*i, d, visited, path, path_index, tolerance);
            else if(tolerance && *i != "start" && *i != "end")
                printAllPathsUtil(*i, d, visited, path, path_index, false);
    }
 
    // Remove current vertex from path[] and mark it as unvisited
    path_index--;
    visited[u] = false;
}
 
// Driver program
int main()
{

    string s;
    ifstream myfile("input.txt");
    Graph g;
    string delimiter = "-";

    while (std::getline(myfile, s)) {
        string u = s.substr(0, s.find(delimiter));
        s.erase(0, s.find(delimiter) + delimiter.length());
        string v = s.substr(0, s.find(delimiter));
        //cout << u << " " << v << "\n";
        g.addEdge(u,v);g.addEdge(v,u); //non directed teehee
    }

    g.printAllPaths("start", "end", false);
    g.printAllPaths("start", "end", true);
 
    return 0;
}