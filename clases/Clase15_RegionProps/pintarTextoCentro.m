function pintarTextoCentro(x,y,valores,img,N)

imshow(img);

hold on
for i=1:N
	text(x(i)-20,y(i),sprintf('%2.1f', valores(i)),'EdgeColor','b','Color','b','BackgroundColor',[.4 .9 .5]);
end
hold off
   
