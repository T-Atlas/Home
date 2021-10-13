package com.example.home;
import com.example.model.Sensor;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;


import static cn.hutool.core.util.RandomUtil.randomDouble;

@SpringBootTest
class HomeApplicationTests {

    @Test
    void contextLoads() {
    }

    @Test
    void autoTest() {

        double temperature = 30.0;
        double humidity = 50.0;
        double randomNumber =randomDouble();
        Sensor sensor = new Sensor();
        sensor.setHumidity(50.0);
        sensor.setTemperature(30.0);
        for(int i = 0; i <100;i++){
            temperature = sensor.getTemperature()+(randomNumber*10-5);
            humidity = sensor.getHumidity()+(randomNumber*20-10);
            if(humidity>0&&humidity<100){
                sensor.setHumidity(humidity);
            }else{
                sensor.setHumidity(50+(randomNumber*10-20));
            }
            if(temperature>-20&&temperature<50){
                sensor.setTemperature(temperature);
            }else{
                sensor.setTemperature(20+(randomNumber*5-10));
            }
            System.out.println("t="+temperature);
            System.out.println("h="+humidity);
        }
    }
}
