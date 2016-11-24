data_train = [];
data_test =[];

%% make gaussian

%train data
for k= 1:168
    
       str1 = strcat('patient',num2str(k),'corr.mat');
        load(str1);
        Z =patient.corr_coeff';
        data_train = vertcat(data_train,Z); 
    
end

%test_data
for k =168:280

       str1 = strcat('patient',num2str(k),'corr.mat');
       load(str1);
       Z =patient.corr_coeff';
       data_test = vertcat(data_test,Z);
       
end

[coeff,score,latent,tsquared,explained,mu] = pca(data_train);