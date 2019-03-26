function [box_x, box_z, ind_x, ind_z, cen_beam, np] = inputFileReadQpic(path,file)
% read the old version QuickPIC input file, and get what we want
%     path = '..\Quickpic\positron acceleration\';
%     file = '111_TransverseForceUnloaded\';

    path_input = [path,file,'rpinput'];
    fileID = fopen(path_input);
    tline = 'Lets start';
    flag_beam = 1;
    while ischar(tline)
        tline = tline(~isspace(tline));
        % read the box size
        index = strfind(tline,'Box_X');
        if index
            arr = strsplit(tline,{'=',','});
            box_x = str2double(cell2mat(arr(2)));
            box_z = str2double(cell2mat(arr(6)));
        end
        % read the box index
        index = strfind(tline,'INDX=');
        if index
            arr = strsplit(tline,{'=',','});
            ind_x = str2double(cell2mat(arr(2)));
            ind_z = str2double(cell2mat(arr(6)));
        end
        % read the center of the first beam
        index = strfind(tline,'Parameter_Array(1:1,1:3)');
        if index
            if (flag_beam~=0)
                arr = strsplit(tline,{'=',','});
                cen_beam = str2double(cell2mat(arr(5)));
                flag_beam = 0;
            end
        end
        % read the plasma density
        index = strfind(tline,'Plasma_Density=');
        if index
            arr = strsplit(tline,{'=',','});
            np = str2double(cell2mat(arr(2)));
        end
        tline = fgetl(fileID);
    end
    fclose(fileID);
end