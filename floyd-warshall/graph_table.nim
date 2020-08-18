import algorithm

const UPPER_LIMIT = high(int32)

type Edge* = ref object
  dist*: int
  pred*: int

type GraphTable* = seq[seq[Edge]]

proc newEdge(): Edge =
  return Edge(dist: UPPER_LIMIT, pred: -1)

proc newGraphTable*(node_size: int): GraphTable =
  var table = newSeq[seq[Edge]](node_size)
  table.fill(newSeq[Edge](node_size))

  for i in 0..<node_size:
    for j in 0..<node_size:
      table[i][j] = newEdge()

    table[i][i].dist = 0
    
  return table

block test:
  let graph_table = newGraphTable(2)

  assert 2 == graph_table.len
  assert 2 == graph_table[0].len

  assert 0 == graph_table[0][0].dist
  assert -1 == graph_table[0][0].pred

  assert UPPER_LIMIT == graph_table[0][1].dist
  assert -1 == graph_table[0][1].pred

  assert UPPER_LIMIT == graph_table[1][0].dist
  assert -1 == graph_table[1][0].pred

  assert 0 == graph_table[1][1].dist
  assert -1 == graph_table[1][1].pred