function [h] = o_pcolor(varargin);
%[cs,h] = o_contourf(lon,lat,v)
%   This function is based on the m_map toolbox. So to use this function you
%   should download the m_map toolbox and add it to the matlab path first.
%   The syntax rules is the same with 'm_pcolor', but it will add the
%   coast and grid automatically.
%
%
%   Edit by ZelunWu.
%   Webpage: http://www.zelunwu.com/category/#/Codes
%   Source Code: https://github.com/zelunwu/ocean_map/
%   E-mail: wuzelun@foxmail.com

warning off
% figure;
colormap jet
lon = varargin{1};
lat = varargin{2};
lon = double(lon);
lat = double(lat);
v = varargin{3};
v = double(v);

if max(lat)>80
    lat_range = [-70 70];
else
    lat_range = [min(lat) max(lat)];
end
lon_range = [min(lon) max(lon)];

m_proj('Mercator','lon',lon_range,'lat',lat_range); %Make a new project and define its range

if nargin == 3
    [h] = m_pcolor(lon,lat,v);
else
    [h] = m_pcolor(lon,lat,v,varargin{4:end});
end

shading flat;
m_coast('patch',[0.5 0.5 0.5]); 
m_gshhs_i('color',[0.5 0.5 0.5]);  
m_grid; 
colorbar('vert'); 
xlabel('Longitude','fontweight','bold','fontsize',13);
ylabel('Latitude','fontweight','bold','fontsize',13);
%title(fig_title,'fontweight','bold','fontsize',14);
set(gca,'linewidth',1.5);
end
