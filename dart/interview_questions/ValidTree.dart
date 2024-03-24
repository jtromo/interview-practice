import 'dart:collection';

typedef CheckCycle(int n, List<bool> visited, List<List<int>> edges);

void main() {
  bool dfsCycleFound(
      int from, int to, List<bool> visited, List<List<int>> adjacencyList) {
    if (visited[to]) return true;
    visited[to] = true;
    // Check each edge in adjacency list.
    for (int index in adjacencyList[to]) {
      if (index != from && dfsCycleFound(to, index, visited, adjacencyList)) {
        return true;
      }
    }
    return false;
  }

  bool dfs(int n, List<bool> visited, List<List<int>> edges) {
    // Fill adjacencyList with an entry for the number of nodes.
    final adjacencyList = new List<List<int>>.generate(n, (i) => []);

    for (List<int> edge in edges) {
      adjacencyList[edge[0]].add(edge[1]);
      adjacencyList[edge[1]].add(edge[0]);
    }
    return dfsCycleFound(-1, 0, visited, adjacencyList);
  }

  // Determine if contains a cycle.
  bool bfs(int n, List<bool> visited, List<List<int>> edges) {
    // Fill adjacencyList with an entry for the number of nodes.
    final adjacencyList = new List<Set<int>>.generate(n, (i) => new Set<int>());

    for (List<int> edge in edges) {
      adjacencyList[edge[0]].add(edge[1]);
      adjacencyList[edge[1]].add(edge[0]);
    }
    
    final queue = new ListQueue<int>.from([0]);
    while(queue.isNotEmpty) {
      int first = queue.removeFirst();
      if (visited[first]) return true;
      visited[first] = true;
      
      for (int index in adjacencyList[first]) {
        if (index != null) {
          queue.addLast(index);
          adjacencyList[index].remove(first);
        }
      }
    }
    return false;
  }
  
  // Determine if contains a cycle.
  bool dfsIterative(int n, List<bool> visited, List<List<int>> edges) {
    // Fill adjacencyList with an entry for the number of nodes.
    final adjacencyList = new List<Set<int>>.generate(n, (i) => new Set<int>());

    for (List<int> edge in edges) {
      adjacencyList[edge[0]].add(edge[1]);
      adjacencyList[edge[1]].add(edge[0]);
    }
    
    final queue = new ListQueue<int>.from([0]);
    while(queue.isNotEmpty) {
      int first = queue.removeFirst();
      if (visited[first]) return true;
      visited[first] = true;
      
      for (int index in adjacencyList[first]) {
        if (index != null) {
          queue.addFirst(index);
          adjacencyList[index].remove(first);
        }
      }
    }
    return false;
  }

  bool validTree(int n, List<List<int>> edges, {CheckCycle checkCycle}) {
    if (edges.length < 1) return false;
    final visited = new List<bool>.filled(n, false);

    // Check if cycles exist.
    if (checkCycle?.call(n, visited, edges) ?? dfs(n, visited, edges)) {
      print('Cycle exists.');
      return false;
    }

    // Check if all the nodes were visited.
    return (visited.fold(0, (prev, isVisited) => (isVisited ? 1 : 0) + prev) - n) == 0;
  }

  try {
    print('====== Depth First Search ======');
    print(
        'validTree1: ${validTree(5, [[0,1],[0,2],[0,3],[1,4]], checkCycle: dfs)}');
    print('validTree2: ${validTree(5, [[0,1],[1,2],[2,3],[1,3],[1,4]])}');
    print('validTree3: ${validTree(5, [[0,1],[0,2],[2,3],[2,4]])}');
    print(
        'validTree1: ${validTree(5, [[0,1],[0,2],[0,3],[1,4]], checkCycle: dfsIterative)}');
    print('validTree2: ${validTree(5, [[0,1],[1,2],[2,3],[1,3],[1,4]], checkCycle: dfsIterative)}');
    print('validTree3: ${validTree(5, [[0,1],[0,2],[2,3],[2,4]], checkCycle: dfsIterative)}');

    print('===== Breadth First Search =====');
    print(
        'validTree1: ${validTree(5, [[0,1],[0,2],[0,3],[1,4]], checkCycle: bfs)}');
    print(
        'validTree2: ${validTree(5, [[0,1],[1,2],[2,3],[1,3],[1,4]], checkCycle: bfs)}');
    print(
        'validTree3: ${validTree(5, [[0,1],[0,2],[2,3],[2,4]], checkCycle: bfs)}');
  } catch (e, st) {
    print(st);
  }
}