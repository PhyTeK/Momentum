# This code solve the following system
# eq1: m1*u1 + m2*u2 = m1*v1 + m2*v2
# eq2: m1*u1*u1 + m2*u2*u2 = m1*v1*v1 + m2*v2*v2

# Initialize m1,m2,u1,u2

m1=1.0
m2=2.0
u1=3.0
u2=-1.0

error = 0.01

eq1_lhs = m1*u1 + m2*u2
eq2_lhs = m1*u1*u1 + m2*u2*u2


# Solve the equations
# Numerical solution

v1_min = -5.0
v1_max = +5.0
v2_min = -5.0
v2_max = +5.0

step = 0.01

for v1 in (v1_min..v1_max).step(step)
  for v2 in (v2_min..v2_max).step(step)

    eq1_rhs = m1*v1 + m2*v2
    eq2_rhs = m1*v1*v1 + m2*v2*v2

    er1 = (eq1_lhs - eq1_rhs).abs
    er2 = (eq2_lhs - eq2_rhs).abs


    if er1 <= error and er2 <= error
      print [v1,v2,er1,er2]
      puts
    end

  end
end

# Exact solutions

v1_exact = (m1-m2)/(m1+m2)*u1 + 2*m2/(m1+m2)*u2
v2_exact = (m2-m1)/(m1+m2)*u2 + 2*m1/(m1+m2)*u1

# Print exact v1 and v2

puts "Exact Solutions"
print [v1_exact,v2_exact,0,0]