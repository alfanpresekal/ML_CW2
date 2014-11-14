======
final_function: 
    - build the optimal NN with the inputed data and returns the performance of this NN.
======
ANNdata:
    - transforms features and labels as returned by loaddata into the matlab NN toolbox format.
======
build_confusion_matrix:
    - To create a confusion matrix to evaluate a tree.
======
ClassMeasure:
    - To calculate the performance on cross validation. 
======
Compare:
    - Use the output of prediction to implement the confusion matrix.
======
Create_NN:
    - To create a NN given topology, training fc, nb iterations and dataset.
======
CreateNN2:
    - To create a NN withs the output weights.
======
cross_fold:
    - Run the 10 cross validation and ouputs the f1 value of the average confusion matrix.
======
cross_fold_gathering:
    - Creates the dataset and validation set matrices for the cross_fold.
======
LayersNNeurons:
    - To generate the different topologies tested.
======
NNout2labels:
    - transforms the output of a NN to a 1 column label representation.
======
optiParamFinder_traingd:
    - Test different learning rates and return the optimal one with the threshold fixed.
======
testANN:
    - To obtain prediction for every instance and save into prediction.
======
topologyFinder:
    - Test different learning rates and return the f1 value.