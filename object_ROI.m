close all
rgb = imread("Example.jpg");%read images
rgb = imresize(rgb,[3048 5424]);%crop to same size
he = rgb2gray(rgb);

BW = imbinarize(he,'adaptive','ForegroundPolarity','dark','Sensitivity',0.59);
BW2 = imcomplement(BW);
BWA = bwareaopen(BW2,10000);%Tweak around the optimal value for ROI selection.
%BWA = bwareaopen(BW2,30000); %26-4 3; 35-3
FBW = imfill(BWA, 'holes');
cc = bwconncomp(FBW);
figure
imshow(FBW)
%imwrite(FBW,"Example HE cc.png")
boundaries = bwboundaries(FBW);
figure
imshow(rgb)
hold on;
for k=1:size(boundaries,1)
   b = boundaries{k};
   plot(b(:,2),b(:,1),'g','LineWidth',3);
end
set(gca,'position',[0 0 1 1],'units','normalized')
%saveas(gcf,"Example HE bound.png")
