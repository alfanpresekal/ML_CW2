function [recall, precision, Fone,CR] = ClassMeasure(confusionMatrix)
%To calculate the performance on cross validation    
    confusionMatrix = cellfun(@str2num,confusionMatrix(2:end,2:end));
    emotions = size(confusionMatrix,1);
    for i = 1:emotions
        recall(i) = confusionMatrix(i,i) / sum(confusionMatrix(i,:));
        precision(i) = confusionMatrix(i,i) / sum(confusionMatrix(:,i));
    end
    Fone = 2 * (precision.*recall)/(precision+recall);
    CR = sum(diag(confusionMatrix)) / sum(confusionMatrix(:));
end