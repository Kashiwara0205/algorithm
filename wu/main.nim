import algorithm

type Wu = ref object
  a*: string
  b*: string
  a_len*: int
  b_len*: int

proc snake(diff: Wu, k: int, y: var int): int
proc getEditDistance*(diff: Wu): int

proc createOnpDiff(a: string, b: string): Wu =
  if a.len >= b.len:
    return Wu(a: a, b: b, a_len: a.len, b_len: b.len)
  else:
    # if "b" bigger than "a" then switch position.
    return Wu(a: b, b: a, a_len: b.len, b_len: a.len)

proc getEditDistance*(diff: Wu): int =
  let offset = diff.a_len + 1
  let delta = diff.b_len - diff.a_len
  let size = diff.a_len + diff.b_len + 3
  var fp = newSeq[int](size)
  fp.fill(-1)
  var p = -1

  while true:
    inc(p)

    for k in countup(-p, delta - 1):
      var m = max(fp[k - 1 + offset] + 1, fp[k + 1 + offset])
      fp[k + offset] = diff.snake(k, m)

    for k in countdown(delta + p, delta + 1):
      var m = max(fp[k - 1 + offset] + 1, fp[k + 1 + offset])
      fp[k + offset] = diff.snake(k, m)

    var m = max(fp[delta - 1 + offset] + 1, fp[delta + 1 + offset])
    fp[delta + offset] = diff.snake(delta, m)

    if(fp[delta + offset] == diff.b_len): break

  return delta + 2 * p

proc snake(diff: Wu, k: int, y: var int): int =
  var x = y - k
  while(x < diff.a_len and y < diff.b_len and diff.a[x] == diff.b[y]):
    inc(x)
    inc(y)

  return y

block test:
  var diff = createOnpDiff("a", "b")
  assert diff.a == "a"
  assert diff.b == "b"
  assert diff.a_len == 1
  assert diff.b_len == 1
  assert diff.getEditDistance() == 2

  diff = createOnpDiff("a", "a")
  assert diff.a == "a"
  assert diff.b == "a"
  assert diff.a_len == 1
  assert diff.b_len == 1
  assert diff.getEditDistance() == 0

  diff = createOnpDiff("books", "animals")
  assert diff.a == "animals"
  assert diff.b == "books"
  assert diff.a_len == 7
  assert diff.b_len == 5
  assert diff.b_len == 5
  assert diff.getEditDistance() == 6

  diff = createOnpDiff("abcdef", "dacfea")
  assert diff.a == "abcdef"
  assert diff.b == "dacfea"
  assert diff.a_len == 6
  assert diff.b_len == 6
  assert diff.getEditDistance() == 6
