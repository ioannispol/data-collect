#include <iostream>
#include <fstream>
#include <set>
#include <iomanip>

using namespace std;


#include <librealsense2/rs.hpp>
#include <librealsense2/rsutil.h>
#include <librealsense2/h/rs_sensor.h>

std::vector<std::string> tokenize_floats(string input, char separator) {
    std::vector<std::string> tokens;
    stringstream ss(input);
    string token;

    while (std::getline(ss, token, separator)) {
        tokens.push_back(token);
    }

    return tokens;
}

void print(const rs2_extrinsics& extrinsics)
{
    stringstream ss;
    ss << " Rotation Matrix:\n";

    // Align displayed data along decimal point
    for (auto i = 0; i < 3; ++i)
    {
        for (auto j = 0; j < 3; ++j)
        {
            std::ostringstream oss;
            oss << extrinsics.rotation[j * 3 + i];
            auto tokens = tokenize_floats(oss.str().c_str(), '.');
            ss << right << setw(4) << tokens[0];
            if (tokens.size() > 1)
                ss << "." << left << setw(12) << tokens[1];
        }
        ss << endl;
    }

    ss << "\n Translation Vector: ";
    for (auto i = 0u; i < sizeof(extrinsics.translation) / sizeof(extrinsics.translation[0]); ++i)
        ss << setprecision(15) << extrinsics.translation[i] << "  ";

    cout << ss.str() << endl << endl;
}
// TODO: Print intrinsics/extrinsics using "void print" function


// Get Video Stream Intrinsics

int main(int argc, char** argv){
    rs2::pipeline pipe;

    rs2::pipeline_profile selection = pipe.start();

    // Depth stream
    auto depth_stream = selection.get_stream(RS2_STREAM_DEPTH)
                                .as<rs2::video_stream_profile>();
    auto resolution = std::make_pair(depth_stream.width(), depth_stream.height());

    // Color stream
    auto color_stream = selection.get_stream(RS2_STREAM_COLOR);

    cout << "Depth Stream Resolution: " << resolution.first << "x" << resolution.second << endl;

    auto i = depth_stream.get_intrinsics();
    auto principal_point = std::make_pair(i.ppx, i.ppy);
    cout << "Principal Point: " << principal_point.first << ", " << principal_point.second << endl;

    auto focal_length = std::make_pair(i.fx, i.fy);
    cout << "Focal Length: " << focal_length.first << ", " << focal_length.second << endl;

    rs2_distortion model = i.model;
    cout << "Distortion Model: " << model << endl;

    auto distortion = std::make_tuple(i.coeffs[0], i.coeffs[1], i.coeffs[2], i.coeffs[3], i.coeffs[4]);
    cout << "Distortion Coefficients: " << std::get<0>(distortion) << ", " << std::get<1>(distortion) << ", " << std::get<2>(distortion) << ", " << std::get<3>(distortion) << ", " << std::get<4>(distortion)<< endl;

    rs2_extrinsics e = depth_stream.get_extrinsics_to(color_stream);
    // Apply extrinsics to the origin
    float origin[3] { 0.f, 0.f, 0.f };
    float target[3];

    rs2_transform_point_to_point(target, &e, origin);
    std::cout << "Translation Vector : [" << e.translation[0] << "," << e.translation[1] << "," << e.translation[2] << "]\n";
    std::cout << "Rotation Matrix    : [" << e.rotation[0] << "," << e.rotation[3] << "," << e.rotation[6] << "]\n";
    std::cout << "                   : [" << e.rotation[1] << "," << e.rotation[4] << "," << e.rotation[7] << "]\n";
    std::cout << "                   : [" << e.rotation[2] << "," << e.rotation[5] << "," << e.rotation[8] << "]" << std::endl;

    // Write parameters to file
    fstream file_pts("intrinsic.txt", ios::trunc|ios::out);
    file_pts<<"Intrinsics Parameter"<<endl;
    file_pts<<"Depth sensor id: 1"<<endl;
	file_pts<<"width: "<<depth_stream.width()<<endl;
	file_pts<<"height: "<<depth_stream.height()<<endl;
	file_pts<<"ppx: "<<principal_point.first<<endl;
	file_pts<<"ppy: "<<principal_point.second<<endl;
	file_pts<<"fx: "<<focal_length.first<<endl;
	file_pts<<"fy: "<<focal_length.second<<endl;
	file_pts<<"distortion: "<<i.coeffs[0]<<" "<<i.coeffs[1]<<" "<<i.coeffs[2]<<" "<<i.coeffs[3]<<" "<<i.coeffs[4]<<endl;

    file_pts<<"-----------------------------"<<endl;
    file_pts<<endl;

    file_pts<<"Extrinsics Parameter"<<endl;
    file_pts<<"Color sensor id: 1"<<endl;
    file_pts << "Translation Vector : [" << e.translation[0] << "," << e.translation[1] << "," << e.translation[2] << "]\n";
    file_pts << "Rotation Matrix    : [" << e.rotation[0] << "," << e.rotation[3] << "," << e.rotation[6] << "]\n";
    file_pts << "                   : [" << e.rotation[1] << "," << e.rotation[4] << "," << e.rotation[7] << "]\n";
    file_pts << "                   : [" << e.rotation[2] << "," << e.rotation[5] << "," << e.rotation[8] << "]" << std::endl;

    file_pts.close();
    cout<<"Write to file successfully!"<<endl;
    
    // while (true)
    // {   
       
    //     rs2::frameset frames = pipe.wait_for_frames();
    //     rs2::depth_frame depth = frames.get_depth_frame();
    //     float width = depth.get_width();
    //     float height = depth.get_height();
    
    //     float dist_to_ctr = depth.get_distance(width/2, height/2);
    //     std::cout << "The camera is facing an object " << dist_to_ctr << " meters away \r";
              

    // }
 
    do {
        // std::cout << "Press any key to continue..." << std::endl;
        // if (std::getchar() == 'q') 
        // {
        //     std::cout << "Exiting the app!" << std::endl; 
        //     break;
        // }

        rs2::frameset frames = pipe.wait_for_frames();
        rs2::depth_frame depth = frames.get_depth_frame();
        float width = depth.get_width();
        float height = depth.get_height();
    
        float dist_to_ctr = depth.get_distance(width/2, height/2);
        std::cout << "The camera is facing an object " << dist_to_ctr << " meters away \r";
    } while (true);


    return 0;
}