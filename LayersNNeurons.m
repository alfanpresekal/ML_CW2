function [layerNeuronSet] = LayersNNeurons()
maxLayer = 3;
minNeurons = 6;
maxNeurons  = 45;
counter = minNeurons;

  for i=1:(maxNeurons-minNeurons)+1 %iterate up to the the difference of max n min because min starts at 6
     for j=1:maxLayer % should be max three but leaving this open incase we need more layers
         temp(i,j) = counter; %counter is added with 1 each time storing it in the NXM (m is usually 3 because it is the number of layers) matrix
     end
     counter = counter + 1;
  end
     layerNeuronSet = temp %Returns an Nx3 matrix which contains the range of neurons which can be used 
                           %for at max three layers.
     
  end
 

