#include "breadthFirstSearch.h"

Graph::Graph(int numOfVerticesIn) {
    numOfVertices = numOfVerticesIn;
    adj = new std::list<int>[numOfVertices];
}

void Graph::addEdge(int v, int w) {
    adj[v].push_back(w); // Add w to v’s list.
}

void Graph::breadthFirstSearch(int source) {
    // Mark all the vertices as not visited
    bool *visited = new bool[numOfVertices];
    for (int i = 0; i < numOfVertices; i++) {
        visited[i] = false;
    }
    std::list<int> queue; // Queue for BFS
    
    visited[source] = true; // Mark the current node as visited
    queue.push_back(source); // Add the current node to the queue
    
    // Get all adjacent vertices of a vertex
    std::list<int>::iterator i;
    while (!queue.empty()) {
        // Dequeue a vertex from queue and print it
        source = queue.front();
        std::cout << source << " ";
        queue.pop_front();
        // Get adjacent vertices of the dequeued vertex s. If a adjacent has not been visited,  
        // then mark it visited and enqueue it 
        for (i = adj[source].begin(); i != adj[source].end(); ++i) {
            if (!visited[*i]) { 
                visited[*i] = true; 
                queue.push_back(*i); 
            }
        } 
    } 
} 