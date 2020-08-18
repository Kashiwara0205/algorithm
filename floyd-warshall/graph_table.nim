import algorithm

type Edge* = ref object
  dist*: int
  pred*: int

proc newEdge(): Edge =
  return Edge(dist: high(int), pred: -1)

type GraphTable* = ref object
  table*: seq[seq[Edge]]

proc newGraphTable(node_size: int): GraphTable =
  var table = newSeq[seq[Edge]](node_size)
  table.fill(newSeq[Edge](node_size))

  for i in 0..<node_size:
    for j in 0..<node_size:
      table[i][j] = newEdge()

    table[i][i].dist = 0
    
  return GraphTable(table: table)

block test:
  let graph_table = newGraphTable(2)

  assert 2 == graph_table.table.len
  assert 2 == graph_table.table[0].len

  assert 0 == graph_table.table[0][0].dist
  assert -1 == graph_table.table[0][0].pred

  assert high(int) == graph_table.table[0][1].dist
  assert -1 == graph_table.table[0][1].pred

  assert high(int) == graph_table.table[1][0].dist
  assert -1 == graph_table.table[1][0].pred

  assert 0 == graph_table.table[1][1].dist
  assert -1 == graph_table.table[1][1].pred