proc swap*(arr: var seq[int], i: int, j: int): void
proc insertionSort*(arr: var seq[int]): void

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