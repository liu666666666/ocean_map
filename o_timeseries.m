function hand = o_timeseries(start_time,end_time,v)

%hand = o_timeseries([start_year start_month],[end_year end_month],v)
%  This function is used to plot the time series, it will convert the x
%  axie to the time format: 'yyyy/mm' automatically.
%  The syntax rules is the same with plot.

year_start = start_time(1);
month_start = start_time(2);
year_end = end_time(1);
month_end = end_time(2);
day_start = 1;
day_end = 1;


if numel(start_time) == 3
    day_start = start_time(3);
    day_end = end_time(3);
end

month=[];year=[];
for i = year_start:year_end
    year = [year i*ones(1,12)];
    month = [month [1:12]];
end
n_years = year_end - year_start;

year((n_years*12+month_end+1):end) = [];
month((n_years*12+month_end+1):end) = [];

plot(datenum(year,month,1),v,'linewidth',1);
datetick('x','yyyy');
x_min = datenum([num2str(year_start),'-',num2str(month_start),'-',num2str(day_start)]);
x_max = datenum([num2str(year_end),'-',num2str(month_end),'-',num2str(day_end)]);
set(gca,'Xlim',[x_min,x_max]);
end
    