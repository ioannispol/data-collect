#include "rs_d435.hpp"
#include <thread>
#include <stdio.h>
#include <memory>
#include <functional>
#include <string.h>

using namespace TCLAP;

int main(int argc, char * argv[]) try
{
    // Check if the "out" directory exists and create
    check_dir();
    
    // Parse command line arguments
    CmdLine cmd("D435 recorder underwater tool", ' ');
    ValueArg<int>    time("t", "Time", "Amount of time to record (in seconds)", false, 10, "");
    ValueArg<std::string> out_file("f", "FullFilePath", "the file where the data will be saved to", false, "out/test.bag", "");

    cmd.add(time);
    cmd.add(out_file);
    cmd.parse(argc, argv);

    rs2::pipeline pipe;
    rs2::config cfg;
    

    cfg.enable_record_to_file(out_file.getValue());
    stream_options::enable_infrared(cfg);
    stream_options::enable_depth(cfg);
    stream_options::enable_color(cfg);
    
    pipeline_enalbe::start(pipe, cfg);

    bool enable=true;
    stream_options::ir_emitter(pipe, enable=false);
    
    auto t = std::chrono::system_clock::now();
    auto t0 = t;
    while (t - t0 <= std::chrono::seconds(time.getValue()))
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(10));
        t = std::chrono::system_clock::now();
    }
    std::cout << "\nRecording finished" << std::endl;
    
    get_streams::depth_stream(pipe);
    get_streams::infrared_stream(pipe);
    
    pipeline_enalbe::stop(pipe);

    // Get depth stream profile and camera intrinsics
    rs2::pipeline_profile parameters = pipe.start();
    auto depth_stream = parameters.get_stream(RS2_STREAM_DEPTH)
                                .as<rs2::video_stream_profile>();
    auto color_stream = parameters.get_stream(RS2_STREAM_COLOR);

    parameters::get_intrinsics(depth_stream);

    parameters::get_extrinsics(depth_stream, color_stream);

    // Print Parameters to file.txt
    print_parameters(depth_stream, depth_stream, color_stream);
    //pipeline_enalbe::stop(pipe);

    //int time_d = 5;
    get_distance(pipe, time);
    
    return EXIT_SUCCESS;
}
catch(const rs2::error & e)
{
    std::cerr << "RealSense error calling " << e.get_failed_function() << "(" << e.get_failed_args() << "):\n    " << e.what() << std::endl;
    return EXIT_FAILURE;
}
catch(const std::exception& e)
{
    std::cerr << e.what() << std::endl;
    return EXIT_FAILURE;
}