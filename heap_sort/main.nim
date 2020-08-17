import ../utils/main

proc heapfiy(arr: var seq[int], idx: int, max: int): void =
  let 
    left = 2 * idx + 1
    right = 2 * idx + 2

  var largest = idx
  if left < max and arr[left] > arr[idx]: largest = left
  if right < max and arr[right] > arr[largest]: largest = right
  if largest != idx:
    swap(arr[idx], arr[largest])
    heapfiy(arr, largest, max)

proc buildHeap(arr: var seq[int]): void =
  let n = arr.len
  for i in countdown(abs(n / 2 - 1).toInt, 0):
    heapfiy(arr, i, n)
  
proc sort(arr: var seq[int]): void =
  buildHeap(arr)
  let n = arr.len
  for i in countdown(n-1, 1):
    swap(arr[0], arr[i])
    heapfiy(arr, 0, i)

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
