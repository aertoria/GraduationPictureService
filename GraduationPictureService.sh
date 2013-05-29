#!/bin/bash

#GraduationPictureService.sh will fetch back your graduation commencement pictures
#from website and export to you in jpg. To use it, simply by: $sh GraduationPictureService.sh
#OS: Linux/Unix, with convert, wget installed

<<<<<<< HEAD
#    Copyright (C) 2013  Ethan W. castives@hotmail.com
=======
#    Copyright (C) 2013  Ethan W, at University of Iowa. castives@hotmail.com
>>>>>>> f815e50fd70f38e9e1f85db98cf41c00e2f96972

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
<<<<<<< HEAD
#	 Please do not use this program for any business purposes or any illegal purposes
#	 Any images this scripts might download is the propetry of the service provider
=======
#	 Please do not use this program for any business purposes
>>>>>>> f815e50fd70f38e9e1f85db98cf41c00e2f96972

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see http://www.gnu.org/licenses/



declare url;

echo "Image Fetch Service Activated..."
echo ""
echo ""
echo "================================================="
echo "Please PASTE the URL that asking you to pay sixty five dollars"
echo "You can find the URL by going to the link they send you, and then click 'click to zoom in', Safari has problems displaying URL, if that happen try others"
echo "The URL looks like this:"
echo "http://images1.flashphotography.com/Magnifier/Magnify.aspx?O=10000001&R=00001&F=0001&A=1001"
echo "================================================="
echo ""
read  -p "Paste here:" url_ori
IFS='?' read -a array <<< "$url_ori"
url_base=`echo "${array[0]}"|sed 's/............$//'`
IFS='&' read -a array_para <<< "${array[1]}"
O=`echo "${array_para[0]}"|sed 's/^..//'`
R=`echo "${array_para[1]}"|sed 's/^..//'`
F=`echo "${array_para[2]}"|sed 's/^..//'`
A=`echo "${array_para[3]}"|sed 's/^..//'`


mkdir original
mkdir combined
for((x=57;x<=422;x=x+100))
do
	Exec_append="convert -append ";
	for((y=57;y<=568;y=y+100))
	do
		#echo $x" "$y;
		url=$url_base"MagnifyRender.ashx?X=$x&Y=$y&O=$O&R=$R&F=$F&A=$A&rand=0.07113776063264884";
		echo $url;
		wget -O ./original/image_$x"_"$y.png `echo $url`
		convert -crop +36+36 ./original/image_$x"_"$y.png ./image_$x"_"$y.png
		convert -crop -50-50 ./image_$x"_"$y.png ./image_$x"_"$y.png
		Exec_append=$Exec_append"./image_$x"_"$y.png ";
	done
	Exec_append=$Exec_append"./combined/"$x"_out.png";
	eval $Exec_append;
done


Exec_append="convert -append ";
x=422;sd
for((y=57;y<=568;y=y+100))
do
	#url=http://images1.flashphotography.com/Magnifier/MagnifyRender.ashx?X=$x\&Y=$y\&O=10000000\&R=00002\&F=0071\&A=71714\&rand=0.07113776063254884;
	url=$url_base"MagnifyRender.ashx?X=$x&Y=$y&O=$O&R=$R&F=$F&A=$A&rand=0.07113776063254884";
	wget -O ./original/image_$x"_"$y.png `echo $url`
	convert -crop +36+36 ./original/image_$x"_"$y.png ./image_$x"_"$y.png
	convert -crop -50-50 ./image_$x"_"$y.png ./image_$x"_"$y.png
	Exec_append=$Exec_append"./image_$x"_"$y.png ";
done
Exec_append=$Exec_append"./combined/"$x"_out.png";
eval $Exec_append;
convert -crop +72+0 ./combined/422_out.png ./combined/422_out.png
convert +append ./combined/57_out.png ./combined/157_out.png ./combined/257_out.png ./combined/357_out.png ./combined/422_out.png ./$O.jpg
rm -rf *.png original combined
echo "Finished Successfully!"
