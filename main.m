clear; clc; close all;
pkg load image;

% imagem original
% OBS: Aqui deve ser inserido o path da imagem que deve ser analisada
image = imread('image.png');

figure(2), subplot(1,2,1), imshow(image), title('Original');
figure(2), subplot(1,2,2), imhist(image), title('Histograma');

% Equalizando a imagem
imageEquali = histeq(image);

figure(2), subplot(1,2,1), imshow(image), title('Original');
figure(2), subplot(1,2,2), imshow(imageEquali), title('Imagem equalizada');
 
% Mascara 3x3 para filtro da media
media = fspecial('average',3);
imageMedia = imfilter(image, media);

figure(2), subplot(1,2,1), imshow(image), title('Original');
figure(2), subplot(1,2,2), imshow(imageMedia), title('Imagem filtrada com media 3x3');

% Aplicar erosão e dilatação na imagem
estruturante = strel('disk', 2, 0);
imagemErosao = imerode(image,estruturante);
imageDilatacao = imdilate(image,estruturante);

figure(1), subplot(1,3,1), imshow(image), title('Original');
figure(1), subplot(1,3,2), imshow(imagemErosao), title('Erosão');
figure(1), subplot(1,3,3), imshow(imageDilatacao), title('Dilatação');

% Aplicar abertura e fechamento
estruturanteAbertura = strel('disk', 3, 0);
imageAbertura = imopen(image,estruturanteAbertura);

estruturanteFechamento = strel('disk', 5, 0);
imageFechamento = imclose(image,estruturanteFechamento);

figure(2), subplot(1,3,1), imshow(image), title('Original');
figure(2), subplot(1,3,2), imshow(imageAbertura), title('Abertura');
figure(2), subplot(1,3,3), imshow(imageFechamento), title('Fechamento');
