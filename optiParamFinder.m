function [ output_args ] = optiParamFinder( input_args )
%Test different learning rates and return the f1 value.
%======================================================
%Train a NN for each learning rate.
    %Get the struct containing the different function tested
    load('input_functions');
    %-----------------------------
    %Initialisation
    numberOfIterations=size(input_functions,1);
    netCell = cell(40,1);
    predictionsCell = cell(40,1); 
    confusionCell = cell(40,1);
    output = [];
    %-----------------------------
    %Creates the NN for all the topologies
    for i=1:numberOfIterations
        netCell(i) = {Create_NN(layersNNeurons(i,1:end),FNname,epochs,x,y)};
    end   
    %Get the predictions of all the NN on the validation set
    for j=1:numberOfIterations
        predictionsCell(j) = {testANN(netCell{j},x2)};
    end
    %Get the confusion matrix for each NN
    for k=1:numberOfIterations
       confusionCell(k) = {compare(predictionsCell{k},y2)};
    end
    %Get the confusion measures for each NN
    for l=1:numberOfIterations
        [recall, precision, Fone,CR] = ClassMeasure(build_confusion_matrix(confusionCell{l}));
         output = [output,Fone];
    end
end 