function [cropped_img, noPlate] = Plate_detection(img)
    imgray = rgb2gray(img);
    imbin = imbinarize(imgray);

    edge_img = edge(imgray,'prewitt');
    
    % Find location of number plate
    Iprops = regionprops(edge_img,'BoundingBox','Area', 'Image');
    area = Iprops.Area;
    maxa = area;
    count = numel(Iprops);
    bb = Iprops.BoundingBox;

    for i = 1:count
       if (maxa < Iprops(i).Area)
           maxa = Iprops(i).Area;
           bb = Iprops(i).BoundingBox;
       end
    end 

    % Crop image
    cropped_img = imcrop(imbin, bb);
    cropped_img = bwareaopen(~cropped_img, 500);
    [h, w] = size(cropped_img);
    
    Iprops = regionprops(cropped_img,'BoundingBox','Area', 'Image');
    count = numel(Iprops);
    noPlate=[];
    
    % Letter detection
    for i = 1:count
       ow = length(Iprops(i).Image(1,:));
       oh = length(Iprops(i).Image(:,1));
       if ow<(h/2) && oh>(h/3)
           letter = Letter_detection(Iprops(i).Image);
           noPlate = [noPlate letter];
       end
    end
    
    disp(noPlate);
end