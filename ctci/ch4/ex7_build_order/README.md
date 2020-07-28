# 4.7 - BuildOrder

You are given a list of projects and a list of dependencies (which is a list of pairs of projects, where the first project is dependent on the second project). All of a projects deoendencies must be build before the project is. Find a build order that will allow the projects to be built. If there is no valid build order, return an error.

### EXAMPLE
Input: 
  projects: a, b, c, d, e, f
  dependencies: (d, a), (b, f), (d, b), (a, f), (c, d)
Output: 
  f, e, a, b, d, c
