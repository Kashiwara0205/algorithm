iterator compareIter(arr: seq[int], t: int): bool =  
  for content in arr: yield(content == t)

proc search(arr: seq[int], t: int): bool =
  for content in compareIter(arr, t): 
    if content: return true
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