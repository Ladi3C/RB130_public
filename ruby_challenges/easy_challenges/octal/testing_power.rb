# a = [3, 2, 1, 0]
# c = []
# b = a.each do |num|
#   num.times {  c << 8 ** num}
# end


a = [3, 2, 1, 0]
c = []
b = a.map do |num|
  8 ** num
end
p b
 p 8 * 8 * 8