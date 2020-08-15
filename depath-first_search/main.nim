import ./graph

proc dfsVisit(node: Node, counter: var int): void =
  node.color = Color.Gray
  inc(counter)
  node.discovered_cnt = counter
  for x in node.neighbor:
    if x.color == Color.White:
      x.pred = node.number
      dfsVisit(x, counter)

  node.color = Color.Black
  inc(counter)
  node.finished_cnt = counter

proc depathFirstSearch(graph: Graph, start: int): void =
  var counter = 0
  let node = graph.nodes[start]
  dfsVisit(node, counter)

  for x in graph.nodes:
    if x.color == Color.White:
      dfsVisit(x, counter)

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
  
  node_0.neighbor = @[node_1, node_4]
  node_1.neighbor = @[node_0, node_2]
  node_2.neighbor = @[node_3, node_6]
  node_3.neighbor = @[node_2, node_4]
  node_4.neighbor = @[node_0, node_3, node_5]
  node_5.neighbor = @[node_4]
  node_6.neighbor = @[node_2]

  node_7.neighbor = @[node_8]
  node_8.neighbor = @[node_7]

  let graph = newGraph(@[node_0, node_1, node_2, node_3, node_4, node_5, node_6, node_7, node_8]) 

  depathFirstSearch(graph, 0)

  assert 0 == graph.nodes[0].number
  assert -1 == graph.nodes[0].pred
  assert 1 == graph.nodes[0].discovered_cnt
  assert 14 == graph.nodes[0].finished_cnt

  assert 1 == graph.nodes[1].number
  assert 0 == graph.nodes[1].pred
  assert 2 == graph.nodes[1].discovered_cnt
  assert 13 == graph.nodes[1].finished_cnt

  assert 2 == graph.nodes[2].number
  assert 1 == graph.nodes[2].pred
  assert 3 == graph.nodes[2].discovered_cnt
  assert 12 == graph.nodes[2].finished_cnt

  assert 3 == graph.nodes[3].number
  assert 2 == graph.nodes[3].pred
  assert 4 == graph.nodes[3].discovered_cnt
  assert 9 == graph.nodes[3].finished_cnt

  assert 4 == graph.nodes[4].number
  assert 3 == graph.nodes[4].pred
  assert 5 == graph.nodes[4].discovered_cnt
  assert 8 == graph.nodes[4].finished_cnt

  assert 5 == graph.nodes[5].number
  assert 4 == graph.nodes[5].pred
  assert 6 == graph.nodes[5].discovered_cnt
  assert 7 == graph.nodes[5].finished_cnt

  assert 6 == graph.nodes[6].number
  assert 2 == graph.nodes[6].pred
  assert 10 == graph.nodes[6].discovered_cnt
  assert 11 == graph.nodes[6].finished_cnt

  assert 7 == graph.nodes[7].number
  assert -1 == graph.nodes[7].pred
  assert 15 == graph.nodes[7].discovered_cnt
  assert 18 == graph.nodes[7].finished_cnt

  assert 8 == graph.nodes[8].number
  assert 7 == graph.nodes[8].pred
  assert 16 == graph.nodes[8].discovered_cnt
  assert 17 == graph.nodes[8].finished_cnt