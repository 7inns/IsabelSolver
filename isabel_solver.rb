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

# Get subsets of arr to divide length len
#
# [IN ] arr : natural number set
# [IN ] len : The length to be divided into elements of subset
# [Ret] Two-dimensional array. Set of subsets of arr to divide length len.
def getLineSubset( arr, len )
  return [] if (arr.empty? || (x = arr[0]) > len)
  return [[x]] if x == len
  ar = arr.drop(1)
  getLineSubset( ar, len-x )
  .each{ |a| a.unshift x }
  .concat getLineSubset( ar, len )
end


# Output the set of square sets dividing the area size inputed.
print 'Input the area size of gold bar : '
gold = gets.to_i
print 'Input the size of square : '
len = gets.to_i
while (s = len**2 - gold) > 0 do
  (arr = getSet(s)).each { |a| p a }

  print 'Input the index above : '
  getLineSubset(arr[gets.to_i % arr.length], len).each{ |a| p a }

  print 'Input the size of square : '
  len = gets.to_i
end
