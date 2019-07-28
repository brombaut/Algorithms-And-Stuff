#ifndef BREADTHFIRSTSEARCH_H_
#define BREADTHFIRSTSEARCH_H_
#include<iostream>
#include <list>

class Graph 
{ 
    int numOfVertices; // No. of vertices 
    std::list<int> *adj; // Pointer to an array containing adjacency lists
public:
    Graph(int V);
    void addEdge(int v, int w);
    void breadthFirstSearch(int s); // prints BFS traversal from a given start s
}; 

#endif