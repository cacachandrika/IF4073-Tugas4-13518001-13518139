close all;
clear all;

im = imread('Number Plate Images/image1.png');
imgray = rgb2gray(im);
imbin = imbinarize(imgray);
im = edge(imgray,'prewitt');

%Below steps are to find location of number plate
Iprops=regionprops(im,'BoundingBox','Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
bb = Iprops.BoundingBox;
for i=1:count
    disp(Iprops(i));
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       disp(Iprops(i).BoundingBox);
       bb = Iprops(i).BoundingBox;
   end
end   

im = imcrop(imbin, bb);
im = bwareaopen(~im, 500);
 [h, w] = size(im);

imshow(im);

Iprops=regionprops(im,'BoundingBox','Area', 'Image');
count = numel(Iprops);
disp(count);
noPlate=[];
for i=1:count
   ow = length(Iprops(i).Image(1,:));
   oh = length(Iprops(i).Image(:,1));
   if ow<(h/2) && oh>(h/3)
       letter=Letter_detection(Iprops(i).Image);
       noPlate=[noPlate letter];
   end
end

disp(noPlate);