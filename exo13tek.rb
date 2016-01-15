# This code solve the following system
# m1*u1 + m2*u2 = m1*u1*u1 + m2*u2*u2
# m1*u1*u1 + m2*u2*u2 = m1*v1*v1 + m2*v1*v1
# for v1 and v2

# Initialize the variables

m1 = 1.0
m2 = 2.0
u1 = 1.0
u2 = -1.0
v1min = -5.0
v1max = 5.0
v2min = -5.0
v2max = 5.0

step = 0.01
error = 0.02

# Initialize the lhs and rhs of the equations
eq1_lhs = eval("m1*u1 + m2*u2")
eq2_lhs = eval("m1*u1*u1 + m2*u2*u2")


# Solve the system

for v1 in (v1min..v1max).step(step)
  for v2 in (v2min..v2max).step(step)
    er1 = (eq1_lhs - eval("m1*v1 + m2*v2")).abs
    er2 = (eq2_lhs - eval("m1*v1*v1 + m2*v2*v2")).abs

    if er1 < error and er2 < error
      print [v1,v2,er1,er2]
      puts
    end
  end
end

# Exact solutions

v1_exact = (m1-m2)/(m1+m2)*u1 + 2*m2/(m1+m2)*u2
v2_exact = (m2-m1)/(m1+m2)*u2 + 2*m1/(m1+m2)*u1

print "Exact solutions\n"
puts [v1_exact,v2_exact,0,0]