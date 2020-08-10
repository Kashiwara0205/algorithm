import math
import tables
import std/sha1
from strformat import fmt

proc hash(value: int): string = $secureHash(fmt"{(value)}")

proc loadTable(size: int, arr: seq[int]): Table[string, int] =
  var hash_table: Table[string,int] = initTable[string, int]()
  for val in arr: hash_table[hash(val)] = val

  return hash_table

proc search(arr: seq[int], t: int): bool =
  let hash_table = loadTable(arr.len, arr)

  return hash_table.hasKey(hash(t))

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
  