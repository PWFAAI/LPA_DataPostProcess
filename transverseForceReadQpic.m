function [ex,by] = transverseForceReadQpic(path,file,tstep)
% read the transverse field, ex and by, in XZ plane
    path_fex = [path,file,'FEX-XZ\FEX-XZ_',num2str(tstep,'%04d'),'.h5'];
    name_fex = ['/FEX-XZ-',num2str(tstep,'%04d')];
    hdf5info(path_fex);
    ex = hdf5read(path_fex,name_fex);

    path_fby = [path,file,'FBY-XZ\FBY-XZ_',num2str(tstep,'%04d'),'.h5'];
    name_fby = ['/FBY-XZ-',num2str(tstep,'%04d')];
    hdf5info(path_fby);
    by = hdf5read(path_fby,name_fby);
end