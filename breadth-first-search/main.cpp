#include "breadthFirstSearch.h"

int main() {
    Graph g(6);
    g.addEdge(0, 1);
    g.addEdge(0, 3);
    g.addEdge(1, 3);
    g.addEdge(2, 3);
    g.addEdge(3, 4);
    g.addEdge(4, 5);
    g.addEdge(5, 5);
    // Output should be 0 1 3 4 5
    g.breadthFirstSearch(0);
    return 0;
}