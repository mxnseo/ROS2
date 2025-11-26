#include "rclcpp/rclcpp.hpp"
#include "dxl3/dxl.hpp"
#include <memory>
#include <chrono>
#include <iostream>

int main(int argc, char * argv[]) {
    rclcpp::init(argc, argv);
    auto node = std::make_shared<rclcpp::Node>("dxl");
    rclcpp::WallRate loop_rate(20.0); //반복주파수 10hz -> 주기는 0.1초 (역수)
    Dxl mx; //Dxl객체 생성
    
     //장치열기
    if(!mx.open()) {
        RCLCPP_INFO(node->get_logger(), "dynamixel open error\n");
        rclcpp::shutdown();
        return -1;
    }

    int speed = 0;
    int step = 10;
    int threshold = 100;

    while(rclcpp::ok()) {
        speed += step;

        if(speed >= threshold){
            speed = threshold;
            step = -10;
        }
        if(speed <= -threshold){
            speed = -threshold;
            step = 10;
        }

        RCLCPP_INFO(node->get_logger(), "speed: %d", speed);
        mx.setVelocity(speed, speed); //좌우 바퀴 속도명령 전송
        loop_rate.sleep();
    }
    mx.close();
    rclcpp::shutdown();
    return 0;
}
