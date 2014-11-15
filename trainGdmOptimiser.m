function [output] = trainGdmOptimiser(topology, epochs,x,y,x2,y2)

parameterCell = load('traingdmParameters');
iteratei = size(parameterCell,1);
iteratej = size(parameterCell,2)

    netCell               =    {};
    predictionsCell       =    {}; 
    confusionCell         =    {};
    confMatrixCell        =    {};
    i = 1;
    temp = [];
    
    for i=1:iteratei
        for j=1:iteratej
    netCell(i,j) = {Create_NN(HiddLay, TFuncNParam, epochs, x, y)};
    predictionsCell(i,j) = {testANN(netCell{i,j},x2)};
    confusionCell(i,j) = {compare(predictionsCell{i,j},y2)}
    confMatrixCell(i,j) ={build_confusion_matrix(confusionCell{i,j})};
    
    [recall, precision, Fone,CR] = ClassMeasure(confMatrixCell{i,j});
     temp(i,j) = Fone;  
        end
    
    end 
    output = temp;
end