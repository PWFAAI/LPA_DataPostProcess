function [x1_center,x2_center] = calBeamCenter(raw,head,tail)
% given the region of interest, calculate the beam center during that
% intercal

tag = raw.x3<=tail & raw.x3>=head;
x1_center = mean(raw.x1(tag));
x2_center = mean(raw.x2(tag));

end