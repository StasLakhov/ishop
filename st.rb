o = Order.create!
o2 = Order.create!

puts o.deliverable?
o.purchased!
puts o.deliverable?
o.purchased!
puts o.deliverable?

o2.requested!
puts o2.deliverable?