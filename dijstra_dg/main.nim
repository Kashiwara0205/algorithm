import ./graph
import ./distance_table
import ../utils/main

proc getMinDistNode(nodes: seq[Node]): Node =
  var min_dist_node: Node = nil
  var sd = UPPER_LIMIT
  
  for node in nodes:
    if(not node.visited and node.dist < sd):
      sd = node.dist
      min_dist_node = node

  return min_dist_node

proc visit(nodes: seq[Node], table: DistanceTable): void =
  while true:
    let min_dist_node = getMinDistNode(nodes)

    if min_dist_node == nil: return 
    min_dist_node.visited = true

    for node in min_dist_node.neighbor:
      let w = table.getDistance(min_dist_node, node)
      let new_dist = min_dist_node.dist + w
      if new_dist < node.dist:
        node.dist = new_dist
        node.pred = min_dist_node.number
  
proc singleSourceShortest(graph: Graph, table: DistanceTable, start: int): void =
  var priority_queue: seq[int]
  let nodes = graph.nodes
  nodes[start].dist = 0
  priority_queue.enqueue(0)

  visit(nodes, table)

block test:
  let
    node_0 = newNode(0)
    node_1 = newNode(1)
    node_2 = newNode(2)
    node_3 = newNode(3)
    node_4 = newNode(4)

  node_0.neighbor = @[node_1, node_4]
  node_1.neighbor = @[node_2]
  node_2.neighbor = @[node_3, node_4]
  node_3.neighbor = @[node_0]
  node_4.neighbor = @[node_3]

  let graph = newGraph(@[node_0, node_1, node_2, node_3, node_4])

  let distance_table = newDistanceTable()
  distance_table.addDistance(node_0, node_1, 2)
  distance_table.addDistance(node_0, node_4, 4)
  distance_table.addDistance(node_1, node_2, 3)
  distance_table.addDistance(node_2, node_4, 1)
  distance_table.addDistance(node_2, node_3, 5)
  distance_table.addDistance(node_3, node_0, 8)
  distance_table.addDistance(node_4, node_3, 7)

  singleSourceShortest(graph, distance_table, 0)

  assert 0 == graph.nodes[0].number
  assert -1 == graph.nodes[0].pred
  assert 0 == graph.nodes[0].dist
  assert true == graph.nodes[0].visited

  assert 1 == graph.nodes[1].number
  assert 0 == graph.nodes[1].pred
  assert 2 == graph.nodes[1].dist
  assert true == graph.nodes[1].visited

  assert 2 == graph.nodes[2].number
  assert 1 == graph.nodes[2].pred
  assert 5 == graph.nodes[2].dist
  assert true == graph.nodes[2].visited

  assert 3 == graph.nodes[3].number
  assert 2 == graph.nodes[3].pred
  assert 10 == graph.nodes[3].dist
  assert true == graph.nodes[3].visited

  assert 4 == graph.nodes[4].number
  assert 0 == graph.nodes[4].pred
  assert 4 == graph.nodes[4].dist
  assert true == graph.nodes[4].visited