#pragma once
#include <librealsense2/rs.hpp>
#include <iostream>
#include <mutex>
#include <chrono>
#include <iomanip>
#include <fstream>
#include "tclap/CmdLine.h"
#include <time.h>
#include <thread>

struct stream_options 
{
    static void enable_depth(rs2::config& cfg)
    {
        std::cout << "Enabling Depth stream" << std::endl;
        cfg.enable_stream(RS2_STREAM_DEPTH, 640, 480, RS2_FORMAT_Z16, 30);
    }
    static void enable_infrared(rs2::config& cfg)
    {
        std::cout << "Enabling Infrared streams #1 & #2" << std::endl;
        cfg.enable_stream(RS2_STREAM_INFRARED, 1, 640, 480, RS2_FORMAT_Y8, 30);
        cfg.enable_stream(RS2_STREAM_INFRARED, 2, 640, 480, RS2_FORMAT_Y8, 30);
    }
    static void enable_color(rs2::config& cfg)
    {
        std::cout << "Enabling Color stream" << std::endl;
        cfg.enable_stream(RS2_STREAM_COLOR, 640, 480, RS2_FORMAT_RGB8, 30);
    }
};

std::mutex m;
    
auto countdown = [](const rs2::frame& frame)
{
    std::lock_guard<std::mutex> lock(m);
    auto t = std::chrono::system_clock::now();
    static auto tk = t;
    static auto t0 = t;

    if (t - tk >= std::chrono::seconds(1))
    {
        std::cout<< "\r" << std::setprecision(3) << std::fixed << "Recoding t = " << std::chrono::duration_cast<std::chrono::seconds>(t - t0).count() << " seconds" << std::flush;
        tk = t;
    }
};

struct pipeline_enalbe
{

    static void start(rs2::pipeline& pipe, rs2::config& cfg)
    {
        std::cout << "Starting pipeline" << std::endl;
        pipe.start(cfg, countdown);
    }

    static void stop(rs2::pipeline& pipe)
    {
        std::cout << "Stopping pipeline" << std::endl;
        pipe.stop();
    }
};

struct get_streams
{
    static void depth_stream(rs2::pipeline& pipe)
    {
        std::cout << "Depth stream is enabled" << std::endl;
        auto profile = pipe.get_active_profile();
        auto stream = profile.get_stream(RS2_STREAM_DEPTH).as<rs2::video_stream_profile>();
        std::cout << "Depth stream resolution: " << stream.width() << "x" << stream.height() << std::endl;
    }

    static void infrared_stream(rs2::pipeline& pipe)
    {
        std::cout << "Infrared stream is enabled" << std::endl;
        auto profile = pipe.get_active_profile();
        auto stream = profile.get_stream(RS2_STREAM_INFRARED).as<rs2::video_stream_profile>();
        std::cout << "Infrared stream resolution: " << stream.width() << "x" << stream.height() << std::endl;
    }

    static void color_stream(rs2::pipeline& pipe)
    {
        std::cout << "Color stream is enabled" << std::endl;
        auto profile = pipe.get_active_profile();
        auto stream = profile.get_stream(RS2_STREAM_COLOR).as<rs2::video_stream_profile>();
        std::cout << "Color stream resolution: " << stream.width() << "x" << stream.height() << std::endl;
    }
};

struct parameters
{
    static void get_intrinsics(const rs2::stream_profile& stream)
    {
        if (auto video_stream = stream.as<rs2::video_stream_profile>())
        {
            try
            {
                rs2_intrinsics intrinsics = video_stream.get_intrinsics();

                std::cout << "Intrinsics: " << std::endl;
                std::cout << "Width: " << intrinsics.width << std::endl;
                std::cout << "Height: " << intrinsics.height << std::endl;
                std::cout << "PPX: " << intrinsics.ppx << std::endl;
                std::cout << "PPY: " << intrinsics.ppy << std::endl;
                std::cout << "FX: " << intrinsics.fx << std::endl;
                std::cout << "FY: " << intrinsics.fy << std::endl;
                std::cout << "Distortion model: " << intrinsics.model << std::endl;
                std::cout << "Coefficients: [" << intrinsics.coeffs[0] << " " << intrinsics.coeffs[1] << " " << intrinsics.coeffs[2] << " " << intrinsics.coeffs[3] << " " << intrinsics.coeffs[4] << "]" << std::endl;

            }
            catch(const rs2::error& e)
            {
                std::cerr << "Failed to get intrinsics from the camera stream: " << e.what() << std::endl;
            }
        }
        else
        {
            std::cerr << "Given stream profile has no intrinsics data" << std::endl;
        }
        
    }

