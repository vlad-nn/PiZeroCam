#include <raspicam.h>
#include <vector>
#include <fstream>


//
// Save RGB data to PPM image file
//
void imgSavePPM( const char *fname, const unsigned char *raw_data, size_t img_w, size_t img_h )
{
	std::ofstream outFile ( fname, std::ios::binary );
	outFile << "P6\n" << img_w << " " << img_h << " 255\n";
	outFile.write( (const char* )raw_data, img_w * img_h );
}

int main()
{

	raspicam::RaspiCam cam;

	cam.setFormat( raspicam::RASPICAM_FORMAT_RGB );
	if( !cam.open() )
		return -1;

	if( !cam.grab() )
		return -1;
	std::vector< unsigned char > raw_data( cam.getImageBufferSize() );
	cam.retrieve( raw_data.data() );
	imgSavePPM( "raspicam_image.ppm", raw_data.data(), cam.getWidth(), cam.getHeight() );

	return 0;
}