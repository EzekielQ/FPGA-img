clear all;

figure(1)
imgs = cell(1,9);
for i=1:9
    imgs{i} = imread(strcat('imgs/img',num2str(i),'.jpg'));
    subplot(3,3,i);
    imshow(imgs{i});
    title(i);
end
x=input('������Ҫ���ɵ�ͼƬ���\n');

img1=imgs{x};
img1g = rgb2gray(img1);
img1ga = imadjust(img1g,[0,1],[0.4,0.6]);

fimg1 = fopen('txtdata/img1b.txt','w+');
for i=1:256
    for j=1:256
        fprintf(fimg1,'%d%s\n',0,dec2bin(img1g(i,j),8));
    end
end
fclose(fimg1);

fimg1 = fopen('txtdata/img1.txt','w+');
for i=1:256
    for j=1:256
        fprintf(fimg1,'%d%s\n',0,dec2bin(img1ga(i,j),8));
    end
end
fclose(fimg1);
fprintf('���\n');

figure(1);
subplot(121)
imshow(img1g);
title('ԭ�Ҷ�ͼ: img1b.txt');
subplot(122)
imshow(img1ga);
title('���Աȶ�: img1.txt');
