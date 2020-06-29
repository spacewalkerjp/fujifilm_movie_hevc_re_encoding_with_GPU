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

	#NVIDIA HEVCでエンコード：だいたい60~70Mbps, 60p, 60p : metadataはだいたいコピー：しかしGPSはコピーされない。
	.$ffmpegexe -i $moviefile -map_metadata 0:g -vcodec hevc_nvenc -cq 50 -preset slow -qmin 1 -qmax 20 -pix_fmt p010le -acodec pcm_s24le -r 60 $outputmoviefile 

	#EXIF TOOLでGPSも全部コピー
	.$exiftoolexe -overwrite_original -tagsfromfile $moviefile -all:all>all $outputmoviefile


}

