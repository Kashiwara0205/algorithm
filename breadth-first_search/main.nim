import ./graph
import ../utils/main

proc visit(nodes: seq[Node], queue: var seq[int]): void = 
  while queue.len != 0:
    let source_node = nodes[queue.first]
    for node in source_node.neighbor:
      if node.color == Color.White:
          node.dist = source_node.dist + 1
          node.pred = source_node.number
          node.color = Color.Gray
          queue.enqueue(node.number)

    discard queue.dequeue
    source_node.color = Color.Black

proc breadthFirstSearch(graph: Graph, start: int): void = 
  let nodes = graph.nodes
  nodes[start].color = Color.Gray
  nodes[start].dist = 0
  var queue: seq[int]
  queue.enqueue(start)

  visit(nodes, queue)

block test:
  let 
    node_0 = newNode(0)
    node_1 = newNode(1)
    node_2 = newNode(2)
    node_3 = newNode(3)
    node_4 = newNode(4)
    node_5 = newNode(5)
    node_6 = newNode(6)
    node_7 = newNode(7)
    node_8 = newNode(8)
  
  node_0.neighbor = @[node_1, node_2]
  node_1.neighbor = @[node_0, node_3]
  node_2.neighbor = @[node_0, node_4, node_5]
  node_3.neighbor = @[node_1, node_5, node_6]
  node_4.neighbor = @[node_2]
  node_5.neighbor = @[node_2, node_2, node_3]
  node_6.neighbor = @[node_3]

  node_7.neighbor = @[node_8]
  node_8.neighbor = @[node_7]

  let graph = newGraph(@[node_0, node_1, node_2, node_3, node_4, node_5, node_6, node_7, node_8])

  breadthFirstSearch(graph, 0)

  assert 0 == graph.nodes[0].number
  assert -1 == graph.nodes[0].pred
  assert 0 == graph.nodes[0].dist

  assert 1 == graph.nodes[1].number
  assert 0 == graph.nodes[1].pred
  assert 1 == graph.nodes[1].dist

  assert 2 == graph.nodes[2].number
  assert 0 == graph.nodes[2].pred
  assert 1 == graph.nodes[2].dist

  assert 3 == graph.nodes[3].number
  assert 1 == graph.nodes[3].pred
  assert 2 == graph.nodes[3].dist

  assert 4 == graph.nodes[4].number
  assert 2 == graph.nodes[4].pred
  assert 2 == graph.nodes[4].dist

  assert 5 == graph.nodes[5].number
  assert 2 == graph.nodes[5].pred
  assert 2 == graph.nodes[5].dist

  assert 6 == graph.nodes[6].number
  assert 3 == graph.nodes[6].pred
  assert 3 == graph.nodes[6].dist

  assert 7 == graph.nodes[7].number
  assert -1 == graph.nodes[7].pred
  assert high(int) == graph.nodes[7].dist

  assert 8 == graph.nodes[8].number
  assert -1 == graph.nodes[8].pred
  assert high(int) == graph.nodes[8].dist