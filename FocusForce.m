clearvars;

path = '..\Quickpic\positron acceleration\';
file = '111_TransverseForceUnloaded\';
tstep = 600;

[box_x, box_z, ind_x, ind_z, cen_beam, np] = inputFileReadQpic(path,file);
kp = sqrt(np*1e6*(1.6e-19)^2/8.85e-12/9.1e-31)/3e8;
x = linspace(-box_x*1e-6*kp/2,box_x*1e-6*kp/2,2^ind_x);
z = linspace(-cen_beam*1e-6*kp,(box_z-cen_beam)*1e-6*kp,2^ind_z);

[ex,by] = transverseForceReadQpic(path,file,tstep,'X');
[ey,bx] = transverseForceReadQpic(path,file,tstep,'Y');

fx = ex-by;
fy = ey+bx;
figure(1)
imagesc(z,x,fx);
z_slice = [7.5, 8, 8.5];
for i = 1:length(z_slice)
    tag = round((z_slice(i)/1e-6/kp+cen_beam)/box_z*2^ind_z);
    fx_line = fx(:,tag);
    fy_line = fy(:,tag);

    figure(2);
    hold on
    plot(x,fx_line)
    xlabel('x(c/\omega_p)');
    ylabel('E_x-B_y(mc\omega_p/e)');
    title('transverse wakefield in XZ plane')
   

    figure(4);
    hold on;
    plot(x,fy_line)
    xlabel('y(c/\omega_p)');
    ylabel('E_y+-B_x(mc\omega_p/e)');
    title('transverse wakefield in YZ plane')
end
figure(2);hold off;
figure(4); hold off;
