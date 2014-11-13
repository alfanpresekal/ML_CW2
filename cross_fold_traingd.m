function [bestF1 ] = cross_fold_traingd(topology,epoch,x,y)
%Run the 10 cross validation and ouputs the f1 value of the average confusion matrix
    %Initialize local variables
    localF1             =      zeros(1,40);
    %Creates the validationSet & dataSet for each fold
    matrices            =      cross_fold_gathering(x,y);
    %For each fold run the simulation
        %Optimize the parameters
        bestF1         =      optiParamFinder_traingd( topology, epoch, matrices{2}{1}, matrices{4}{1}, matrices{2}{1}(1:100, :), matrices{4}{1}(1:100) );   
end

