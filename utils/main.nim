proc swap*(arr: var seq[int], i: int, j: int): void =
  let tmp = arr[i]
  arr[i] = arr[j]
  arr[j] = tmp
