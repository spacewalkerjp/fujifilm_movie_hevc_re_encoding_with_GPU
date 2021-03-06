# Get current path
$str_path = (Convert-Path .)
$exiftoolexe = $str_path + "\exiftool.exe"
$ffmpegexe = $str_path + "\ffmpeg.exe"
$outputfolder = $str_path + "\out"

# PS .\ffmpegreencondingNVENC.ps1 (Get-ChildItem *.MOV -File | ForEach-Object { "$($_.Name)" })
$movie_filepath_array = $args[0] -split ","
 
# loop for each `MOVIE files`
for($i=0; $i -lt $movie_filepath_array.Length; $i ++){
	# input MOVIE file
	Write-Host ('Input filename[' + [string]$i + '] = ' + $movie_filepath_array[$i])
	$moviefile = $movie_filepath_array[$i]
	$outputmoviefile = $outputfolder + "\" + $moviefile
	Write-Host ('Output filename = ' + $outputmoviefile)

	# ffmpeg sample : VCODEC = HEVC_NVENC(NVIDIA GPU H.265 HEVC), pix_fmt (YUV420 10bit = p010le), ACODE = pcm_s24le
	# attention: This ffmpeg command doesn't copy the GPS tags.
	# Set for quality : -cq, -preset, -qmin, -qmax
	.$ffmpegexe -i $moviefile -map_metadata 0:g -vcodec hevc_nvenc -cq 50 -preset slow -qmin 1 -qmax 20 -pix_fmt p010le -acodec pcm_s24le -r 60 $outputmoviefile 

	# copy all meta data including GPS tag by exiftool from source movie to target movie
	.$exiftoolexe -overwrite_original -tagsfromfile $moviefile -all:all>all $outputmoviefile
}

