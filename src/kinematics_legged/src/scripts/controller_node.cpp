

#include <ros/ros.h>

#include <sensor_msgs/Joy.h>



void joyCallback(const sensor_msgs::Joy::ConstPtr& msg) 
{
  ROS_INFO("Received %d elements in x, y, and z arrays", msg->axes.size());
  for (int i = 0; i < msg->axes.size(); i++) {
    ROS_INFO("Axis %d: %f", i, msg->axes[i]);
  }
  // Print the contents of the x, y, and z arrays

//   xBezier.resize(msg->x.size());
//   yBezier.resize(msg->x.size());
//   zBezier.resize(msg->z.size());



//   float x=0;
//   float y=0;
//   float z=0;

//   for (int i = 0; i < msg->x.size(); i++) {
//     x=msg->x[i].data;
//     y=msg->y[i].data;
//     z=msg->z[i].data;
    
//     //ROS_INFO("%s", typeid(msg->x[i].data).name());  
    
//     ROS_INFO("x[%d] = %f, y[%d] = %f, z[%d] = %f", i, x, i, y, i, z);
 
//     xBezier.push_back(x);
//     yBezier.push_back(y);
//     zBezier.push_back(z);

  }
  





int main(int argc, char **argv)
{

  ros::init(argc, argv, "controller_node");

 
  ros::NodeHandle n;
  //ros::Publisher inverse_pub = n.advertise<kinematics_legged::bezier>("inverse_kinematics", 1000);
  //kinematics_legged::bezier bezier_msg;
  ros::Subscriber sub = n.subscribe("joy", 1000, joyCallback);




  ros::spin();
  


  return 0;
}