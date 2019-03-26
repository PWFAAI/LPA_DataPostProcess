function [e,b] = transverseForceReadQpic(path,file,tstep,plane)

% read the transverse field, ex and by, in XZ plane
    if plane=='X'
        path_e = [path,file,'FEX-XZ\FEX-XZ_',num2str(tstep,'%04d'),'.h5'];
        name_e = ['/FEX-XZ-',num2str(tstep,'%04d')];
        hdf5info(path_e);
        e = hdf5read(path_e,name_e);

        path_b = [path,file,'FBY-XZ\FBY-XZ_',num2str(tstep,'%04d'),'.h5'];
        name_b = ['/FBY-XZ-',num2str(tstep,'%04d')];
        hdf5info(path_b);
        b = hdf5read(path_b,name_b);
    else
        path_e = [path,file,'FEY-YZ\FEY-YZ_',num2str(tstep,'%04d'),'.h5'];
        name_e = ['/FEY-YZ-',num2str(tstep,'%04d')];
        hdf5info(path_e);
        e = hdf5read(path_e,name_e);

        path_b = [path,file,'FBX-YZ\FBX-YZ_',num2str(tstep,'%04d'),'.h5'];
        name_b = ['/FBX-YZ-',num2str(tstep,'%04d')];
        hdf5info(path_b);
        b = hdf5read(path_b,name_b);
    end
end