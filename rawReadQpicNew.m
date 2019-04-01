function raw = rawReadQpicNew(path,file,tstep,species)
% read the raw data of the new quickpic, the output is a structure.

    % clearvars;
    % path = '..\';
    % file = '31_pump_depletion_60000\';
    % tstep = 21;
    % species = 'Beam0001\';

    path_r = [path,file,species,'\Raw\raw_',num2str(tstep,'%08d'),'.h5'];
    hdf5info(path_r);
    raw.p1= hdf5read(path_r,'/p1');
    raw.p2 = hdf5read(path_r,'/p2');
    raw.p3 = hdf5read(path_r,'/p3');
    raw.x1 = hdf5read(path_r,'/x1');
    raw.x2 = hdf5read(path_r,'/x2');
    raw.x3 = hdf5read(path_r,'/x3');
    raw.q = hdf5read(path_r,'/q');

end