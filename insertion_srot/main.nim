proc insert(arr: var seq[int], start_pos: int, value: int) =
  var insert_pos = start_pos
  for i in countdown(start_pos, 0):
    if arr[i] > value:
      arr[i + 1] = arr[i]
      insert_pos = i - 1

  arr[insert_pos + 1] = value

proc sort(arr: var seq[int]): seq[int] =
  for i in countup(1, arr.len - 1):
      insert(arr, i - 1, arr[i])

  result = arr

block test:
  var arr = @[1, 2]
  assert @[1, 2] == sort(arr)

  arr = @[1, 2, 3, 4, 5]
  assert @[1, 2, 3, 4, 5] == sort(arr)

  arr = @[2, 1]
  assert @[1, 2] == sort(arr)

  arr = @[5, 4, 3, 2, 1]
  assert @[1, 2, 3, 4, 5] == sort(arr)

  arr = @[3, 2, 1, 4, 5]
  assert @[1, 2, 3, 4, 5] == sort(arr)