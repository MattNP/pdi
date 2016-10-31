function [b] = mayorProps(a)
[m, n] = size(a);
if m == 0
    b = a;
    return;
end

areaMayor = a(1).Area;
props = a(1);
for i = 2 : m
    if a(i).Area > areaMayor
        props = a(i);
        areaMayor = a(i).Area;
    end
end
b = props;