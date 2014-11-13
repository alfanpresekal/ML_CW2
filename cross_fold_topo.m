function [ topology, init_weights, bestF1 ] = cross_fold_topo(trainingfc,epoch,x,y)
%Run the 10 cross validation and ouputs the f1 value of the average confusion matrix
    %Initialize local variables
    localF1             =      zeros(1,40);
    %Creates the validationSet & dataSet for each fold
    matrices            =      cross_fold_gathering(x,y);
    %For each fold run the simulation
    for i=1:10
        %Optimize the parameters
        localF1         =      localF1 + topologyFinder( trainingfc, epoch, matrices{2}{i}, matrices{4}{i}, matrices{2}{i}(1:100, :), matrices{4}{i}(1:100) );   
        %Sum the weights - array_weights
    end
    %Get the best parameters
    [bestF1, index]     =      max(localF1);
    topology            =      [index, index, index]; 
    init_weights        =      array_weights(1, topology);
end

