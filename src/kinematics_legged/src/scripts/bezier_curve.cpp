#include "ros/ros.h"
#include <sstream>
#include "kinematics_legged/bezier.h"




const int cells =30;
int nCPTs=3;
int n_o= nCPTs-1;

float tgamma(int k)
{
  int fact=1;    
  for(int q=1;q<=k;q++)
  {    
      fact=fact*q;
  }
  return fact;       
}

float Ni(int an, int vi) {
  return tgamma(an)/(tgamma(vi)*tgamma(an - vi));
}

float* basisFunction(int n,int oi)
{
  // float t[] ={0.        , 0.01694915, 0.03389831, 0.05084746, 0.06779661,
  //      0.08474576, 0.10169492, 0.11864407, 0.13559322, 0.15254237,
  //      0.16949153, 0.18644068, 0.20338983, 0.22033898, 0.23728814,
  //      0.25423729, 0.27118644, 0.28813559, 0.30508475, 0.3220339 ,
  //      0.33898305, 0.3559322 , 0.37288136, 0.38983051, 0.40677966,
  //      0.42372881, 0.44067797, 0.45762712, 0.47457627, 0.49152542,
  //      0.50847458, 0.52542373, 0.54237288, 0.55932203, 0.57627119,
  //      0.59322034, 0.61016949, 0.62711864, 0.6440678 , 0.66101695,
  //      0.6779661 , 0.69491525, 0.71186441, 0.72881356, 0.74576271,
  //      0.76271186, 0.77966102, 0.79661017, 0.81355932, 0.83050847,
  //      0.84745763, 0.86440678, 0.88135593, 0.89830508, 0.91525424,
  //      0.93220339, 0.94915254, 0.96610169, 0.98305085, 1.       };
  float t[]={0.        , 0.03448276, 0.06896552, 0.10344828, 0.13793103,
       0.17241379, 0.20689655, 0.24137931, 0.27586207, 0.31034483,
       0.34482759, 0.37931034, 0.4137931 , 0.44827586, 0.48275862,
       0.51724138, 0.55172414, 0.5862069 , 0.62068966, 0.65517241,
       0.68965517, 0.72413793, 0.75862069, 0.79310345, 0.82758621,
       0.86206897, 0.89655172, 0.93103448, 0.96551724, 1.      };     

  float* J = new float[cells];
  for (int j = 0; j < cells; j++) {
    // std::cout<<"-----------------"<<Ni(n,oi)<<"-----------------"<<std::endl;  
    J[j] = Ni(n, oi) * pow(t[j], oi) * pow(1-t[j], n-oi);
  }
  return J;
}


int main(int argc, char **argv)
{

  ros::init(argc, argv, "bezier_curve");

 
  ros::NodeHandle n;
  ros::Publisher inverse_pub = n.advertise<kinematics_legged::bezier>("inverse_kinematics", 1000);

  kinematics_legged::bezier bezier_msg;


  
  ros::Rate loop_rate(10);


  while (ros::ok())
  {
    

//<-------------------------Bezier Curve------------------------->
    float x[] = {0,0,0}; //gcs system -x
    float y[] = {-9,-14,-9}; //gcs system -z 
    float z[] = {-10,1,10}; //gcs sytem y

    // float z[] ={9,14,9}; 
    // float x[] =  {-10,1,10};
    // float y[] = {0,0,0}; 
    int i=0;

    float xBezier[cells]={0};
    float yBezier[cells]={0};
    float zBezier[cells]={0};

//<-------------------------X------------------------->
    int n = n_o;
    bezier_msg.x.resize(cells);
    bezier_msg.y.resize(cells);
    bezier_msg.z.resize(cells);
    std_msgs::Float32 x_value;
    std_msgs::Float32 y_value;
    std_msgs::Float32 z_value;
    for (int j = 0; j < nCPTs; j++) 
    {
      
      float* b;
      b=basisFunction(n, j);  
    //   std::cout<<"----------------------"<<n<<"------n----------"<<std::endl;
      for(int p=0;p<cells;p++)
      { 
        
        
        xBezier[p] += (b[p] * x[j]);
        yBezier[p] = (b[p] * y[j])+yBezier[p] ;
        zBezier[p] += b[p] * z[j];
        x_value.data = xBezier[p];
        y_value.data = yBezier[p];
        z_value.data = zBezier[p];
        bezier_msg.x[p] = x_value;
        bezier_msg.y[p] = y_value;
        bezier_msg.z[p] = z_value;
        
      }

    }
    
    for(int p=0;p<cells;p++)
      { 
        xBezier[p] = 0;
        yBezier[p] = 0;
        zBezier[p] = 0;

      }
 
    inverse_pub.publish(bezier_msg);
    loop_rate.sleep();

  }
  return 0;
}