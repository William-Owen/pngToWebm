# PNG to WebM Converter

This script converts a sequence of transparent PNG images into a transparent WebM video file using FFmpeg. It's designed to be used on a system running Ubuntu, WSL2 or similar Linux distribution.

I created this as a quick helper script to help me create transparent videos from my [Blender](https://www.blender.org/) renders.

## Prerequisites

* FFmpeg: The script requires FFmpeg to be installed on your system. If you don't have FFmpeg installed, you can find installation instructions [here](https://ffmpeg.org/).

# Installation

Clone the repository to your local machine using:

bashCopy code

`git clone https://github.com/William-Owen/pngToWebm`

Navigate to the script directory:

bashCopy code

`cd pngToWebm`

Make the script executable:

bashCopy code

`chmod +x pngToWebm.sh`

## Usage

To use the script, simply run it with the directory of your PNG images as an argument:

bashCopy code

`./png_to_webm.sh /path/to/png-images`

The script will create a WebM video named after the directory in the same directory as your PNG images, it will replace spaces with underscores in the filename. If a WebM file with the same name already exists, the script will increment the filename. For example:

`./png_to_webm.sh /render/logo/`

will create a file:

`./png_to_webm.sh /render/logo/logo.webm`

If `logo.webm` already exists it will try `logo_1.webm`, `logo_2.webm` until it finds and available file name.

## --high high quality mode

*   The script takes a second argument. If this argument is `--high`, it uses the high-quality FFmpeg command.
*   If the `--high` flag is not provided, it uses the standard quality FFmpeg command.

To run the script with the high-quality option, use:

bashCopy code

`./png_to_webm.sh /path/to/png-images --high`

Increase the Bitrate: Higher bitrates generally result in better video quality but larger file sizes. You can specify the bitrate by using the -b:v option.

Constant Rate Factor (CRF): CRF is a quality-controlled variable bitrate. Lower values mean better quality. The range for VP9 (used in WebM) is 0-63. A lower value is a higher quality.

CPU Usage: The -cpu-used flag controls the encoding speed to compression ratio tradeoff. Lower values are slower and produce better quality.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

William Owen (wo.dev)