function [output,netCell] = topologyFinder(FNname,epochs,x,y,x2,y2)
%Test different learning rates and return the f1 value.
%======================================================
%Train a NN for each topology
    %Get the struct containing the different topologies tested
    layersNNeurons         =      LayersNNeurons();
    %-----------------------------
    %Initialisation
    numberOfIterations     =      size(layersNNeurons,1);
	netCell                =      cell(40,1);
    predictionsCell        =      cell(40,1); 
    confusionCell          =      cell(40,1);
    output                 =      [];
    opti_function          =      cell(40,1);
    %-----------------------------
    %Creates the NN for all the topologies
	
    for m=1:numberOfIterations
        opti_function(m)  = {optiParamFinder_traingd(layersNNeurons(m,1:end), epochs,x,y, x2, y2)};
    end 
    
    for i=1:numberOfIterations
        netCell(i) = {Create_NN(layersNNeurons(i,1:end),opti_function{i},epochs,x,y)};
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
        [recall, precision, Fone, CR] = ClassMeasure(build_confusion_matrix(confusionCell{l}));
        output = [output,Fone];
    end
end 