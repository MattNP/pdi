function d = normaliza(c)

c = double(c);
c = c/max(c(:))*255;
d = uint8(c);
end
