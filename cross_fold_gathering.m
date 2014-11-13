function [ matrices ] = cross_fold_gathering( x, y )
%Creates the dataset and validation set matrices for the cross_fold

    %Get the size of the validation set 
    examples_size = size(x,1);
    tenPercent = 10/100 * examples_size;
    tenFoldEndPoint = round(tenPercent);

    %Define the starting point
    startingPoint = 1;

    %Initialise output variables
    testSet = cell(1,10);
    dataSet =cell(1,10);
    binary_testSet = cell(1,10);
    binary_dataSet =cell(1,10);

    %Loop creating the cross fold matrices
    for j = 1:10
           %Get the testSet
           currentTestSet = x(startingPoint:tenFoldEndPoint,:);
           testSet(j) = {currentTestSet};
           %Get the binary_testSet
           binary_test = y(startingPoint:tenFoldEndPoint);
           binary_testSet(j) = {binary_test};
           %Get the dataSet
           currentDataSet = x;
           currentDataSet(startingPoint:tenFoldEndPoint,:)=[];     
           dataSet(j) =  {currentDataSet};
           %Get the binary_dataSet
           binary_data = y;
           binary_data(startingPoint:tenFoldEndPoint)=[];
           binary_dataSet(j) = {binary_data};
           
           %Increment the starting point
           startingPoint = tenFoldEndPoint+1;
           tenFoldEndPoint = tenFoldEndPoint+tenPercent;

           %end
           %extract a different 10% of the data on
    end

    %Store the matrices into the correct output
    finalSet(1) = {testSet};
    finalSet(2) = {dataSet};
    finalSet(3) = {binary_testSet};
    finalSet(4) = {binary_dataSet};
    
    %Attribuate the output
    matrices = finalSet;

end

