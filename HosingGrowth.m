clearvars;
path = '..\';
file = '31_pump_depletion_60000\';
species = 'Beam0002\';
% read the input file
[box_x, box_z, ind_x, ind_z, np, ndump, time, dt] = inputFileReadQpicNew(path,file);

iter = round((time-1)/dt/ndump);
% iter = 125;
z = linspace(ndump,ndump+(iter-1)*ndump*dt,iter);

% read the initial beam parameters
raw = rawReadQpicNew(path,file,1,species);
N = 1000;
N_particle = length(raw.x1);
tail = max(raw.x3);
head = min(raw.x3);
dx3 = (tail-head)/(N_particle/N);
[x10,x20] = calBeamCenter(raw,tail-dx3,tail);

x1 = zeros(iter,1);
x2 = zeros(iter,1);
tstep = 1;
% read the evolution of beam center
for i = 1:iter
    raw = rawReadQpicNew(path,file,tstep,species);
    [x1(i),x2(i)] = calBeamCenter(raw,tail-dx3,tail);
    tstep = tstep+ndump;
end

figure(1);
plot(z,x2);
% ylim([20 30]);
xlabel('Time(1/\omega_p)');
ylabel('x(c/\omega_p)');
title(erase(species,'\'));

figure(2);
plot(z(1:150),x1(1:150));
xlabel('Time(1/\omega_p)');
ylabel('x(c/\omega_p)');
title(erase(species,'\'));