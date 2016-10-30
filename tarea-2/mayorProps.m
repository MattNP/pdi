function [b] = mayorProps(a)
[m, n] = size(a);
areaMayor = a(1).Area;
props = a(1);
for i = 2 : m
    if a(i).Area > areaMayor
        props = a(i);
        areaMayor = a(i).Area;
    end
end
b = props;