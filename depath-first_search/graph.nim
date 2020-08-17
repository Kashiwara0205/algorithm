type Color* {.pure.} = enum 
  White, Gray, Black

type Node* = ref object
  number*: int
  pred*: int
  discovered_cnt*: int
  finished_cnt*: int
  color*: Color
  neighbor*: seq[Node]

proc newNode*(number: int): Node =
  return Node(number: number, pred: -1, discovered_cnt: -1, 
              finished_cnt: -1, color: Color.White, neighbor: @[])

type Graph* = ref object
  nodes*: seq[Node]

proc newGraph*(nodes: seq[Node]): Graph =
  return Graph(nodes: nodes)

block test:
  var node_0 = newNode(0)
  assert node_0.number == 0
  assert node_0.pred == -1
  assert node_0.discovered_cnt == -1
  assert node_0.finished_cnt == -1
  assert node_0.color == Color.White
  assert node_0.neighbor == @[]

  let node_1 = newNode(1)
  let node_2 = newNode(2)

  # node_0 - > node_1
  #      |
  #      - >  node_2
  node_0.neighbor = @[node_1, node_2]
  assert node_0.neighbor == @[node_1, node_2]

  # node_0 - > node_1 -
  #      |             |
  #      - >  node_2  <- 
  node_1.neighbor = @[node_2]
  assert node_1.neighbor == @[node_2]

  let graph = newGraph(@[node_0, node_1, node_2])
  assert graph.nodes == @[node_0, node_1, node_2]