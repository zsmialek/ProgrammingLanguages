class Access < Array
  def [](ind)
    self.fetch(ind)
  end
end

x = Access.new([10,2,3,4,5])

puts(x[0])
