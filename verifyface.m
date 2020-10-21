load face.mat
cam = ipcam('http://10.94.125.9:8080/video');
preview(cam)
closePreview(cam)
for i=1:4
    disp('Ready')
    pause(3);
end
x1 = snapshot(cam);
aa2=imresize(x1,[480,480]);
figure;
imshow(aa2);
featuresTest2 = activations(net,aa2,layer,'OutputAs','rows');
% 
% % Extract the class labels from the training and test data.
YTrain = trainData.Labels;
t = templateNaiveBayes('DistributionNames','kernel');
classifier = fitcecoc(featuresTrain,YTrain,'Learners',t);
YPred2 = predict(classifier,featuresTest2);
net=convnet;
 
layer =7;
name = net.Layers(layer).Name;

channels = 1:15;

I = deepDreamImage(net,layer,channels, ...
    'PyramidLevels',3);
figure
montage(I);
title(['Layer ',name,' Features'])
net=convnet;
layer =4;
name = net.Layers(layer).Name;
channels = 1:15;
I1 = deepDreamImage(net,layer,channels, ...
    'PyramidLevels',3);
if YPred1=='Authorized'
    msgbox('FACE VERIFIED ')
    num='a';
else
    msgbox('FACE NOT VERIFIED')
    num='b'
end