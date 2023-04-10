# IPv4 Fragmentation and Shortest Path Algorithm

This program implements Dijkstra's shortest path algorithm to find the shortest path between two given nodes in a directed graph with non-negative edge weights. The user can input the graph as an adjacency matrix, or as a list of edges with weights.

The program first creates the graph using the `createGraph` function. It prompts the user to enter the number of vertices and edges, and then reads in the edges and weights. It initializes the adjacency matrix with all values set to infinity, and sets diagonal values to 0. It then updates the matrix with the input edges and weights.

The program then prompts the user to enter the source and destination nodes. It calls the `dijkstra` function with the graph, source, and destination as parameters. The `dijkstra` function implements Dijkstra's algorithm to find the shortest path between the source and destination nodes. It uses a priority queue to keep track of the nodes with the shortest distance from the source node.

The `noOfPackets` function is used to calculate the number of packets required to send a given payload size with a given MTU size.

## Input
The user inputs the following parameters:

***MTU (maximum transmission unit)*** - an integer representing the maximum size of a packet in bytes

***Payload*** - an integer representing the size of the payload in bytes

***vertices*** - an integer representing the number of vertices in the graph

***edges*** - an integer representing the number of edges in the graph

***source*** - an integer representing the source node for the shortest path calculation

***destination*** - an integer representing the destination node for the shortest path calculation

***edge list*** - a list of edges tuples, where each tuple contains three integers: the source node, destination node, and edge weight

## Output
The program outputs the following:

The shortest distance between the source and destination nodes
The shortest path between the source and destination nodes
The number of packets required to send the given payload size with the given MTU size

## Prerequisites
Dart SDK installed on your machine

## How to Run
1. Clone the repository or download the code.
2. Open the terminal and navigate to the project directory.
3. Run the following command to execute the program:

```dart
dart main.dart
```
4. Follow the prompts in the terminal to enter the required inputs and test the program.

## Test Input
To test the program, you can use the following input:

```
Enter the value of MTU ->>
500
Enter the value of payload(including header size) ->>
3000
Packet Size ->> 7

Enter the number of Vertices ->> 6
Enter the number of Edges ->> 8
Enter Source, Destination and Weight of Edge 1 ->> 0 1 7
Enter Source, Destination and Weight of Edge 2 ->> 0 2 12
Enter Source, Destination and Weight of Edge 3 ->> 1 2 2
Enter Source, Destination and Weight of Edge 4 ->> 1 3 9
Enter Source, Destination and Weight of Edge 5 ->> 2 4 10
Enter Source, Destination and Weight of Edge 6 ->> 3 4 4
Enter Source, Destination and Weight of Edge 7 ->> 3 5 1
Enter Source, Destination and Weight of Edge 8 ->> 4 5 5
Adjacency Matrix of the Graph ->> 
0 7 12 2147483647 2147483647 2147483647 
2147483647 0 2 9 2147483647 2147483647 
2147483647 2147483647 0 2147483647 10 2147483647 
2147483647 2147483647 2147483647 0 4 1 
2147483647 2147483647 2147483647 2147483647 0 5 
2147483647 2147483647 2147483647 2147483647 2147483647 0 
Do you to create a new topology? 
(0 ->>  NO
1 ->> YES) 
->> 
0
Enter source for packet 0 ->> 
2
Enter destination for packet 0 ->> 
5

For node 0 the shortest path is ->> 

Shortest Distance is 15

2 -> 4 -> 5
Do you to create a new topology?
(0 ->>  NO
1 ->> YES)
->>

```
