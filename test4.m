%find the image here
I = imread('front1.jpg');
I = imresize(I, 0.5);
%imshow(I), title('Image');

%increase the saturation to exagerate colours for easier k-means
I = imadjust(I, [.3 .3 0; .9 .7 .9], []);
figure
imshow(I), title ('saturated');

%using color based segmentation
lab_I = rgb2lab(I);
ab = lab_I(:, :, 2 : 3);
nrows = size(ab, 1);
ncols = size(ab, 2);
ab = reshape(ab,nrows*ncols,2);
nColors = 3;

%repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab, nColors, 'distance', 'sqEuclidean', 'Replicates', 3);
pixel_labels = reshape(cluster_idx, nrows, ncols);
imshow(pixel_labels,[]), title('image labeled by cluster index');

%show each layer separately
segmented_images = cell(1, 3);
rgb_label = repmat(pixel_labels,[1 1 3]);
for k = 1:nColors
    color = I;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

%cluster 1 showed the best extraction of the object so resave as image I
imshow(segmented_images{1}), title('objects in cluster 1');
I = segmented_images{1};
imshow(segmented_images{2}), title('objects in cluster 2');
%I = segmented_images{2};
imshow(segmented_images{3}), title('objects in cluster 3');
%I = segmented_images{3};

%segment nuclei
mean_cluster_value = mean(cluster_center, 2);
[tmp, idx] = sort(mean_cluster_value);
blue_cluster_num = idx(1);
L = lab_I(: ,: , 1);
blue_idx = find(pixel_labels == blue_cluster_num);
L_blue = L(blue_idx);
is_light_blue = imbinarize(rescale(L_blue));
nuclei_labels = repmat(uint8(0),[nrows ncols]);
nuclei_labels(blue_idx(is_light_blue == false)) = 1;
nuclei_labels = repmat(nuclei_labels,[1 1 3]);
blue_nuclei = I;
blue_nuclei(nuclei_labels ~= 1) = 0;
%imshow(blue_nuclei), title('blue nuclei');

%changes to greyscale just incase
Ibw = rgb2gray(I);
figure
%imshow (Ibw), title('Image: greyscale');

%draws an active snake around the edge of the image
mask = zeros(size(Ibw));
mask(25 : end - 25, 25 : end - 25) = 1;
figure
%imshow(mask), title('Initial Contour Location');

%sets the iterations to 3000 to find the edges
I = activecontour(Ibw, mask, 10000);
figure
imshow(I), title('Segmented Image');