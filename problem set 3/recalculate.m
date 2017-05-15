function [w1, w2] = recalculate(delta, d, z, X)
  
  w1 = (d' * X);
  w2 = delta * z';
  
end
