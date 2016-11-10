 aal  = load_nii('aal_MNI_V4.nii');
 
 datafolder = ('/mnt/share/7E1EC9C11EC972A7/fmridata');
 
 filename = dir([datafolder '/*/*/Functionals/*.nii.gz']);
 
 patient =[];
 
 for k =1:size(filename,1)
     
     nii = load_nii(filename(k).name);
     patient(k).fmridata(:,:,:,:) = nii.img;
     n = size(nii.img,4);
     for j = 1:max(max(max(aal.img)))
         mask = (aal.img ==j);
         mask(:,:,:,1:n) = 1;
         ROI = mask.*patient(k).fmridata(:,:,:,:);
         patient(k).TC(:,j) = avg_TC(ROI,mask);
     end
     fprintf('Patient %d data processed \n.',k);
 end
 
 save patient
 
 