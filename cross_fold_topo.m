function [ topology, MeanWeights, bestF1 ] = cross_fold_topo(trainingfc,epoch,x,y)
%Run the 10 cross validation and ouputs the f1 value of the average confusion matrix
    %Initialize local variables
    localF1             =      zeros(1,40);
    opti_function       =      cell(40,1);
    layersNNeurons      =      LayersNNeurons(2);
    %Creates the validationSet & dataSet for each fold
    matrices            =      cross_fold_gathering(x,y);
    %Optimize the training function
    for m=1:40
        opti_function(m)  = {optiParamFinder_traingd(layersNNeurons(m,1:end), epoch,matrices{2}{1}, matrices{4}{1}, matrices{2}{1}(1:100, :), matrices{4}{1}(1:100))};
    end 
    %For each fold run the simulation
    for i=1:10
        %Optimize the parameters
		[Fone(i,:), Nets(i,:)]    =      topologyFinder( opti_function, epoch, matrices{2}{i}, matrices{4}{i}, matrices{2}{i}(1:100, :), matrices{4}{i}(1:100) );
        localF1                   =      localF1 + Fone(i,:);   
        %Sum the weights - array_weights
    end
	
    %Get the best parameters
    [bestF1, index]     =      max(localF1);
    topology            =      [index+5, index+5, index+5]; 
	for i = 1:10
		wb(:,i)         =      formwb(Nets{i,index}, Nets{i,index}.b, Nets{i,index}.iw, Nets{i,index}.lw);
	end
	MeanWeights         =      mean(wb,2);
