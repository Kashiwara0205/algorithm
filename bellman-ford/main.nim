import ./graph
import ./distance_table

proc visit(nodes: seq[Node], table: DistanceTable): void =
  let n = nodes.len
  for i in 1..n:
    var leave_early = true
    for j in 0..<n:
      let from_node = nodes[j]
      for node in from_node.neighbor:
        let w = table.getDistance(from_node, node)
        let new_dist = from_node.dist + w
        if new_dist < node.dist:
          if i == n: raise newException(OverflowError, "Graph has negative cycle")
          node.dist = new_dist
          node.pred = from_node.number
          leave_early = false

    if leave_early: break
    
proc singleSourceShortest(graph: Graph, table: DistanceTable, start: int): void =
  let nodes = graph.nodes
  nodes[start].dist = 0

  visit(nodes, table)

block test:
  let
    node_0 = newNode(0)
    node_1 = newNode(1)
    node_2 = newNode(2)
    node_3 = newNode(3)
    node_4 = newNode(4)

  node_0.neighbor = @[node_4]
  node_1.neighbor = @[node_3]
  node_2.neighbor = @[node_1]
  node_3.neighbor = @[node_2]
  node_4.neighbor = @[node_1, node_3]

  let graph = newGraph(@[node_0, node_4, node_1, node_3, node_2])

  let distance_table = newDistanceTable()
  distance_table.addDistance(node_0, node_4, 2)
  distance_table.addDistance(node_1, node_3, -2)
  distance_table.addDistance(node_2, node_1, -3)
  distance_table.addDistance(node_3, node_2, 6)
  distance_table.addDistance(node_4, node_1, 5)
  distance_table.addDistance(node_4, node_3, 4)

  try:
    singleSourceShortest(graph, distance_table, 0)
  except:
    echo "Error:"
    echo getCurrentExceptionMsg()

  assert 0 == graph.nodes[0].number
  assert 0 == graph.nodes[0].dist
  assert -1 == graph.nodes[0].pred

  assert 4 == graph.nodes[1].number
  assert 2 == graph.nodes[1].dist
  assert 0 == graph.nodes[1].pred

  assert 1 == graph.nodes[2].number
  assert 7 == graph.nodes[2].dist
  assert 4 == graph.nodes[2].pred

  assert 3 == graph.nodes[3].number
  assert 5 == graph.nodes[3].dist
  assert 1 == graph.nodes[3].pred

  assert 2 == graph.nodes[4].number
  assert 11 == graph.nodes[4].dist
  assert 3 == graph.nodes[4].pred