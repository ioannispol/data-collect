#include <iostream>
#include <fstream>
#include <iomanip>
#include <librealsense2/rs.hpp>

rs2::video_stream_profile depth_stream;
std::pair<float, float> principal_point; 
std::pair<float, float> focal_length; 
rs2_extrinsics e;
rs2_intrinsics i;


void print_parameters ()
{
    // Write parameters to file
    std::fstream file_pts("intrinsic.txt", std::ios::trunc|std::ios::out);
    file_pts<<"Intrinsics Parameter"<<std::endl;
    file_pts<<"Depth sensor id: 1"<<std::endl;
	file_pts<<"width: "<<depth_stream.width()<<std::endl;
	file_pts<<"height: "<<depth_stream.height()<<std::endl;
	file_pts<<"ppx: "<<principal_point.first<<std::endl;
	file_pts<<"ppy: "<<principal_point.second<<std::endl;
	file_pts<<"fx: "<<focal_length.first<<std::endl;
	file_pts<<"fy: "<<focal_length.second<<std::endl;
	file_pts<<"distortion: "<<i.coeffs[0]<<" "<<i.coeffs[1]<<" "<<i.coeffs[2]<<" "<<i.coeffs[3]<<" "<<i.coeffs[4]<<std::endl;

    file_pts<<"-----------------------------"<<std::endl;
    file_pts<<std::endl;

    file_pts<<"Extrinsics Parameter"<<std::endl;
    file_pts<<"Color sensor id: 1"<<std::endl;
    file_pts << "Translation Vector : [" << e.translation[0] << "," << e.translation[1] << "," << e.translation[2] << "]\n";
    file_pts << "Rotation Matrix    : [" << e.rotation[0] << "," << e.rotation[3] << "," << e.rotation[6] << "]\n";
    file_pts << "                   : [" << e.rotation[1] << "," << e.rotation[4] << "," << e.rotation[7] << "]\n";
    file_pts << "                   : [" << e.rotation[2] << "," << e.rotation[5] << "," << e.rotation[8] << "]" << std::endl;

    file_pts.close();
    std::cout<<"Write to file successfully!"<<std::endl;
}