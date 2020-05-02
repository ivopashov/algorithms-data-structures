# find number of edits to make two strings same
# sun => fun, replace
# sun => un, remove
# sun => bsun, add

def min_edit_distance(a, b)
  return b.size if a.size.zero?
  return a.size if b.size.zero?

  return min_edit_distance(a[1...a.size], b[1...b.size]) if a[0] == b[0]

  return 1 + [
    min_edit_distance(a[1...a.size], b[1...b.size]),
    min_edit_distance(a, b[1...b.size]),
    min_edit_distance(a[1...a.size], b)
].min
end

p min_edit_distance 'sun', 'fun'
