function [ NeuNet ] = CreateNN2(HiddLay, output_weights, examples, binary_targets)
%To create a NN withs the output weights
    %Configure the NN
    [examples,binary_targets] = ANNdata(examples,binary_targets);
    NeuNet   =   feedforwardnet(HiddLay);
    NeuNet   =   configure(NeuNet, examples, binary_targets);
    %----------------------------------
    %Input the average initial weights
    NeuNet   =   setwb(NeuNet,output_weights);
end

