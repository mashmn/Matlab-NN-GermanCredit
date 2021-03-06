% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by Neural Pattern Recognition app
% Created 01-Oct-2016 12:31:11
%
% This script assumes these variables are defined:
%
%   TrainingInputs - input data.
%   TrainingOutputs - target data.

x = TrainingInputs;
t = TrainingOutputs;

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

% Create a Pattern Recognition Network
hiddenLayerSize = 1000;
net = patternnet(hiddenLayerSize);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 10/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
% y = net(x);
% From here added
% Here we replaced the variable t with PredictiveLabel as our variable name
% PredictiveLabel; was added to display the result for us to see

PredictiveLabel = net(TestingInputs);
PredictiveLabel;

% Below are Matlab generated code not necessary for this project, so they were comment out

%e = gsubtract(t,y);
%performance = perform(net,t,y)
%tind = vec2ind(t);
%yind = vec2ind(y);
%percentErrors = sum(tind ~= yind)/numel(tind);

% Above are Matlab generated codes not necessary for this project

% Rounding off PredictiveLabel
% This section round off the PredictiveLabels from decimal numbers into
% whole numbers of -1,0 and 1s

RoundPredictiveLabel = round(PredictiveLabel);
RoundPredictiveLabel;

% Compare Results
% This section we compare the round off results against the TargetOutput
% Matrix when it is True negative which is -1 where we assign value 5

Result = RoundPredictiveLabel - TestingOutputs;
Result(1,Result==-1)=5;

Result;

% Calculation of total result
% This section we take the sum of the result as evaluation on how accurate
% the bank was with their criterial to evaluate their customer

sum (Result(1,:))

% View the Network
view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotconfusion(t,y)
%figure, plotroc(t,y)

