
function calib = fit_depth_correction(calib)

%compute error accross images
[error,depthm,imxy] = compute_full_derror(calib);
%remove outliers
valid = abs(error)<60;

calib.inputs = [depthm(valid) ; imxy(:,valid)];
calib.res = error(:,valid);

calib.inputs  = calib.inputs(calib.coords,:); 

subind = 1:1:size(calib.inputs,2);

calib.inputs = calib.inputs(:,subind);
calib.res  = calib.res(subind);

%h0 = 10;

%find optimal bandwidth
%calib.h = Opt_Hyp_Gauss_Ker_Reg( h0,calib.inputs,calib.res);



end
% 
% 
% for i=1:length(x1)
%     for j=1:length(x2)
%         z(i,j) =gaussian_kern_reg([x1(i) x2(j)]',snapx,gty, h);
%     end
% end
% 
% [x,y]=meshgrid(x2,x1);