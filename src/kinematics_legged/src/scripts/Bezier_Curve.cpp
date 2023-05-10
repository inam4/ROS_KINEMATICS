#include "ros/ros.h"
#include <sstream>
#include "msg/bezier.h"

float tgamma(int k)
    {
        int fact=1;    
        for(int q=1;q<=k;q++)
        {    
            fact=fact*q;
        }
        return fact;       
    }

float Ni(int an, int vi)
{
    return tgamma(an)/(tgamma(vi)*tgamma(an - vi));
}

float* basisFunction(int n,int oi)
{
    float t[] = {0, 0.09090909, 0.18181818, 0.27272727, 0.36363636,0.45454545, 0.54545455, 0.63636364, 0.72727273, 0.81818182,0.90909091, 1};

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
  ros::Publisher inverse_pub = n.advertise<msgs::bezier>("inverse_kinematics", 1000);

  msgs::bezier bezier_msg;


  
  ros::Rate loop_rate(10);


  while (ros::ok())
  {
    

//<-------------------------Bezier Curve------------------------->
    float x[] = {0,0,0,0};
    float y[] = {-7,-4,-4,-7};
    float z[] = {-5,-1,1,5};

    const int cells =12;
    int nCPTs=4;
    int n_o= nCPTs-1; //size of array
    int i=0;


    float xBezier[cells];
    float yBezier[cells];
    float zBezier[cells];

    


//<-------------------------X------------------------->
    int n = n_o;
    bezier_msg.x.resize(cells);
    bezier_msg.y.resize(cells);
    bezier_msg.z.resize(cells);
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
        bezier_msg.x[p] = xBezier[p];
        bezier_msg.y[p] = yBezier[p];
        bezier_msg.z[p] = zBezier[p];
      }
    

      
    }
    inverse_pub.publish(msg);
    
    ros::spinOnce();

    loop_rate.sleep();

  }


  return 0;
}