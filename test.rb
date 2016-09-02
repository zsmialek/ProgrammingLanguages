def test(str)
  yield "hello"
  puts("bye")
  yield "moo"
end
test {|i| puts("#{i}")}
