%HiddLay is a matrix including the numbers of neurons for every hidden
%layer e.g. HiddLay = [10, 9, 7] means there are 3 layers with 10, 9 and 7
%neurons respectively
%trainFcn is the training function 
%examples are inputs for network
%binary_targets are outputs of the network
function NeuNet= Create_NN( HiddLay, TFuncNParam, epochs, x, y )
[examples, binary_targets] = ANNdata(x,y);
temp = strfind(TFuncNParam,'(');
trainFunc = TFuncNParam(1:temp-1);
NeuNet = feedforwardnet(HiddLay, trainFunc);
NeuNet = configure(NeuNet, examples, binary_targets);
NeuNet.trainParam.epochs = epochs;
NeuNet.divideFcn = 'divideind';
NeuNet.divideParam.valInd   = 1:100;
NeuNet.divideParam.trainInd = 101:size(examples,2);

if strcmp(trainFunc,'traingd')
	lr = TFuncNParam(temp+1:end-1);
    lr = str2double(lr);
	NeuNet.trainParam.lr = lr;	
end

if strcmp(trainFunc,'traingda')
	temp2 = strfind(TFuncNParam,',');
	lr = TFuncNParam(temp+1 : temp2(1)-1);
	lr_inc = TFuncNParam(temp2(1)+1 : temp2(2)-1);
	lr_dec = TFuncNParam(temp2(2)+1 : end-1);
    Param = arrayfun(@str2double, {lr, lr_inc, lr_dec});
	NeuNet.trainParam.lr = Param(1);	
	NeuNet.trainParam.lr_inc = Param(2);	
	NeuNet.trainParam.lr_dec = Param(3);	
end

if strcmp(trainFunc,'traingdm')
	temp2 = strfind(TFuncNParam,',');
	lr = TFuncNParam(temp+1 : temp2(1)-1);
	mc = TFuncNParam(temp2(1)+1 : end-1);
	Param = arrayfun(@str2double, {lr, mc});
	NeuNet.trainParam.lr = Param(1);	
	NeuNet.trainParam.mc = Param(2);
end

if strcmp(trainFunc,'trainrp')
	temp2 = strfind(TFuncNParam,',');
	delt_inc = TFuncNParam(temp+1 : temp2(1)-1);
	delt_dec = TFuncNParam(temp2(1)+1 : end-1);
	Param = arrayfun(@str2double, {delt_inc, delt_dec});
	NeuNet.trainParam.delt_inc = Param(1);	
	NeuNet.trainParam.delt_dec = Param(2);
end
	
NeuNet = train(NeuNet, examples, binary_targets);