function NeuNet= Create_NN( HiddLay, TFuncNParam, epochs, x, y )
%To create a NN given topology, training fc, nb iterations and dataset
%======================================================
    %Transform the input data in the correct format
    [examples, binary_targets] = ANNdata(x,y);
    %Necessary for parsing
    temp = strfind(TFuncNParam,'(');
    trainFunc = TFuncNParam(1:temp-1);
    %Configure the NN
    NeuNet = feedforwardnet(HiddLay, trainFunc);
    NeuNet = configure(NeuNet, examples, binary_targets);
    NeuNet.trainParam.epochs = epochs;
    %Divide the dataset in validation and training sets
    NeuNet.divideFcn = 'divideind';
    NeuNet.divideParam.valInd   = 1:100;
    NeuNet.divideParam.trainInd = 101:size(examples,2);

%======================================================
%Parsing of the training function
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
%======================================================
%Train the NN	
    NeuNet = train(NeuNet, examples, binary_targets);