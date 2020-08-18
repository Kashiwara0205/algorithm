const MAX_DIST* = high(int32)

type Node* = ref object
  number*: int
  pred*: int
  dist*:  int
  neighbor*: seq[Node]

proc newNode*(number: int): Node =
  return Node(number: number, pred: -1, dist: MAX_DIST, neighbor: @[])

type Graph* = ref object
  nodes*: seq[Node]

proc newGraph*(nodes: seq[Node]): Graph =
  return Graph(nodes: nodes)

block test:
  var node_0 = newNode(0)
  assert node_0.number == 0
  assert node_0.pred == -1
  assert node_0.neighbor == @[]
  assert node_0.dist == MAX_DIST

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