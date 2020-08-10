const HASH_TABLE_SIZE = 5

proc hash(value: int): int = abs(value mod HASH_TABLE_SIZE)

proc loadTable(size: int, arr: seq[int]): seq[seq[int]] =
  var hash_table: seq[seq[int]] = newSeq[seq[int]](HASH_TABLE_SIZE)

  for content in arr:
    let h = hash(content)
    hash_table[h].add(content)

  return hash_table

proc search(arr: seq[int], t: int): bool =
  let h = hash(t)
  let hash_table = loadTable(arr.len, arr)
  
  for val in hash_table[h]:
    if t == val: return true

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
  