    static void get_extrinsics(const rs2::stream_profile& from_stream, const rs2::stream_profile& to_stream)
    {
        try
        {
            rs2_extrinsics extrinsics = from_stream.get_extrinsics_to(to_stream);
            std::cout << "Extrinsics: " << std::endl;
            std::cout << "Rotation Matrix: " << std::endl;
            std::cout << extrinsics.rotation[0] << " " << extrinsics.rotation[1] << " " << extrinsics.rotation[2] << std::endl;
            std::cout << extrinsics.rotation[3] << " " << extrinsics.rotation[4] << " " << extrinsics.rotation[5] << std::endl;
            std::cout << extrinsics.rotation[6] << " " << extrinsics.rotation[7] << " " << extrinsics.rotation[8] << std::endl;
            std::cout << "Translation Vector: " << std::endl;
            std::cout << "[" << extrinsics.translation[0] << " " << extrinsics.translation[1] << " " << extrinsics.translation[2] << "]" << std::endl;
        }
        catch (const rs2::error& e)
        {
            std::cerr << "Failed to get extrinsics from the camera stream: " << e.what() << std::endl;
        }
    }

};


void print_parameters(
                const rs2::stream_profile& stream, 
                const rs2::stream_profile& from_stream, 
                const rs2::stream_profile& to_stream
                )
{
    auto video_stream = stream.as<rs2::video_stream_profile>();
    rs2_intrinsics intrinsics = video_stream.get_intrinsics();
    rs2_extrinsics extrinsics = from_stream.get_extrinsics_to(to_stream);

    // Write parameters to file
    std::fstream file_pts("intrinsics.txt", std::ios::trunc|std::ios::out);
    file_pts << "Intrinsics: " << std::endl;
    file_pts << "Width: " << intrinsics.width << std::endl;
    file_pts << "Height: " << intrinsics.height << std::endl;
    file_pts << "PPX: " << intrinsics.ppx << std::endl;
    file_pts << "PPY: " << intrinsics.ppy << std::endl;
    file_pts << "FX: " << intrinsics.fx << std::endl;
    file_pts << "FY: " << intrinsics.fy << std::endl;
    file_pts << "Distortion model: " << intrinsics.model << std::endl;
    file_pts << "Coefficients: [" << intrinsics.coeffs[0] << " " << intrinsics.coeffs[1] << " " << intrinsics.coeffs[2] << " " << intrinsics.coeffs[3] << " " << intrinsics.coeffs[4] << "]" << std::endl;

    file_pts<<"-----------------------------"<<std::endl;
    file_pts<<std::endl;

    file_pts<<"Extrinsics Parameter"<<std::endl;
    file_pts<<"Color sensor id: 1"<<std::endl;
    file_pts << "Rotation Matrix: " << std::endl;
    file_pts << extrinsics.rotation[0] << " " << extrinsics.rotation[1] << " " << extrinsics.rotation[2] << std::endl;
    file_pts << extrinsics.rotation[3] << " " << extrinsics.rotation[4] << " " << extrinsics.rotation[5] << std::endl;
    file_pts << extrinsics.rotation[6] << " " << extrinsics.rotation[7] << " " << extrinsics.rotation[8] << std::endl;
    file_pts << "Translation Vector: " << std::endl;
    file_pts << "[" << extrinsics.translation[0] << " " << extrinsics.translation[1] << " " << extrinsics.translation[2] << "]" << std::endl;

    file_pts.close();
    std::cout<<"Write to file successfully!"<<std::endl;   
        
};

void get_distance (const rs2::pipeline &pipe, TCLAP::ValueArg<int> &time)
{
    rs2::frameset frames = pipe.wait_for_frames();
    rs2::depth_frame depth = frames.get_depth_frame();
    
    float width = depth.get_width();
    float height = depth.get_height();
    
    auto t = std::chrono::system_clock::now();
    auto t0 = t;
    
    while ( t - t0 <= std::chrono::seconds(time.getValue()))
    {

        std::this_thread::sleep_for(std::chrono::seconds(1));
        std::fstream file_pts("intrinsics.txt", std::ios::app);
        float dist_to_ctr = depth.get_distance(width/2, height/2);
        std::cout << "The camera is facing an object " << dist_to_ctr << " meters away \r";
        
        file_pts<<"-----------------------------"<<std::endl;
        file_pts<<std::endl;
        file_pts << "Object distance: " << dist_to_ctr << " m" << std::endl;
        t = std::chrono::system_clock::now();

    }
            
}