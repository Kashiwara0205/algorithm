import ./graph
import ./distance_table

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

  let distance_table = newDistanceTable()
  distance_table.addDistance(node_0, node_1, 2)
  distance_table.addDistance(node_0, node_4, 4)
  distance_table.addDistance(node_1, node_2, 3)
  distance_table.addDistance(node_2, node_4, 1)
  distance_table.addDistance(node_2, node_3, 5)
  distance_table.addDistance(node_3, node_0, 8)
  distance_table.addDistance(node_4, node_3, 7)