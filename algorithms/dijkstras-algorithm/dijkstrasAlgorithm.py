
def dijkstrasAlgorithm(graph, costs, parents, processed):
    node = findLowestCostNode(costs, processed) # Find lowest cost node that hasnt been processed
    while node is not None: # Loop until all nodes have been processed
        cost = costs[node]
        neighbors = graph[node]
        for n in neighbors.keys(): # Go thru the neighbours of this node
            newCost = cost + neighbors[n]
            # If it's cheaper to get to this neighbor by going through the current node,
            # update the cost for this node
            if costs[n] > newCost: # If it's cheaper to get to this neighbor by going through the current node,
                costs[n] = newCost # update the cost for this node
                parents[n] = node # This node becomes the new parent for this neighbor
        processed.append(node) # Mark node as proccessed
        node = findLowestCostNode(costs, processed) # Find the next node to proccess, and loop


def findLowestCostNode(costs, processed):
    lowestCost = float("inf")
    lowestCostNode = None
    for node in costs:
        cost = costs[node]
        # If its the lowest cost so far and hasn't been processed yet,
        # set it as the new lowest cost node
        if cost < lowestCost and node not in processed:
            lowestCost = cost
            lowestCostNode = node
    return lowestCostNode


def makeGraph():
    graph = dict()
    graph["start"] = dict()
    graph["start"]["a"] = 6
    graph["start"]["b"] = 2
    
    graph["a"] = dict()
    graph["a"]["fin"] = 1
    
    graph["b"] = dict()
    graph["b"]["a"] = 3
    graph["b"]["fin"] = 5
    
    graph["fin"] = dict()
    
    return graph


def makeCosts(graph):
    costs = dict()
    costs["start"] = 0
    # Set the costs of all nodes that you can reach from the "start"
    for childNode in graph["start"].keys():
        costs[childNode] = graph["start"][childNode]
    
    # Set the costs of all the nodes you can't reach from the "start" node to infinity
    for node in graph.keys():
        if node not in costs:
            costs[node] = float("inf")
    
    return costs


def makeParents(graph):
    parents = dict()
    # Set the parent of all nodes that you can reach from the "start"
    for childNode in graph["start"].keys():
        parents[childNode] = "start"

    # Set the parent of all the nodes you can't reach from the "start" node to None
    for node in graph.keys():
        if node not in parents:
            parents[node] = None

    return parents


def main():
    graph = makeGraph()
    costs = makeCosts(graph)
    parents = makeParents(graph)
    processed = []
    dijkstrasAlgorithm(graph, costs, parents, processed)
    print("COSTS: " + str(costs))
    print("PARENTS: " + str(parents))


if __name__ == "__main__":
    main()