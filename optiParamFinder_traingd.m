function [ opti_function ] = optiParamFinder_traingd( topology, epochs,x,y,x2,y2)
%Test different learning rates and return the optimal one with the threshold fixed.
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
    matrices              =    cross_fold_gathering(x,y);
    CR                    =    1;
    i                     =    1;
    %-----------------------------
    while (CR > 0.7)
        %Creates the NN 
        netCell(i)          =    {Create_NN(topology,input_functions{i},epochs,x, y)}; 
        %Get the predictions on the validation set
        predictionsCell(i)  =    {testANN(netCell{i},x2)};
        %Get the confusion matrix 
        confusionCell(i)    =    {compare(predictionsCell{i}, y2)};
        %Get the confusion measures 
        [recall, precision, Fone,CR] = ClassMeasure(build_confusion_matrix(confusionCell{i}));
        i                  =    i + 1;
    end
    opti_function = input_functions{i-1};
end 