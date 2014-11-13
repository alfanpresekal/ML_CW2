function [ confusion_matrix ] = build_confusion_matrix(value_matrix)
%To create a confusion matrix to evaluate a tree

    %Create the structure of the confusion matrix
    confusion_matrix=   {'.', 'Anger', 'Digust', 'Fear', 'Happyness', 'Sadness', 'Surprise';
                         'Anger'    , '', '', '', '', '', '';
                         'Disgust'  , '', '', '', '', '', '';
                         'Fear'     , '', '', '', '', '', '';
                         'Happyness', '', '', '', '', '', '';
                         'Sadness'  , '', '', '', '', '', '';
                         'Surprise' , '', '', '', '', '', '';
                    };
    
    %Fill the values of the matrix with the output of the compare function
    for i=2:size(confusion_matrix, 1)
        for j=2:size(confusion_matrix, 2)
            confusion_matrix(i,j)={num2str(value_matrix(i-1, j-1))};
        end
    end
                
end

