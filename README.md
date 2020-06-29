# fujifilm_movie_hevc_re_encoding_with_GPU
Fujifilm recorded movie (H.265, HEVC)  re-encoding scripts by using ffmpeg, exiftool, NVIDIA(GPU)
* Re-encoding script by ffmpeg by using NVIDIA GPU from high bitrate source file to smaller file size target.
* From H.265(HEVC) input to H.265(HEVC) output

# Assumed input movie file format

* H.265(HEVC), 4K60P, 100~200 Mbps, YUV4:2:0 (10bit) by Fujifilm X-T3, X-T4

# Environment
* Windows 10 (Pro)
* Script lang：PowerShell 7.0 (Or 5.1)
* EXIFTOOL：exiftool.exe (Windows binary : ExifTool Version Number : 11.99 )
* ffmpeg (Windows binary : ffmpeg-20200620-29ea4e1-win64-static.zip )
* Author H/W environment (Ref) : AMD Ryzen 5 3600, NVIDIA GeForce GTX 1070(*if want to use GPU for ffmpeg encoding)

# How to use
* [1] Copy the source movie files to a working folder. Don't forget to copy to avoid mistaking deleting.
* [2] Clone this repo's powershell scripts(.ps1) into the working folder
* [3] Launch powershell on the working folder.
* [4] Create output folder as `out` (folder name)
* [5] .\allsequence.ps1
