import 'dart:io';
import 'dart:math';
import 'dart:collection';

final int INT_MAX = 2147483647;

class PriorityQueue<T> {
  List<T> _items = [];
  Comparator<T> _comparator;

  PriorityQueue(this._comparator);

  void enqueue(T item) {
    var i = 0;
    while (i < _items.length && _comparator(_items[i], item) < 0) {
      i++;
    }
    _items.insert(i, item);
  }

  T dequeue() {
    if (_items.isEmpty) {
      throw StateError("Priority queue is empty");
    }
    return _items.removeAt(0);
  }

  bool get isEmpty => _items.isEmpty;
}

class Fragmentation {
  int mtu, payload, header = 20;
  Fragmentation(this.mtu, this.payload);
  int noOfPackets() {
    int n = ((payload - header) / (mtu - header)).ceil();
    return n;
  }
}

class Pair<A, B> {
  final A first;
  final B second;

  Pair(this.first, this.second);
}

void dijkstra(List<List<int>> graph, int src, int dest) {
  int n = graph.length;
  List<int> dist = List.filled(n, INT_MAX);
  List<int> parent = List.filled(n, -1);
  List<bool> visited = List.filled(n, false);
  dist[src] = 0;
  PriorityQueue<Pair<int, int>> pq =
      PriorityQueue<Pair<int, int>>((a, b) => a.first.compareTo(b.first));
  pq.enqueue(Pair<int, int>(0, src));
  while (!pq.isEmpty) {
    int u = pq.dequeue().second;
    if (u == dest) {
      print("\nShortest Distance is ${dist[dest]}\n");
      break;
    }
    if (visited[u]) continue;
    visited[u] = true;
    for (int v = 0; v < n; v++) {
      if (graph[u][v] == INT_MAX) continue;
      int ans = dist[u] + graph[u][v];
      if (ans < dist[v]) {
        dist[v] = ans;
        parent[v] = u;
        pq.enqueue(Pair<int, int>(dist[v], v));
      }
    }
  }
  List<int> path = [];
  int u = dest;
  while (u != -1) {
    path.add(u);
    u = parent[u];
  }
  path = path.reversed.toList();
  for (int z = 0; z < path.length; z++) {
    stdout.write("${path[z]} ");
    if (z < path.length - 1) {
      stdout.write("-> ");
    }
  }
  print("");
}

// List<List<int>> createGraph() {
//   int n;
//   stdout.write("Enter the number of Vertices ->> ");
//   n = int.parse(stdin.readLineSync()!);
//   List<List<int>> graph = List.generate(
//       n, (i) => List.filled(n, 0, growable: false),
//       growable: false);
//   stdout.write("Enter the Adjacency Matrix of the graph ->> \n");
//   for (int i = 0; i < n; i++) {
//     List<int> row =
//         stdin.readLineSync()!.split(" ").map(int.parse).toList(growable: false);
//     for (int j = 0; j < n; j++) {
//       graph[i][j] = row[j];
//     }
//   }
//   stdout.write("Adjacency Matrix of the Graph ->> \n");
//   for (int i = 0; i < n; i++) {
//     for (int j = 0; j < n; j++) {
//       stdout.write("${graph[i][j]} ");
//     }
//     stdout.write("\n");
//   }
//   return graph;
// }

List<List<int>> createGraph() {
  int n, e;
  stdout.write("Enter the number of Vertices ->> ");
  n = int.parse(stdin.readLineSync()!);

  // Initialize adjacency matrix with all values set to infinity
  List<List<int>> graph = List.generate(n, (_) => List.filled(n, INT_MAX));

  // Set diagonal values to 0
  for (int i = 0; i < n; i++) {
    graph[i][i] = 0;
  }

  stdout.write("Enter the number of Edges ->> ");
  e = int.parse(stdin.readLineSync()!);

  // Read edges and update adjacency matrix
  for (int i = 0; i < e; i++) {
    int source, destination, weight;
    stdout.write("Enter Source, Destination and Weight of Edge ${i + 1} ->> ");
    List<String> input = stdin.readLineSync()!.split(" ");
    source = int.parse(input[0]);
    destination = int.parse(input[1]);
    weight = int.parse(input[2]);
    graph[source][destination] = weight;
  }

  stdout.write("Adjacency Matrix of the Graph ->> \n");
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (graph[i][j] == INT_MAX) {
        stdout.write("$INT_MAX ");
      } else {
        stdout.write("${graph[i][j]} ");
      }
    }
    stdout.write("\n");
  }
  return graph;
}

void main() {
  int mtu, payload;
  print("Enter the value of MTU ->> ");
  mtu = int.parse(stdin.readLineSync()!);
  print("Enter the value of payload(including header size) ->> ");
  payload = int.parse(stdin.readLineSync()!);
  Fragmentation fragments = Fragmentation(mtu, payload);
  int packet_size = fragments.noOfPackets();
  print("Packet Size ->> $packet_size\n");
  List<List<int>> graph = createGraph();
  int choice;
  for (int j = 0; j < packet_size; j++) {
    print("Do you to create a new topology? \n(0 ->>  NO\n1 ->> YES) \n->> ");
    choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      List<List<int>> new_graph = createGraph();
      int src, dst;
      print("Enter source for packet $j ->> ");
      src = int.parse(stdin.readLineSync()!);
      print("Enter destination for packet $j ->> ");
      dst = int.parse(stdin.readLineSync()!);
      print("\nFor node $j the shortest path is ->> ");
      dijkstra(new_graph, src, dst);
      graph = new_graph;
    } else {
      int src, dst;
      print("Enter source for packet $j ->> ");
      src = int.parse(stdin.readLineSync()!);
      print("Enter destination for packet $j ->> ");
      dst = int.parse(stdin.readLineSync()!);
      print("\nFor node $j the shortest path is ->> ");
      dijkstra(graph, src, dst);
    }
  }
}
