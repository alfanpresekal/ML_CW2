function [ NeuNet ] = CreateNN2(HiddLay, trainFunc, output_weights)
%To create a NN withs the output weights
    %Configure the NN
    NeuNet   =   feedforwardnet(HiddLay, trainFunc);
    NeuNet   =   configure(NeuNet, examples, binary_targets);
    %----------------------------------
    %Input the average initial weights
    NeuNet   =   setwb(NeuNet,output_weights);
end

