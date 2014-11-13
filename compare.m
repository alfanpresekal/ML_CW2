function Confusion = compare(prediction, y)
%Use the output of prediction to implement the confusion matrix
    PredNReal = [y,prediction];
    Confusion = zeros(6,6);
    for i = 1: size(PredNReal,1)
        a = PredNReal(i,1);
        b = PredNReal(i,2);
        if b ~= 0
            Confusion(a, b) = Confusion(a, b)+1;
        end
    end
end