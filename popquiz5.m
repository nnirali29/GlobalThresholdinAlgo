function popquiz5(filename,t)
f=imread(filename);  
figure
subplot(2,2,1);
imshow(f);
title('Original Image');

b =imhist(f);
subplot(2,2,2);
plot(b);
title('Image Histogram');


[h,w]=size(f);
index1=1;
index2=1;
t_old = 0;
while(abs(t - t_old)>0.5)
    for i=1:h
        for j=1:w
            if(f(i,j)<=t)
                G1(index1) = f(i,j);
                index1 = index1 + 1;
            else
                G2(index2) = f(i,j);
                index2 = index2 + 1;
            end
        end
    end
    m1 = mean(G1);
    m2 = mean(G2);
    t_old = t;
    t = (m1 + m2)/2;
end
disp(t);
g = im2bw(f,t/255);
subplot(2,2,3);
imshow(g); 
title('Global Thresholding');
