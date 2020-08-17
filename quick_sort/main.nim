import ../utils/main

proc partion(arr: var seq[int], left: int, right: int): int =
  let p = abs( (left + right) / 2).toInt
  swap(arr[p], arr[right])
  var store = left
  for i in countup(left, right - 1):
    if arr[i] <= arr[right]: 
      swap(arr[i], arr[store])
      store.inc
  swap(arr[store], arr[right])
  result = store

proc quickSort(arr: var seq[int], left: int, right: int): void =
  if left < right:
    let pi = partion(arr, left, right)
    quickSort(arr, left, pi - 1)
    quickSort(arr, pi + 1, right)

proc sort(arr: var seq[int]): void =
  quickSort(arr, 0, arr.len - 1)

block test:
  var arr = @[1, 2]
  sort(arr)
  assert @[1, 2] == arr

  arr = @[1, 2, 3, 4, 5]
  sort(arr)
  assert @[1, 2, 3, 4, 5] == arr

  arr = @[2, 1]
  sort(arr)
  assert @[1, 2] == arr

  arr = @[5, 4, 3, 2, 1]
  sort(arr)
  assert @[1, 2, 3, 4, 5] == arr

  arr = @[3, 2, 1, 4, 5]
  sort(arr)
  assert @[1, 2, 3, 4, 5] == arr