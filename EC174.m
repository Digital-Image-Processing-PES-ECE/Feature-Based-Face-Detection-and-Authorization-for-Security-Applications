%Authorization Database Creation
cam = webcam;

personName = input('Enter the name of the authorized person: ', 's');
disp('Capturing image...');
img = snapshot(cam);
filename = [personName '_authorized.jpg'];
imwrite(img, filename);
disp(['Image saved as ' filename]);

clear cam;

imageFiles = {'authorized_face1.jpg', 'authorized_face2.jpg', 'authorized_face3.jpg'};
sampleImg = imread(imageFiles{1});
graySampleImg = rgb2gray(sampleImg);
resizedSampleImg = imresize(graySampleImg, [200 200]);
sampleFeatures = extractLBPFeatures(resizedSampleImg, 'Upright', true);

numImages = length(imageFiles);
lbpFeatureSize = length(sampleFeatures);
lbpFeatures = zeros(numImages, lbpFeatureSize);

for i = 1:numImages
    img = imread(imageFiles{i});
    grayImg = rgb2gray(img);
    resizedImg = imresize(grayImg, [200 200]);
    features = extractLBPFeatures(resizedImg, 'Upright', true);
    lbpFeatures(i, :) = features;
end

save('authorizedLBPDatabase.mat', 'lbpFeatures');
disp('LBP feature database saved as "authorizedLBPDatabase.mat".');

%Real-Time Face Detection and Recognition
cam = webcam;
faceDetector = vision.CascadeObjectDetector();
authorizedLBPDatabase = load('authorizedLBPDatabase.mat');
authorizedLBPs = authorizedLBPDatabase.lbpFeatures;
matchingThreshold = 0.5;

disp('Press Ctrl+C to stop the program');

while true
    img = snapshot(cam);
    grayImage = rgb2gray(img);
    bbox = step(faceDetector, grayImage);
    
    if ~isempty(bbox)
        detectedImg = insertShape(img, 'Rectangle', bbox, 'Color', 'green', 'LineWidth', 3);
        
        for i = 1:size(bbox, 1)
            faceRegion = grayImage(bbox(i,2):bbox(i,2)+bbox(i,4)-1, ...
                                   bbox(i,1):bbox(i,1)+bbox(i,3)-1);
            faceRegion = imresize(faceRegion, [200 200]);
            lbpFeatures = extractLBPFeatures(faceRegion, 'Upright', true);
            
            isAuthorized = false;
            for j = 1:size(authorizedLBPs, 1)
                similarity = norm(lbpFeatures - authorizedLBPs(j, :));
                if similarity < matchingThreshold
                    isAuthorized = true;
                    break;
                end
            end
            
            if isAuthorized
                disp('Authorized access detected.');
                detectedImg = insertText(detectedImg, bbox(i,1:2), 'Authorized', ...
                                         'FontSize', 12, 'BoxColor', 'green', 'TextColor', 'white');
            else
                disp('Unauthorized access detected!');
                detectedImg = insertText(detectedImg, bbox(i,1:2), 'Unauthorized', ...
                                         'FontSize', 12, 'BoxColor', 'red', 'TextColor', 'white');
                sound(sin(1:0.5:800), 8000);
                timestamp = datestr(datetime('now'), 'yyyy-mm-dd_HH-MM-SS');
                imwrite(faceRegion, ['unauthorized_' timestamp '.jpg']);
            end
        end
    else
        detectedImg = img;
    end
    
    imshow(detectedImg);
    title('Face Detection and Security Monitoring');
    pause(0.1);
end
