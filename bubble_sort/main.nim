proc is_shift(arr: seq[int], i: int, size:int): bool =
  # max array size
  if (size - 1) <= i: return false
  # whether bigger prev_val than next_val
  return arr[i] > arr[i + 1]

proc sort(arr: var seq[int]): seq[int] = 
  for i in countup(0, arr.len):
    for j in countup(0, i + 1):
      if is_shift(arr, j, arr.len):
        # switch contents
        let tmp = arr[j]
        arr[j] = arr[j + 1]
        arr[j + 1] = tmp

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