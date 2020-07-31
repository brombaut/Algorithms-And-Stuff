import unittest
import collections
from enum import Enum


class State(Enum):
    UNVISITED = 0
    VISITED = 1
    VISITING = 2


class GraphNode:
    def __init__(self, name):
        self._name = name
        self._children = []
        self._state = State.UNVISITED

    def name(self):
        return self._name

    def adjacent_nodes(self):
        return self._children

    def addChild(self, child):
        self._children.append(child)

    def connect(self, child):
        self._children.append(child)
        child.addChild(self)

    def state(self):
        return self._state

    def unvisited(self):
        self._state = State.UNVISITED

    def visiting(self):
        self._state = State.VISITING

    def visited(self):
        self._state = State.VISITED


class Graph:
    def __init__(self, nodes):
        self._nodes = nodes

    def get_node_by_name(self, name):
        for node in self._nodes:
            if node.name() == name:
                return node
        return None

    def route_between_nodes(self, start, end):
        if start == end:
            return True
        if start is None or end is None:
            return False

        for n in self._nodes:
            n.unvisited()
        q = collections.deque([])
        start.visiting()
        q.append(start)
        while(len(q) > 0):
            u = q.popleft()
            if u is not None:
                for v in u.adjacent_nodes():
                    if v.state() == State.UNVISITED:
                        if v == end:
                            return True
                        else:
                            v.visiting()
                            q.append(v)
                u.visited()
        return False


def route_between_nodes(graph, node_a, node_b):
    pass


def build_directed_graph():
    node_0 = GraphNode("0")
    node_1 = GraphNode("1")
    node_2 = GraphNode("2")
    node_3 = GraphNode("3")
    node_4 = GraphNode("4")
    node_5 = GraphNode("5")
    node_6 = GraphNode("6")

    node_0.addChild(node_1)
    node_1.addChild(node_2)
    node_2.addChild(node_0)
    node_2.addChild(node_3)
    node_3.addChild(node_2)
    node_4.addChild(node_6)
    node_5.addChild(node_4)
    node_6.addChild(node_5)

    return Graph([
        node_0,
        node_1,
        node_2,
        node_3,
        node_4,
        node_5,
        node_6,
    ])


class TestRouteBetweenNodes(unittest.TestCase):

    def test_route_exists(self):
        g = build_directed_graph()
        n0 = g.get_node_by_name("0")
        n3 = g.get_node_by_name("3")
        self.assertTrue(g.route_between_nodes(n0, n3))

    def test_route_does_not_exists(self):
        g = build_directed_graph()
        n0 = g.get_node_by_name("2")
        n3 = g.get_node_by_name("5")
        self.assertFalse(g.route_between_nodes(n0, n3))


if __name__ == "__main__":
    unittest.main(verbosity=2)
