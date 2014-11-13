function [optimal_NN,confusion_matrix, f1, recall, precision, CR] = final_function(trainingfc,epochs,x,y)
%To find the best topology with average initial weigths, and opti param 
%=================================================
%Find the optimal topology
	[topology, bestF1] = cross_fold_topo('traingd(0.1)', 10000, x, y);
%=================================================
%Optimize the traingd parameter on the best topology
	
%=================================================
%Return the optimized Neural Network
    NeuNet = CreateNN2(HiddLay, trainFunc, init_weights)
%=========================================
%Get the confusion_matrix and the measures
	[confusion_matrix, f1, recall, precision, CR] = cross_fold_fc(topology, trainingfc,epoch,x,y);