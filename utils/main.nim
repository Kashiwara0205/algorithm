proc swap*(arr: var seq[int], i: int, j: int): void
proc insertionSort*(arr: var seq[int]): void
proc enqueue*(arr: var seq[int], val: int): void
proc dequeue*(arr: var seq[int]): void
proc first*(arr: var seq[int]): int

proc swap*(arr: var seq[int], i: int, j: int): void =
  let tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp

proc insert(arr: var seq[int], start_pos: int, value: int) =
  var insert_pos = start_pos
  for i in countdown(start_pos, 0):
    if arr[i] > value:
      arr[i + 1] = arr[i]
      insert_pos = i - 1

  arr[insert_pos + 1] = value

proc insertionSort*(arr: var seq[int]): void =
  for i in countup(1, arr.len - 1):
      insert(arr, i - 1, arr[i])

proc enqueue*(arr: var seq[int], val: int): void = 
  arr.add(val)

proc dequeue*(arr: var seq[int]): void = 
  arr.delete(0)

proc first*(arr: var seq[int]): int =
  return arr[0]