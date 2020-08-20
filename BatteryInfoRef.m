function cal_battery_life_year = BatteryInfoRef(is_adr,up_payload,up_interval,down_payload,down_interval,battery_capacity, get_tx_datarate, sf, tx_power)
    % 结合相关计算模型重构的Matlab版本计算模型
    % is_adr:是否开启ADR
    % up_payload：上报长度，字节
    % up_interval：上报间隔(Sec)
    % down_payload：下发长度(Byte)
    % down_interval：下发间隔(Sec)
    % battery_capacity：电池容量，mAh
    % get_tx_datarate:数据速率，bps
    % sf：SF，可选择的 6 个速率档位
    % tx_power：可选择的 6 个发射功率档位
    BC_sleep_current	= 0.0016;
    BC_rx_current = 13;
    BC_adr_tx_datarate = 681.5;     %一个用于模型验证的经验值
    BC_adr_tx_power = 15.86;
    BC_adr_tx_power_calvalue = 16;  %取整用于计算 tx_current，ADR 开启时取经验值常数
    BC_adr_rx1_rx2_time = 0.756; 
    BC_options_SF = [7, 8, 9, 10, 11, 12];
    BC_options_SF_tx_datarate = [5469,3125,1758,977,537,293];
    BC_options_tx_power = [10, 12, 14, 16, 17, 20];
    BC_options_SF_rx1_rx2_time = [0.041,0.072,0.144,0.289,0.578,0.991];
    BC_options_tx_current = [96, 108.3, 121.7, 133.2, 137.1, 142.1];
    txpower_calvalue=tx_power;
    if(is_adr)
        % get_tx_datarate=BC_adr_tx_datarate;
        txpower_calvalue=BC_adr_tx_power_calvalue;
        get_rx1_rx2_time=BC_adr_rx1_rx2_time;
    else
        % get_tx_datarate=BC_options_SF_tx_datarate(sf - 6);
        get_rx1_rx2_time=BC_options_SF_rx1_rx2_time(sf - 6);
    end
    if(find(BC_options_tx_power==txpower_calvalue))
        idx=find(BC_options_tx_power==txpower_calvalue);
        idx=idx(1);
    else
        idx=1;
    end
    get_tx_current=BC_options_tx_current(idx);
    get_tx_time=up_payload*8/get_tx_datarate;
    get_down_time=down_payload*8/get_tx_datarate;
    if(down_interval==0)
        get_rx_time=get_rx1_rx2_time*2;
    else
        get_rx_time=get_rx1_rx2_time*2+get_down_time*up_interval/down_interval;
    end
    st=up_interval-get_tx_time-get_rx_time;
    if(st<=0||isnan(st))
        get_sleep_time=0;
    else
        get_sleep_time=st;
    end
    get_tx_energy=get_tx_time*get_tx_current;
    get_rx_energy=get_rx_time*BC_rx_current;
    get_sleep_energy=get_sleep_time*BC_sleep_current;
    get_average_current=(get_tx_energy+get_rx_energy+get_sleep_energy)/up_interval;
    cal_battery_life_hour= battery_capacity / get_average_current;
    cal_battery_life_year=cal_battery_life_hour/(24 * 365);
end