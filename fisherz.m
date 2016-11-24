function[z]=fisherz(r)
r=r(:);
z=.5.*log((1+r)./(1-r));
end