% cam=webcam;
% preview(cam)
% 
% msgbox('look camera and hold');
% pause(2)
% c=cd;
% h='\dataset\Authorized\folder1';
% outputFolder = fullfile(c,h);
% for i=1:20 
%     x1 = snapshot(cam);
%     aa2=imresize(x1,[224,224]);
%     outputBaseFileName = sprintf('%d.jpg',i);
%     outputFullFileName = fullfile(outputFolder, outputBaseFileName);
%     imwrite(aa2,outputFullFileName,'jpg'); 
% end


%%
% imageFolder = fullfile('dataset');
% imds = imageDatastore(imageFolder,'LabelSource', 'foldernames', 'IncludeSubfolders',true);
% user = find(imds.Labels == 'berlin', 1);
% tbl = countEachLabel(imds);
% disp(tbl);
% 
% minSetCount = min(tbl{:,2}); 
% 
% % Limit the number of images to reduce the time it takes
% % run this example.
% maxNumImages = 20;
% minSetCount = min(maxNumImages,minSetCount);
% 
% % Use splitEachLabel method to trim the set.
% imds = splitEachLabel(imds, minSetCount, 'randomize');
% 
% % Notice that each set now has exactly the same number of images.
% countEachLabel(imds)
% 
% net = resnet50();
% 
% % figure;
% % plot(net)
% % title('First section of ResNet-50')
% % set(gca,'YLim',[150 170]);
% 
% %% Inspect the first layer
% net.Layers(1)
% %% Inspect the last layer
% net.Layers(end)
% %% Number of class names for ImageNet classification task
% numel(net.Layers(end).ClassNames)
% 
% [trainingSet, testSet] = splitEachLabel(imds, 0.3, 'randomize');
% %% Create augmentedImageDatastore from training and test sets to resize
% % images in imds to the size required by the network.
% imageSize = net.Layers(1).InputSize;
% augmentedTrainingSet = augmentedImageDatastore(imageSize, trainingSet, 'ColorPreprocessing', 'gray2rgb');
% augmentedTestSet = augmentedImageDatastore(imageSize, testSet, 'ColorPreprocessing', 'gray2rgb');
% 
% %% Get the network weights for the second convolutional layer
% w1 = net.Layers(2).Weights;
% 
% %% Scale and resize the weights for visualization
% w1 = mat2gray(w1);
% w1 = imresize(w1,5); 
% 
% %% Display a montage of network weights. There are 96 individual sets of
% % weights in the first layer.
% % figure
% % montage(w1)
% % title('First convolutional layer weights')
% 
% featureLayer = 'fc1000';
% trainingFeatures = activations(net, augmentedTrainingSet, featureLayer, ...
%     'MiniBatchSize', 32, 'OutputAs', 'columns');
% 
% %% Get training labels from the trainingSet
% trainingLabels = trainingSet.Labels;
% 
% %% Train multiclass classifier using a fast linear solver, and set
% % 'ObservationsIn' to 'columns' to match the arrangement used for training
% % features.
% classifier = fitcecoc(trainingFeatures, trainingLabels, ...
%     'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'columns');
% 
% %% Extract test features using the CNN
% testFeatures = activations(net, augmentedTestSet, featureLayer, ...
%     'MiniBatchSize', 32, 'OutputAs', 'columns');
% 
% %% Pass CNN image features to trained classifier
% predictedLabels = predict(classifier, testFeatures, 'ObservationsIn', 'columns');
% 
% %% Get the known labels
% testLabels = testSet.Labels;
% 
% %% Tabulate the results using a confusion matrix.
% confMat = confusionmat(testLabels, predictedLabels);
% 
% %% Convert confusion matrix into percentage form
% confMat = bsxfun(@rdivide,confMat,sum(confMat,2));
% 
% %% Display the mean accuracy
% accuracy = mean(diag(confMat));

%%
cam = webcam;
preview(cam)

msgbox('look camera');
for i=1:2
    disp('Ready')
    pause(2);
end
x1 = snapshot(cam);
aa2=imresize(x1,[224,224]);
figure;
imshow(aa2);

%% Create augmentedImageDatastore to automatically resize the image when
% image features are extracted using activations.
ds = augmentedImageDatastore(imageSize, x1, 'ColorPreprocessing', 'gray2rgb');

%% Extract image features using the CNN
imageFeatures = activations(net, ds, featureLayer, 'OutputAs', 'columns');

%% Make a prediction using the classifier
op = predict(classifier, imageFeatures, 'ObservationsIn', 'columns');

a = 'mugunth';
b = 'berlin';

if strcmp(op,a)
    disp('welcome mugunth')
elseif strcmp(op,b)
    disp('welcome berlin')
end

