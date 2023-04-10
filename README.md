# IPv4 Fragmentation and Shortest Path Algorithm

This is a Dart program that allows the user to implement the IPv4 fragmentation and shortest path algorithm. The program takes user inputs of MTU (Maximum Transmission Unit) and payload, and then computes the number of packets required for the given payload size and MTU. The program also allows the user to specify a network topology and find the shortest path between two nodes using Dijkstra's algorithm.

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
Enter the value of MTU: 1500
Enter the value of payload (including header size): 1480
Do you want a new topology (if yes press 1, if no press 0): 1
Enter the number of vertices: 4
Enter the number of edges: 4
Enter edge 0 (source destination weight): 0 1 2
Enter edge 1 (source destination weight): 0 2 4
Enter edge 2 (source destination weight): 1 2 1
Enter edge 3 (source destination weight): 2 3 3
Enter source for packet 0: 0
Enter destination for packet 0: 3
For node 0 the shortest path is:
0 -> 1 -> 2 -> 3
Do you want a new topology (if yes press 1, if no press 0): 0
Enter source for packet 1: 1
Enter destination for packet 1: 3
For node 1 the shortest path is:
1 -> 2 -> 3
```
