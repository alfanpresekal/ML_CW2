function [confusion_matrix, f1, recall, precision, CR ] = cross_fold_fc(topology, trainingfc,epoch,x,y)
%Run the 10 cross validation and ouputs the f1 value of the average confusion matrix

    %Initialize local variables
    matrixForBuilding   =      zeros(6,6);
    localF1             =      zeros(39,1);
    %Creates the validationSet & dataSet for each fold
    matrices            =      cross_fold_gathering(x,y);
    %For each fold run the simulation
    for i=1:10
        %Create the network
        net                 =      Create_NN(topology,trainingfc, epoch, matrices{2}{i}, matrices{4}{i});
        %Get the prediction vector on validation set
        prediction          =      testANN(net, matrices{1}{i});
        %Compare predicted value with actual value
        compare_result      =      compare(prediction, matrices{3}{i});
        %Add the result to the final confusion matrix
        matrixForBuilding   =      matrixForBuilding + compare_result;
    end
    
    %Return the average confusion matrix
    temp                         =      matrixForBuilding;    
    confusion_matrix             =      build_confusion_matrix(temp);
    %Get the comparison value, ie f1
    [recall, precision, f1, CR]  =      ClassMeasure(confusion_matrix);
end

