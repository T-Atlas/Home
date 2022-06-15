package com.example.config;

import com.example.dao.LogMapper;
import com.example.dao.SensorMapper;
import com.example.model.Log;
import com.example.model.Sensor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import static cn.hutool.core.util.RandomUtil.randomDouble;


/**
 * @author LianJunhong
 */

@Component
public class AutoGenerator {
    @Autowired
    SensorMapper sensorMapper;
    @Autowired
    LogMapper logMapper;
    private double temperature = 30.0;
    private double humidity = 50.0;

    @Scheduled(cron = "0 0/30 * * * ?")
    public void generateDatesJob() {
        generateDates();
    }

    private void generateDates() {

        Sensor sensor = sensorMapper.selectByPrimaryKey(1);
        temperature = sensor.getTemperature() + randomDouble(-5.0, 5.0);
        humidity = sensor.getHumidity() + randomDouble(-10.0, 10.0);
        if (humidity > 0 && humidity < 100) {
            sensor.setHumidity(humidity);
        } else {
            sensor.setHumidity(50 + randomDouble(-10.0, 10.0));
        }
        if (temperature > -20 && temperature < 50) {
            sensor.setTemperature(temperature);
        } else {
            sensor.setTemperature(20 + randomDouble(-5.0, 5.0));
        }

        sensorMapper.updateByPrimaryKeySelective(sensor);

        Log log = new Log();
        log.setDeviceid(1);
        log.setTemperature(temperature);
        log.setHumidity(humidity);
        log.setRid(10);
        log.setTypeid(3);
        log.setLocation("room");

        logMapper.insertSelective(log);

    }
}
