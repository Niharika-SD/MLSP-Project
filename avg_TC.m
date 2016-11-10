function time_course  = avg_TC(ROI,mask)
%for a matrix (4_D) ROI, with the fourth dimension as time, extracts the
%average timecourse for active pixel at time instant defined by the fourth
%dimension, mask(3D) is the logical index of the pixels in the anatomical
%location

n =size(ROI,4);
time_course = zeros(n,1);

for i =1:n
    time_course(i,1) =sum(sum(sum(ROI(:,:,:,i))))/sum(sum(sum(mask(:,:,:,1))));
end

end