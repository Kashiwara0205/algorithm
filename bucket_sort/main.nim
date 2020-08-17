import ../utils/main

proc hash(value: int): int = abs(value / 3).toInt

proc extract(bucket: var seq[seq[int]], arr: var seq[int]):void =
  var idx = 0
  for i in countup(0, arr.len - 1):
    insertionSort(bucket[i])
    for conetent in bucket[i]: 
      arr[idx] = conetent
      idx.inc

proc sort(arr: var seq[int]): void =
  # make bucket
  var bucket:seq[seq[int]]
  for i in 0..max(arr): bucket.add(@[])
  for i in 0..arr.len - 1: 
    let k = hash(arr[i])
    bucket[k].add([arr[i]])

  extract(bucket, arr)

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
