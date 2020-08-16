function n=chinese_remainder_theorem(varargin={3, 2, 5, 3,7,2},multiple=0)
  print(varargin)
#  basis=max([varargin{:}])
#  i=1
#  while( i)
#    if(mod(basis,n1)==r1 && mod(basis,n2)==r2 && mod(basis,n3)==2)
#     break
#   else 
#     basis++
#    endif
#  end
#  n=basis+multiple*(n1*n2*n3)
endfunction
n1=chinese_remainder_theorem(5,1,7,3)
#print('n1')
#n2=chinese_remainder_theorem(6,1,4,3)