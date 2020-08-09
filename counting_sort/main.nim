proc sort(arr: var seq[int]): void =
  # make bucket
  var bucket:seq[int]
  for i in 0..max(arr): bucket.add(0)
  for i in 0..arr.len - 1: inc(bucket[arr[i]])

  var idx = 0
  let k = bucket.len
  for i in countup(0, k - 1):
    while(bucket[i] > 0): 
      arr[idx] = i
      inc(idx)
      dec(bucket[i])

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
