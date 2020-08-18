import ./graph_table

proc allPairsShotestPath(graph_table: GraphTable): void =
  let n = graph_table.len
  for i in 0..<n:
    for j in 0..<n:
      for k in 0..<n:
        let new_dist = graph_table[j][i].dist + graph_table[i][k].dist
        if new_dist < graph_table[j][k].dist:
          graph_table[j][k].dist = new_dist
          graph_table[j][k].pred = graph_table[i][k].pred

block test:
  let graph_table = newGraphTable(5)
  graph_table[0][1].dist = 2
  graph_table[0][1].pred = 0

  graph_table[0][4].dist = 4
  graph_table[0][4].pred = 0

  graph_table[1][2].dist = 3
  graph_table[1][2].pred = 1

  graph_table[2][3].dist = 5
  graph_table[2][3].pred = 2

  graph_table[2][4].dist = 1
  graph_table[2][4].pred = 2

  graph_table[3][0].dist = 8
  graph_table[3][0].pred = 3

  graph_table[4][3].dist = 7
  graph_table[4][3].pred = 4

  allPairsShotestPath(graph_table)

  assert 0 == graph_table[0][0].dist
  assert 2 == graph_table[0][1].dist
  assert 5 == graph_table[0][2].dist
  assert 10 == graph_table[0][3].dist
  assert 4 == graph_table[0][4].dist

  assert 16 == graph_table[1][0].dist
  assert 0 == graph_table[1][1].dist
  assert 3 == graph_table[1][2].dist
  assert 8 == graph_table[1][3].dist
  assert 4 == graph_table[1][4].dist

  assert 13 == graph_table[2][0].dist
  assert 15 == graph_table[2][1].dist
  assert 0 == graph_table[2][2].dist
  assert 5 == graph_table[2][3].dist
  assert 1 == graph_table[2][4].dist

  assert 8 == graph_table[3][0].dist
  assert 10 == graph_table[3][1].dist
  assert 13 == graph_table[3][2].dist
  assert 0 == graph_table[3][3].dist
  assert 12 == graph_table[3][4].dist

  assert 15 == graph_table[4][0].dist
  assert 17 == graph_table[4][1].dist
  assert 20 == graph_table[4][2].dist
  assert 7 == graph_table[4][3].dist
  assert 0 == graph_table[4][4].dist
  
  assert -1 == graph_table[0][0].pred
  assert 0 == graph_table[0][1].pred
  assert 1 == graph_table[0][2].pred
  assert 2 == graph_table[0][3].pred
  assert 0 == graph_table[0][4].pred

  assert 3 == graph_table[1][0].pred
  assert -1 == graph_table[1][1].pred
  assert 1 == graph_table[1][2].pred
  assert 2 == graph_table[1][3].pred
  assert 2 == graph_table[1][4].pred

  assert 3 == graph_table[2][0].pred
  assert 0 == graph_table[2][1].pred
  assert -1 == graph_table[2][2].pred
  assert 2 == graph_table[2][3].pred
  assert 2 == graph_table[2][4].pred

  assert 3 == graph_table[3][0].pred
  assert 0 == graph_table[3][1].pred
  assert 1 == graph_table[3][2].pred
  assert -1 == graph_table[3][3].pred
  assert 0 == graph_table[3][4].pred

  assert 3 == graph_table[4][0].pred
  assert 0 == graph_table[4][1].pred
  assert 1 == graph_table[4][2].pred
  assert 4 == graph_table[4][3].pred
  assert -1 == graph_table[4][4].pred