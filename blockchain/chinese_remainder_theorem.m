function n=chinese_remainder_theorem(varargin={3, 2, 5, 3,7,2})
  divisor=[];
  remainder=[];
  for i = 1:length (varargin)
    if(mod(i,2))
    divisor(end+1)=varargin{i};
    else
      remainder(end+1)=varargin{i};
    endif
  endfor
  basis=max(divisor);
  len=length(divisor);
  bool=true;
  while( bool)
  for i=1:len
    if(mod(basis,divisor(i))!=remainder(i))
    break
  endif
  if(i==len)
  bool=false;
endif
endfor

bool && basis++;
endwhile
#n=basis+prod(divisor)
n=basis;
endfunction
