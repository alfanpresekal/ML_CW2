function [NeuNet,confusion_matrix, f1, recall, precision, CR] = final_function(x,y)
%To find the best topology with average initial weigths, and opti param 
%=================================================
%Find the optimal topology
	[topology, init_weights, bestF1]    =     cross_fold_topo('traingd(0.1)', 10000, x, y);
%=================================================


	
    %Create the local variable storing the optimal traingd learning rate
%=================================================
%Return the optimized Neural Network
    NeuNet = CreateNN2(topology, 'traingd(0.3)', init_weights);
%=========================================
%Get the confusion_matrix and the measures
    [confusion_matrix, f1, recall, precision, CR]    =    cross_fold(NeuNet, x, y);