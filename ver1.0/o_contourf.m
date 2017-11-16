function [C,h]= o_contourf(varargin)
%[cs,h] = o_contourf(varargin)
%   This function is based on the m_map toolbox. So to use this function you
%   should download the m_map toolbox and add it to the matlab path first.
%   The syntax rules is the same with 'm_contourf', but it will add the
%   coast and grid automatically.
%
%   Edit by ZelunWu.
%   Webpage: http://www.zelunwu.com/category/#/Codes
%   Source Code: https://github.com/zelunwu/ocean_map/
%   E-mail: wuzelun@foxmail.com



warning off
% figure;
colormap jet
set(gcf,'position',[150,150,1080,480]); %Set figure position and size
lon = varargin{1};
lat = varargin{2};
lon = double(lon);
lat = double(lat);
v = varargin{3};

if max(lat)>80
    lat_range = [-65 65];
else
    lat_range = [min(lat) max(lat)];
end
lon_range = [min(lon) max(lon)];

m_proj('Mercator','lon',lon_range,'lat',lat_range); %Make a new project and define its range

if nargin == 3
    [C h] = m_contourf(lon,lat,v);
    set(h,'ShowText','off','TextStep',get(h,'LevelStep')*2);
else
    [C h] = m_contourf(lon,lat,v,varargin{4:end});
end

m_coast('patch',[0.5 0.5 0.5]); 
m_gshhs_i('color',[0.5 0.5 0.5]);  
m_grid; 
colorbar('vert'); 
xlabel('Longitude','fontweight','bold','fontsize',13);
ylabel('Latitude','fontweight','bold','fontsize',13);
%title(fig_title,'fontweight','bold','fontsize',14);
set(gca,'linewidth',1.5);
end
