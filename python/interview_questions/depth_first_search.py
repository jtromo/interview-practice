def main():
  #  What is Depth First Search?

  # What do we do once have to solve a maze? We tend to take a route, keep going until we discover a dead end. When touching the dead end, we again come back and keep coming back till we see a path we didn't attempt before. Take that new route. Once more keep going until we discover a dead end. Take a come back again… This is exactly how Depth-First Search works.

  # The Depth-First Search is a recursive algorithm that uses the concept of backtracking. It involves thorough searches of all the nodes by going ahead if potential, else by backtracking. Here, the word backtrack means once you are moving forward and there are not any more nodes along the present path, you progress backward on an equivalent path to seek out nodes to traverse. All the nodes are progressing to be visited on the current path until all the unvisited nodes are traversed after which subsequent paths are going to be selected.

  #  DFS Algorithm

  # Before learning the python code for Depth-First and its output, let us go through the algorithm it follows for the same. The recursive method of the Depth-First Search algorithm is implemented using stack. A standard Depth-First Search implementation puts every vertex of the graph into one in all 2 categories: 1) Visited 2) Not Visited. The only purpose of this algorithm is to visit all the vertex of the graph avoiding cycles.

  # The DSF algorithm follows as:

  # We will start by putting any one of the graph's vertex on top of the stack.
  # After that take the top item of the stack and add it to the visited list of the vertex.
  # Next, create a list of that adjacent node of the vertex. Add the ones which aren't in the visited list of vertexes to the top of the stack.
  # Lastly, keep repeating steps 2 and 3 until the stack is empty.

  #  Time Complexity

  # The time complexity of the Depth-First Search algorithm is represented within the sort of O(V + E), where V is that the number of nodes and E is that the number of edges.

  # The space complexity of the algorithm is O(V).

  #  Applications

  # Depth-First Search Algorithm has a wide range of applications for practical purposes. Some of them are as discussed below:

  # For finding the strongly connected components of the graph
  # For finding the path
  # To test if the graph is bipartite
  # For detecting cycles in a graph
  # Topological Sorting
  # Solving the puzzle with only one solution.
  # Network Analysis
  # Mapping Routes
  # Scheduling a problem

  #        5
  #   3         7
  # 2   4 ->  8

  graph = {
    '5' : ['3','7'],
    '3' : ['2', '4'],
    '7' : ['8'],
    '2' : [],
    '4' : ['8'],
    '8' : []
  }

  # using set
  visitedSet = set()

  def dfsSet(visitedSet, graph, node):
    if node not in visitedSet:
      print(node)
      visitedSet.add(node)
      for neighbor in graph[node]:
        dfsSet(visitedSet, graph, neighbor)

  print("Depth-First Search with set()")
  dfsSet(visitedSet, graph, '5')

  # using list
  visitedList = []

  def dfs(visitedList: list, graph: dict, node: str):
    if node not in visitedList:
      print(node)
      visitedList.append(node)
      for neighbor in graph[node]:
        dfs(visitedList, graph, neighbor)

  print("Depth-First Search with list()")
  dfs(visitedList, graph, '5')
  print(visitedList)

  # no cycles

  def dfsFind(visited: set, graph: dict, src: str, dst: str) -> bool:
    if src not in visited:
      if src == dst:
        return True
      visited.add(src)
      for neighbor in graph[src]:
        if dfsFind(visited, graph, neighbor, dst):
          return True
    return False

  visited = set()
  print("Depth-First Search Find 8 starting at 5")
  found = dfsFind(visited, graph, '5', '8')
  print(found)

  print("Depth-First Search Find 8 starting at 7")
  found = dfsFind(visited, graph, '7', '8')
  print(found)

  print("Depth-First Search Find 8 starting at 2")
  found = dfsFind(visited, graph, '2', '8')
  print(found)

  visited = set()
  print("Depth-First Search Find 9 starting at 5")
  found = dfsFind(visited, graph, '5', '9')
  print(found)


  print("== Edge list to adjacency list ==")

  edges = [["i", "j"], ["k", "i"], ["m", "k"], ["k", "l"], ["o", "n"]]

  def convertToUndirectedAdjList(edges: list[list[str]], undirected = False) -> dict[str,list[str]]:
    undirectedDict: dict[str, list[str]] = {}
    for edge in edges:
      a,b = edge
      if a not in undirectedDict:
        undirectedDict[a] = []
      undirectedDict[a].append(b)

      # add the other direction
      if undirected:
        if b not in undirectedDict:
          undirectedDict[b] = []
        undirectedDict[b].append(a)
    return undirectedDict

  print("- Undirected adjacency list -")
  print(convertToUndirectedAdjList(edges, True))

  print("- Directed adjacency list -")
  print(convertToUndirectedAdjList(edges, False))

  # cycles


if __name__ == '__main__':
  main()
