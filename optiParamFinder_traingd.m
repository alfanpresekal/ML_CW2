function [ opti_function ] = optiParamFinder_traingd( topology, epochs,x,y)
%Test different learning rates and return the f1 value.
%======================================================
%Train a NN for each learning rate.
    %Get the struct containing the different function tested
    load('input_functions');
    %-----------------------------
    %Initialisation
    numberOfIterations    =    size(input_functions,2);
    netCell               =    cell(40,1);
    predictionsCell       =    cell(40,1); 
    confusionCell         =    cell(40,1);
    output                =    [];
    matrices            =      cross_fold_gathering(x,y);
    %-----------------------------
    
    for i=1:numberOfIterations
        %Creates the NN 
        netCell(i)         =    {Create_NN(topology,input_functions{i},epochs,matrices{2}{1}, matrices{4}{1})}; 
        %Get the predictions on the validation set
        predictionsCell(i) =    {testANN(netCell{i}, matrices{2}{1}(1:100, :))};
        %Get the confusion matrix 
        confusionCell(i)    =    {compare(predictionsCell{i}, matrices{4}{1}(1:100))};
        %Get the confusion measures 
        [recall, precision, Fone,CR] = ClassMeasure(build_confusion_matrix(confusionCell{i}));
         output = [output,Fone];
    end
    opti_function = output;
end 