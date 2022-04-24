function edge_image = logauss(img)
%     img = imread('Number Plate Images/image1.png');
    [M, N, D] = size(img);

    H = fspecial('log',5,1);
    edge_image = uint8(convn(double(img), double(H), 'same'));

%     H = fspecial('gaussian', 5, 1);
%     lap=[0 -1 0; -1 4 -1; 0 -1 0];
%     edge_image = convn((img), (H), 'same');
%     edge_image = convn(edge_image, lap, 'same');
%     for i = 1:M
%         edge_image(i,1)=0;
%     end
end