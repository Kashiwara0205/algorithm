import ../graph/main

block test:
  let node_0 = newNode(0)
  let node_1 = newNode(1)
  let node_2 = newNode(2)
  let node_3 = newNode(3)
  let node_4 = newNode(4)
  let node_5 = newNode(5)
  let node_6 = newNode(6)
  let node_7 = newNode(7)
  let node_8 = newNode(8)
  
  node_0.neighbor = @[node_1, node_4]
  node_1.neighbor = @[node_0, node_2]
  node_2.neighbor = @[node_3, node_6]
  node_3.neighbor = @[node_2, node_4]
  node_4.neighbor = @[node_0, node_3, node_5]
  node_5.neighbor = @[node_4]
  node_6.neighbor = @[node_2]

  node_7.neighbor = @[node_8]
  node_8.neighbor = @[node_7]

  let graph = 
    newGraph(@[node_0, node_1, node_2, node_3, node_4, node_5, node_6, node_7, node_8]) 