function [NeuNet,confusion_matrix, f1, recall, precision, CR] = final_function(epoch, x,y)
%To find the best topology with average initial weigths, and opti param 
%=================================================
%Find the optimal topology with optimized param for training function
	[topology, mean_weights, bestF1]                 =    cross_fold_topo('traingd(0.1)', epoch, x, y);
%=================================================
%Return the optimized Neural Network
    NeuNet                                           =    CreateNN2(topology, mean_weights, x, y);
%================================================= 
%Get the confusion_matrix and the measures
    [confusion_matrix, f1, recall, precision, CR]    =    cross_fold(NeuNet, x, y);