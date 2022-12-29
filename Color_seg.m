close all
he = imread("Example.jpg");%read images
he =imresize(he,[3048 5424]);%crop to same size

numColors = 8;%Tweak around the optimal number of clusters.
 
L = imsegkmeans(he,numColors);
B = labeloverlay(he,L);
figure
imshow(B)
title("Labeled Image RGB")
lab_he = rgb2lab(he);
ab = lab_he(:,:,2:3);
ab = im2single(ab);
pixel_labels = imsegkmeans(ab,numColors,NumAttempts=3);
B2 = labeloverlay(he,pixel_labels);
figure
imshow(B2)
title("Labeled Image a*b*")

% run through all clsuters and choose the right one for intensity
% quantification
mask1 = pixel_labels == 1;
cluster1 = he.*uint8(mask1);
ins1 =  sum(sum(double(cluster1),3),'all')
figure
imshow(cluster1)
title("Objects in Cluster 1");

mask2 = pixel_labels == 2;
cluster2 = he.*uint8(mask2);
ins2 =  sum(sum(double(cluster2),3),'all')
figure
imshow(cluster2)
title("Objects in Cluster 2");
mask3 = pixel_labels == 3;
cluster3 = he.*uint8(mask3);
ins3 =  sum(sum(double(cluster3),3),'all')
figure
imshow(cluster3)

title("Objects in Cluster 3");

mask4 = pixel_labels == 4;
cluster4 = he.*uint8(mask4);

ins4 =  sum(sum(double(cluster4),3),'all')
figure
imshow(cluster4);

title("Objects in Cluster 4");

mask5 = pixel_labels == 5;
cluster5 = he.*uint8(mask5);

ins5 =  sum(sum(double(cluster5),3),'all')
figure
imshow(cluster5)
title("Objects in Cluster 5");

mask6 = pixel_labels == 6;
cluster6 = he.*uint8(mask6);

ins6 =  sum(sum(double(cluster6),3),'all')
figure
imshow(cluster6)
title("Objects in Cluster 6");

mask7 = pixel_labels == 7;
cluster7 = he.*uint8(mask7);

ins7 =  sum(sum(double(cluster7),3),'all')
figure
imshow(cluster7)
title("Objects in Cluster 7");

mask8 = pixel_labels == 8;
cluster8 = he.*uint8(mask8);

ins8 =  sum(sum(double(cluster8),3),'all')
figure
imshow(cluster8)
title("Objects in Cluster 8");