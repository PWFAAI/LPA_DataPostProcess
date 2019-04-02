function [box_x, box_z, ind_x, ind_z, np, ndump, time, dt] = inputFileReadQpicNew(path,file)
% read the old version QuickPIC input file, and get what we want
% path = '..\';
% file = '31_pump_depletion_60000\';

    path_input = [path,file,'qpinput.json'];
    fileID = fopen(path_input);
    flag_beam = 1;
    tline = 'Lets start';
    while ischar(tline)
        tline = tline(~isspace(tline));
        % read the box index
        index = strfind(tline,'"indx"');
        if index
            arr = strsplit(tline,{':',','});
            ind_x = str2double(cell2mat(arr(2)));
            tline = fgetl(fileID);
            tline = fgetl(fileID);
            arr = strsplit(tline,{':',','});
            ind_z = str2double(cell2mat(arr(2)));
        end
        
        % read the box size
        index = strfind(tline,'"x"');
        if index
            arr = strsplit(tline,{':',',','[',']'});
            box_x = 2*str2double(cell2mat(arr(3)));
            tline = fgetl(fileID);
            tline = fgetl(fileID);
            arr = strsplit(tline,{':',',','[',']'});
            box_z = str2double(cell2mat(arr(4)));
        end
         
        % read the plasma density
        index = strfind(tline,'"n0"');
        if index
            arr = strsplit(tline,{':',','});
            np = str2double(cell2mat(arr(2)));
        end
        
        % read the dump frequency, only read the first one, assuming that
        % the others are the same
        index = strfind(tline,'"ndump"');
        if index
            if (flag_beam~=0)
                arr = strsplit(tline,{':',','});
                ndump = str2double(cell2mat(arr(2)));
            end
        end
        
        % read the time and dt
        index = strfind(tline,'"time"');
        if index
            arr = strsplit(tline,{':',','});
            time = str2double(cell2mat(arr(2)));
            tline = fgetl(fileID);
            arr = strsplit(tline,{':',','});
            dt = str2double(cell2mat(arr(2)));
        end
        tline = fgetl(fileID);
    end
    fclose(fileID);
end