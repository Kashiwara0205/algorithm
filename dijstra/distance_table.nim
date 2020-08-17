import ./graph
import tables

type Edge = tuple[source: int, destination: int]
type DistanceTable* = ref object
  table*: Table[Edge, int]

proc addDistance*(distance_table: DistanceTable, source_node: Node, destination_node: Node, distance: int): void =
  let edge: tuple[source: int, destination: int] = (source_node.number, destination_node.number)
  distance_table.table[edge] = distance

proc getDistance*(distance_table: DistanceTable, source_node: Node, destination_node: Node): int =
  let edge: tuple[source: int, destination: int] = (source_node.number, destination_node.number)
  return distance_table.table[edge]

proc newDistanceTable*(): DistanceTable =
  let table = initTable[Edge, int]()
  return DistanceTable(table: table)

block test:
  let distance_table = newDistanceTable()
  var node_0 = newNode(0)
  var node_1 = newNode(1)

  #        20
  # node_0 -> node_1
  distance_table.addDistance(node_0, node_1, 20)
  assert 20 == distance_table.getDistance(node_0, node_1)