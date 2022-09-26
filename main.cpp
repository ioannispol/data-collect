#include <iostream>
#include <fstream>

using namespace std;


#include <librealsense2/rs.hpp>
#include <librealsense2/rsutil.h>

int main(int argc, char** argv){
	cout<<"Waiting for device..."<<endl;

	rs2::pipeline pipe;
	rs2::config cfg;

	//cfg.enable_stream(RS2_STREAM_POSE, RS2_FORMAT_6DOF);

	cfg.enable_stream(RS2_STREAM_DEPTH, 1);
	cfg.enable_stream(RS2_STREAM_COLOR, 2);

	rs2::pipeline_profile pipe_profile = pipe.start(cfg);

	int depth_sensor_idx =1;

	rs2::stream_profile depth_stream = pipe_profile.get_stream(RS2_STREAM_DEPTH, depth_sensor_idx);
	rs2_intrinsics intrinsics = depth_stream.as<rs2::video_stream_profile>().get_intrinsics();
	cout<<"Intrinsics sensor 1."<<endl;

  depth_sensor_idx =2;
	rs2::stream_profile depth_stream2 = pipe_profile.get_stream(RS2_STREAM_COLOR, depth_sensor_idx);
	rs2_intrinsics intrinsics2 = depth_stream2.as<rs2::video_stream_profile>().get_intrinsics();
  cout<<"Intrinsics sensor 2."<<endl;
  
  rs2_extrinsics e=depth_stream2.get_extrinsics_to(depth_stream);

  fstream file_pts("intrinsic.txt", ios::trunc|ios::out);
	
  file_pts<<"Intrinsics Parameter"<<endl;
  file_pts<<"fisheyes sensor id: 1"<<endl;
	file_pts<<"width: "<<intrinsics.width<<endl;
	file_pts<<"height: "<<intrinsics.height<<endl;
	file_pts<<"ppx: "<<intrinsics.ppx<<endl;
	file_pts<<"ppy: "<<intrinsics.ppy<<endl;
	file_pts<<"fx: "<<intrinsics.fx<<endl;
	file_pts<<"fy: "<<intrinsics.fy<<endl;
	file_pts<<"distortion: "<<intrinsics.coeffs[0]<<" "<<intrinsics.coeffs[1]<<" "<<intrinsics.coeffs[2]<<" "<<intrinsics.coeffs[3]<<" "<<intrinsics.coeffs[4]<<endl;

  file_pts<<"-----------------------------"<<endl;
  file_pts<<endl;
  
  file_pts<<"fisheyes sensor id: 2"<<endl;
	file_pts<<"width: "<<intrinsics2.width<<endl;
	file_pts<<"height: "<<intrinsics2.height<<endl;
	file_pts<<"ppx: "<<intrinsics2.ppx<<endl;
	file_pts<<"ppy: "<<intrinsics2.ppy<<endl;
	file_pts<<"fx: "<<intrinsics2.fx<<endl;
	file_pts<<"fy: "<<intrinsics2.fy<<endl;
	file_pts<<"distortion: "<<intrinsics2.coeffs[0]<<" "<<intrinsics2.coeffs[1]<<" "<<intrinsics2.coeffs[2]<<" "<<intrinsics2.coeffs[3]<<" "<<intrinsics2.coeffs[4]<<endl;


  file_pts<<"-----------------------------"<<endl;
  file_pts<<endl;

  file_pts<<"Extrinsics Parameters, In fisheye 1 coordinate"<<endl;

  file_pts<<"Rotation Matrix: "<<endl;
  file_pts<<e.rotation[0]<<" "<<e.rotation[1]<<" "<<e.rotation[2]<<endl
           <<e.rotation[3]<<" "<<e.rotation[4]<<" "<<e.rotation[5]<<endl
            <<e.rotation[6]<<" "<<e.rotation[7]<<" "<<e.rotation[9]<<endl;

  file_pts<<"Translation Vector: "<<endl;
  file_pts<<e.translation[0]<<" "<<e.translation[1]<<" "<<e.translation[2]<<endl;
  file_pts<<"--------------------------------"<<endl;
	file_pts.close();
	cout<<"intrinsics are written in file."<<endl;

	return 0;
}
