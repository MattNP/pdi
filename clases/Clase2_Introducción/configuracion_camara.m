cam = imaqhwinfo;
cam = imaqhwinfo('winvideo');
info = cam.DeviceInfo.SupportedFormats;
video1 = videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb'); %Pasar de formato YUY2 a RGB
preview(video1);
delete(video1);