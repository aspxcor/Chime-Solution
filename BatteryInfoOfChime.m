function cal_battery_life_year = BatteryInfoOfChime(up_payload,up_interval,down_payload,down_interval,battery_capacity, get_tx_datarate)
    % 综合作者论文数据及相关计算模型重构的Matlab版本计算模型
    % Model of Chime:Available Battery Energy: 2900mAh; 125kHz channels in 800MHz:6400; 
    % Energy of a typical LoRa packet: 100 mAs ; Battery spent = 6.13%
    % Typical client device current consumption for a complete LoRaWAN transmission. The device is powered at 3V.
    % up_payload：上报长度，字节
    % up_interval：上报间隔(Sec)
    % down_payload：下发长度(Byte)
    % down_interval：下发间隔(Sec)，取0表示不下发
    % battery_capacity：电池容量，mAh
    % get_tx_datarate: 数据速率，bps
    BC_sleep_current = 0.000287;
    BC_rx_current = 16.6;
    get_tx_current = 120.7;
    get_adr_rx_time = 1; 
    get_tx_time=up_payload*8/get_tx_datarate;
    get_down_time=down_payload*8/get_tx_datarate;
    if(down_interval==0)
        get_rx_time=get_adr_rx_time;
    else
        get_rx_time=get_adr_rx_time+get_down_time*up_interval/down_interval;
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