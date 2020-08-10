proc search(arr: seq[int], t: int): bool =
  var 
    low = 0
    high = arr.len - 1

  while low <= high:
    let ix = abs( (low + high) / 2).toInt
    if t == arr[ix]: return true
    if t < arr[ix]: high = ix - 1 else: low = ix + 1

  return false

block test:
  var c = @[1, 2, 3]
  var t = 1
  assert true == search(c, t)

  c = @[1, 2, 3, 4, 5]
  t = 10
  assert false == search(c, t)

  c = @[]
  t = 1
  assert false == search(c, t)