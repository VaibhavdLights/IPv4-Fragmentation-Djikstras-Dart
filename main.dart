import 'dart:io';

class Graph {
  final int numVertices;
  late List<List<Edge>> adjacencyList;

  Graph(this.numVertices) {
    adjacencyList = List.generate(numVertices, (index) => []);
  }

  void addEdge(int source, int destination, int weight) {
    Edge edge = Edge(destination, weight);
    adjacencyList[source].add(edge);
  }
}

class Edge {
  late int destination;
  late int weight;

  Edge(this.destination, this.weight);
}

class Fragmentation {
  int mtu;
  int payload;
  int header = 20;

  Fragmentation(this.mtu, this.payload);

  int noOfPackets() {
    int n = ((payload - header) / (mtu - header)).ceil();
    return n;
  }
}

List<List<int>> createGraph() {
  int numVertices = int.parse(stdin.readLineSync()!);
  int numEdges = int.parse(stdin.readLineSync()!);

  Graph graph = Graph(numVertices);

  for (int i = 0; i < numEdges; i++) {
    List<String> edgeInput = stdin.readLineSync()!.split(' ');
    int source = int.parse(edgeInput[0]);
    int destination = int.parse(edgeInput[1]);
    int weight = int.parse(edgeInput[2]);

    graph.addEdge(source, destination, weight);
  }

  return graph.adjacencyList.map((edges) => edges.map((edge) => edge.destination).toList()).toList();
}

List<int> dijkstra(List<List<int>> adjacencyList, int source, int destination) {
  int numVertices = adjacencyList.length;
  List<int> distances = List.filled(numVertices, 2147483647);
  List<bool> visited = List.filled(numVertices, false);

  distances[source] = 0;

  for (int i = 0; i < numVertices - 1; i++) {
    int minDistance = 2147483647;
    int minVertex = -1;

    for (int j = 0; j < numVertices; j++) {
      if (!visited[j] && distances[j] < minDistance) {
        minDistance = distances[j];
        minVertex = j;
      }
    }

    visited[minVertex] = true;

    if (minVertex == destination) {
      break;
    }

    for (int edge in adjacencyList[minVertex]) {
      int newDistance = distances[minVertex] + 1;
      if (newDistance < distances[edge]) {
        distances[edge] = newDistance;
      }
    }
  }

  return distances;
}

void main() {
  int mtu, payload;

  stdout.write('Enter the value of MTU ->> ');
  mtu = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the value of payload (including header size) ->> ');
  payload = int.parse(stdin.readLineSync()!);

  Fragmentation fragments = Fragmentation(mtu, payload);
  int packetSize = fragments.noOfPackets();
  List<List<int>> graph = [];

  for (int i = 0; i < packetSize; i++) {
    int choice;
    stdout.write('Do you want to create a new topology?\n1.Yes(1)\n2.No(0)\n->> ');
    choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      List<List<int>> newGraph = createGraph();
      int src, dst;
      stdout.write('Enter source for packet $i ->> ');
      src = int.parse(stdin.readLineSync()!);
      stdout.write('Enter destination for packet $i->> ');
      dst = int.parse(stdin.readLineSync()!);

      print('For node $i the shortest path is ->> ');
      dijkstra(newGraph, src, dst);
      graph = newGraph;
    } else {
      int src, dst;
      stdout.write('Enter source for packet $i ->> ');
      src = int.parse(stdin.readLineSync()!);
      stdout.write('Enter destination for packet $i ->> ');
      dst = int.parse(stdin.readLineSync()!);

      print('For node $i the shortest path is ->> ');
      dijkstra(graph, src, dst);
    }
  }
}