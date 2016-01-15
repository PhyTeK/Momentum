def momentum()
  m1*u1 + m2*u2 = m1*v1 + m2*v2
end

def energy()
  m1*u1*u1 + m2*u2*u2 = m1*v1*v1 + m2*v2*v2
end


m1=1.0
m2=2.0
u1=1.0
u2=-1.0


v1_exact = (m1-m2)/(m1+m2)*u1 + 2*m2/(m1+m2)*u2
v2_exact = (m2-m1)/(m1+m2)*u2 + 2*m1/(m1+m2)*u1


v1min, v1max = -3, 3
v2min, v2max = -3, 3
step1 = 0.01
step2 = 0.01
error = 0.02

eq1_lhs = m1*u1 + m2*u2
eq2_lhs = m1*u1*u1 + m2*u2*u2

print "Numerical Solutions: [v1,v2,error_eq1,error_eq2]\n"
for v1 in (v1min..v1max).step(step1)
  for v2 in (v2min..v2max).step(step2)

    eq1_rhs = m1*v1 + m2*v2

    eq2_rhs = m1*v1*v1 + m2*v2*v2


    err1 = (eq1_lhs - eq1_rhs).abs
    err2 = (eq2_lhs - eq2_rhs).abs


    if err1 <= error and err2 <= error
      print [v1, v2, err1, err2]
      puts
    end

  end
end

puts "Exact Solutions:"
print [v1_exact, v2_exact]


