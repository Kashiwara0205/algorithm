proc swap(arr: var seq[int], i: int, j: int): void =
  let tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp

proc partion(arr: var seq[int], left: int, right: int): int =
  let p = abs( (left + right) / 2).toInt
  swap(arr, p, right)
  var store = left
  for i in countup(left, right - 1):
    if arr[i] <= arr[right]: 
      swap(arr, i, store)
      inc(store)
  swap(arr, store, right)
  result = store

proc quickSort(arr: var seq[int], left: int, right: int): void =
  if left < right:
    let pi = partion(arr, left, right)
    quickSort(arr, left, pi - 1)
    quickSort(arr, pi + 1, right)

proc sort(arr: var seq[int]): seq[int] =
  quickSort(arr, 0, arr.len - 1)
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