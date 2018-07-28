# isabel_solver.rb
#
# (C) 2018 7inns

# Get the set of square sets to divide area S
#
# [IN ] s : The area S to be divided into squares
# [IN ] x : The smallest square size that can be included in the return value
# [Ret] Two-dimensional array. Set of square sets to divide area S.
def getSet( s, x=1 )
  return [] if (x2 = x**2) > s
  return [[x]] if x2 == s
  getSet( s-x2, x+1 ).each { |a| a.unshift x }.concat getSet( s, x+1 )
end

# Output the set of square sets dividing the area size inputed.
s = gets.to_i
while s > 0 do
  getSet(s).each{ |a| p a }
  s = gets.to_i
end
