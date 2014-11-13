function predictions = testANN( NeuNet,  instance)
%To obtain prediction for every instance and save into prediction
%every element in prediction is a number representing probability
[x, ~]      =  ANNdata(instance, 0);
predictions =  sim(NeuNet, x); 
predictions =  NNout2labels(predictions);
end