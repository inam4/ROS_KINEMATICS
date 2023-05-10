#include "ros/ros.h"
#include "std_msgs/String.h"
#include "sensor_msgs/JointState.h"
#include "kinematics_legged/bezier.h"
#include <typeinfo>
#define PI 3.1415926535897932384626433832795
#define HALF_PI 1.5707963267948966192313216916398
#define TWO_PI 6.283185307179586476925286766559
#define DEG_TO_RAD 0.017453292519943295769236907684886
#define RAD_TO_DEG 57.295779513082320876798154814105
// void chatterCallback(const kinematics_legged::bezier::ConstPtr& msg)
// {
//   std::vector<float> y;
//   y.reserve(msg->y.size());  // allocate memory for the output vector
//   for (const auto& element : msg->y) {
//     y.push_back(element.data);  // copy the value of each element to the output vector
//   }
 
//   ROS_INFO("I heard Y: [%f]", msg->y.data());
 
// }

std::vector<float> xBezier;
std::vector<float> yBezier;
std::vector<float> zBezier;

int size_vector;

void chatterCallback(const kinematics_legged::bezier::ConstPtr& msg) {
  ROS_INFO("Received %d elements in x, y, and z arrays", msg->x.size());

  // Print the contents of the x, y, and z arrays

  xBezier.resize(msg->x.size());
  yBezier.resize(msg->x.size());
  zBezier.resize(msg->z.size());

  float x=0;
  float y=0;
  float z=0;
  for (int i = 0; i < msg->x.size(); i++) {
    x=msg->x[i].data;
    y=msg->y[i].data;
    z=msg->z[i].data;
    size_vector = msg->x.size();
    
    
    // ROS_INFO("x[%zu]", i);
    xBezier[i]=x;
    yBezier[i]=y;
    zBezier[i]=z;
    //ROS_INFO("x=%f,y=%f,z=%f", xBezier[i],yBezier[i],zBezier[i]);  

  }
  

}

int main(int argc, char **argv)
{ 
  float r_1,r_2,r_3,phi_1,phi_2,theta_1,theta_2,theta_3; 

  float a_1 = 1;//cm
  float a_2 = 7;//cm
  float a_3 = 7;//cm

 


  ros::init(argc, argv, "inverse_kinematics_node");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("inverse_kinematics", 1000, chatterCallback);
  ros::Publisher pub = n.advertise<sensor_msgs::JointState>("joint_states", 1000);
  ros::Rate loop_rate(10);
  sensor_msgs::JointState joint_state_msg;
  joint_state_msg.name.resize(12);

  joint_state_msg.name[0] = "servo1_joint_1";
  joint_state_msg.name[1] = "servo2_joint_1";  
  joint_state_msg.name[2] = "servo3_joint_1";
  joint_state_msg.name[3] = "leg_2_servo1_joint_1";
  joint_state_msg.name[4] = "leg_2_servo2_joint_1";
  joint_state_msg.name[5] = "leg_2_servo3_joint_3";
  joint_state_msg.name[6] = "leg_3_servo1_joint_1";
  joint_state_msg.name[7] = "leg_3_servo2_joint_1";
  joint_state_msg.name[8] = "leg_3_servo3_joint_3";
  joint_state_msg.name[9] = "leg_4_servo1_joint_1";
  joint_state_msg.name[10] = "leg_4_servo2_joint_1";
  joint_state_msg.name[11] = "leg_4_servo3_joint_1";





  joint_state_msg.position.resize(12);
  joint_state_msg.position[0] = 0;
  joint_state_msg.position[1] = 0; 
  joint_state_msg.position[2] = 0;
  joint_state_msg.position[3] = 0;
  joint_state_msg.position[4] = 0;
  joint_state_msg.position[5] = 0;
  joint_state_msg.position[6] = 0;
  joint_state_msg.position[7] = 0;
  joint_state_msg.position[8] = 0;
  joint_state_msg.position[9] = 0;
  joint_state_msg.position[10] = 0;
  joint_state_msg.position[11] = 0;

  float rad_theta_1 =0;
  float rad_theta_2 = 0;
  float rad_theta_3 = 0;
  int count = 0;
  while (ros::ok())
  {
 
    // pub.publish(msg);
    
    joint_state_msg.header.stamp = ros::Time::now();
    ros::spinOnce();


    for (int h=0;h<size_vector;h++)
    {
 
      // ROS_INFO("SIZE = %d",size_vector);
      //ROS_INFO("x[%d] = %f, y[%d] = %f,z[%d] = %f",h,xBezier[h],h,yBezier[h],h,zBezier[h]);
      r_1 = sqrt((yBezier[h]*yBezier[h])+(xBezier[h]*xBezier[h]));
      r_2 = zBezier[h] - a_1;
      r_3 = sqrt((r_1*r_1)+(r_2*r_2));
      float phi_1_value = ((a_3*a_3) - (a_2*a_2) - (r_3*r_3)) / (-2*a_2*r_3);
      if (phi_1_value > 1) {
      phi_1_value = 1;
      }     
      phi_1 = acos(phi_1_value);
      phi_2 = atan(r_2/r_1);

      theta_2 = ((PI)+phi_1+phi_2)*RAD_TO_DEG;

      float theta_3_value = (-(a_3*a_3)-(a_2*a_2)+(r_3*r_3))/(-2*a_2*a_3);
      if (theta_3_value < -1) {
          theta_3_value = -1;
      }
      theta_3 = acos(theta_3_value)*RAD_TO_DEG;
      theta_1 = atan2(yBezier[h],xBezier[h])*RAD_TO_DEG;

      if (theta_1<0) 
      {
        theta_1 = theta_1+360;
      } 
      // rad_theta_1 = (theta_1-180);
      // rad_theta_2 = (theta_2-90);
      // rad_theta_3 = theta_3;
      rad_theta_1 = (theta_1-270)*DEG_TO_RAD;
      rad_theta_2 = (180-theta_2)*DEG_TO_RAD;
      rad_theta_3 = (180-theta_3)*DEG_TO_RAD;
      // float pulse_1 =servo1_min_pulse+(pulse_factor_1)*(theta_1-180); 
      // float pulse_2 =servo2_min_pulse+(pulse_factor_2)*(theta_2-90); 
      // float pulse_3 =servo3_min_pulse+(pulse_factor_3)*(theta_3); 
      
      // String p1=";";

      // servo1.writeMicroseconds(pulse_1);
      // servo2.writeMicroseconds(pulse_2);
      // servo3.writeMicroseconds(pulse_3);    
      // delay(250);
      ROS_INFO("theta1 = %f, theta2 = %f, theta3 = %f", rad_theta_1,rad_theta_2,rad_theta_3);
      joint_state_msg.position[0] =rad_theta_1;
      joint_state_msg.position[1] = rad_theta_2;; 
      joint_state_msg.position[2] = rad_theta_3;
      pub.publish(joint_state_msg);
      
      // ros::spinOnce();
      loop_rate.sleep(); 
      
    } 


    ++count;
  }

  // ROS_INFO("YO");
  // ros::spinOnce();
  // ROS_INFO("ME");
  return 0;
}