import unittest


class Dependency:
    def __init__(self, project_a, project_b):
        self.first = project_a
        self.second = project_b


class Project:
    def __init__(self, value):
        self.value = value
        self.dependents = list()
        self.is_built = False

    def add_dependency(self, project):
        self.dependents.append(project)

    def build(self):
        self.is_built = True

    def can_build(self):
        for dep in self.dependents:
            if not dep.is_built:
                return False
        return True


def build_order(projects, dependencies):
    construct_dependency_graph(dependencies)
    result = list()
    updated = True
    while updated:
        updated = False
        for proj in projects:
            if proj.can_build():
                proj.build()
                result.append(proj)
                projects.remove(proj)
                updated = True
                print(f'Building {proj.value}')
        if not updated and len(projects) > 0:
            return None
    return result


def construct_dependency_graph(dependencies):
    for dep in dependencies:
        dep.first.add_dependency(dep.second)


def build_projects():
    a = Project("a")
    b = Project("b")
    c = Project("c")
    d = Project("d")
    e = Project("e")
    f = Project("f")
    return a, b, c, d, e, f


class TestBuildOrder(unittest.TestCase):

    def test_build_order(self):
        a, b, c, d, e, f = build_projects()
        projects = [
            a,
            b,
            c,
            d,
            e,
            f
        ]
        dependencies = [
            Dependency(d, a),
            Dependency(b, f),
            Dependency(d, b),
            Dependency(a, f),
            Dependency(c, d),
        ]
        result = build_order(projects, dependencies)
        expected = [e, f, a, b, d, c]
        self.assertEqual(result, expected)

    def test_no_build_order(self):
        a, b, c, d, e, f = build_projects()
        projects_impossible = [
            a,
            b,
            c,
            d,
            e,
            f
        ]
        dependencies_impossible = [
            Dependency(d, a),
            Dependency(a, d),
        ]
        result = build_order(projects_impossible, dependencies_impossible)
        self.assertEqual(result, None)


if __name__ == "__main__":
    unittest.main(verbosity=2)
