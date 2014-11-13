function [output] = topologyFinder(FNname,epochs,x,y,x2,y2)

layersNNeurons = LayersNNeurons();
numberOfIterations=size(layersNNeurons,1);
netCell = cell(40,1);
predictionsCell = cell(40,1); 
confusionCell = cell(40,1);
output = [];

    for i=1:numberOfIterations
        netCell(i) = {Create_NN(layersNNeurons(i,1:end),FNname,epochs,x,y)};
    end

    for j=1:numberOfIterations
        predictionsCell(j) = {testANN(netCell{j},x2)};
    end

    for k=1:numberOfIterations
       confusionCell(k) = {compare(predictionsCell{k},y2)};
    end
    
    for l=1:numberOfIterations
        [recall, precision, Fone,CR] = ClassMeasure(build_confusion_matrix(confusionCell{l}));
         output = [output,Fone];
    end


end 