

for k= 1:size(patient,1)
    
    for i=1:size(patient(k).TC,2)
       
        for j  = 1:size(patient(k).TC,2)
              
            [R,P]= corrcoef(patient(k).TC(:,i),patient(k).TC(:,j));
            patient(k).corr(i,j).data.R = R;
            patient(k).corr(i,j).data.P = P;
            patient(k).corr_coeff(i,j) = trace(R);
        end
        
    end
    
end