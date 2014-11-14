function [layerNeuronSet] = LayersNNeurons()
%To generate the different topologies tested
%================================================
%Initialisation/parameters
    maxLayer = 3;
    minNeurons = 6;
    maxNeurons  = 45;
    counter = minNeurons;
%================================================
%Generation of the different topologies 
    %iterate up to the the difference of max n min because min starts at 6
    for i=1:(maxNeurons-minNeurons)+1
        % should be max three but leaving this open incase we need more layers
        for j=1:maxLayer
            %counter is added with 1 each time storing it in the NXM (m is usually 3 because it is the number of layers) matrix
            temp(i,j) = counter; 
        end
        counter = counter + 1;
    end
    %Returns an Nx3 matrix which contains the range of neurons which can be used for at max three layers.
    layerNeuronSet = temp; 

end
 

