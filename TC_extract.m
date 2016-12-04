aal  = load_nii('aal_MNI_V4.nii');
 
 datafolder = ('/mnt/share/7E1EC9C11EC972A7/fmridata');
 filename = dir([datafolder '/*/*/Functionals/*.nii.gz']);
 
 patient =[];
 class =max(max(max(aal.img)));
 
 for k =1:14
     str1 =  [filename(k).folder '/' filename(k).name];
     nii = load_nii(str1);
     fmridata = nii.img;
     n = size(nii.img,4);
     
     TC  = zeros(size(nii.img,4),class);
     %average time course extraction
     for v = 1:class
        mask = zeros(size(aal.img));
        index = find(aal.img==v);
        mask(index) = 1;
        mask_4D = zeros(size(nii.img));
        
      for j=1:size(nii.img,4)
          mask_4D(:,:,:,j) = mask;
      end
       
      ROI =double(nii.img) .* (mask_4D);
      TC(:,v) = avg_TC(ROI,mask_4D);
     
     end
     cd patient_data/
     %correlation calculation
     str1 = strcat('patient',num2str(k),'corr.mat');
     
     for i=1:size(TC,2)
        for j  = 1:size(TC,2)
              
            [R,P]= corr(double(TC(:,i)),double(TC(:,j)),'type','Pearson');
            patient.corr(i,j).R = R;
            patient.corr(i,j).P = P;
            patient.corr_coeff(i,j) = trace(R);
        end
     end
     
     save(str1,'patient');
     fprintf('Patient %d data processed \n.',k);
     cd ..
 end
 
 