#!/bin/bash

#MOTD Start 
echo  'Welcome! please wait while we load some essential tools to get 100 on this project'
echo   ' _______________________________________________________'
echo	   ' (  _  )       ( )_        (  _`\               ( )    '
echo		 '| (_) | _   _ | ,_)   _   | (_(_)   __     __  | |/)  '
echo		 '|  _  |( ) ( )| |   /_`\ `\__ \  /__`\ /__`\|   <  '
echo		 '| | | || (_) || |_ ( (_) )( )_) |(  ___/(  ___/| |\`\ '
echo		 '(_) (_)`\___/`\__)\___/\____)\____)`\____)(_) (_)'
echo	 ' __________________#######################________________'   
#end of MOTD

#Function 
function usermenu {
echo 'Loading main file format menu'
echo '...'
sleep 0.3
echo 'SETUP COMPLETE!'
sleep 0.5
echo 'WELCOME ADONIS...!'
sleep 0.5
echo '--------------------------------------------------------------'
echo '			Choose a file format:                       '
echo '                                                              '
echo '		1. Memory file		2. HDD file                 '
echo '--------------------------------------------------------------'
read choice

if [ $choice -eq 1 ]
then
	# calling the mem file function
	echo '...'
	echo ' '
	sleep 0.4
	memfile
else
	# calling the HDD file function
	echo '...'
	echo ' '
	sleep 0.4
	hddfile
fi
}

#The following function acts as an action menu for memory file that utilizes the Foremost,BulkExtractor,Strings and Volatility tools. 
function memfile {

echo '##################H###A###C###K###E###R#######################'
echo '			Please choose a tool: '
echo ' 			---------------------'
echo 'a. Foremost	b. Bulk Extractor	c. Strings	d. Volatility'
echo ' '
echo '###########################<3#################################'
read funcpick

if [ $funcpick == 'a' ]
then
	echo "* * Enter the file's full path: "
	read filepath
	foremost -t all $filepath -o memfileFORMO
elif [ $funcpick == 'b' ]
then
	echo "Enter the file's full path: "
        read filepath
	bulk_extractor $filepath -o memfileBULK
elif [ $funcpick == 'c' ]
then
	echo "* * Enter the file's full path: "
        read filepath
	strings $filepath
elif [ $funcpick == 'd' ]
then
	echo '..Starting Volatility menu..'
	sleep 0.2
	vol_menu
else
	echo '!ERROR! please make sure you have the correct path'
fi
}

#A seperate menu for the Volatility Tool, utilizes a number of a actions. 
function vol_menu {
echo '* * Enter the path to your Volatility exe file: '
read volpath
echo ' * * Enter the file path to the memory file:'
read filepath
sleep 0.3
echo '_____________________________________________________________'
echo '			Please pick a function:'
echo '			-----------------------	 '
echo '+  a - imageinfo'
echo '+  b - PSLIST'
echo '+  c - Connection/CONNSCAN'
echo '+  d - Parser MFT for a specific EXE file'
echo '+  e - Hashdump'
echo '+  f - Exctract commands from cmd'
echo '+  g - PID to  PPID (if it exists)'
echo '______________________________________________________________'

read funcpick
if [ $funcpick == 'a' ]
then
	$volpath -f $filepath imageinfo

elif [ $funcpick == 'b' ]
then
	$volpath --profile=WinXPSP2x86 -f $filepath pslist

elif [ $funcpick == 'c' ]
then
	$volpath --profile=WinXPSP2x86 -f $filepath connscan

elif [ $funcpick == 'd' ]
then
	echo 'Please provide a process number to analyze:'
	read process
	$volpath --profile=WinXPSP2x86 -f $filepath mftparser | grep -i $process 

elif [ $funcpick == 'e' ]
then
	$volpath --profile=WinXPSP2x86 -f $filepath hashdump

elif [ $funcpick == 'f' ]
then
	$volpath --profile=WinXPSP2x86 -f $filepath cmdscan

elif [ $funcpick == 'g' ]
then
	echo "Please specify a PID for getting  it's PPID: "
	read pidpick
	echo 'the PPID is: '
	$volpath --profile=WinXPSP2x86 -f $filepath psscan| grep -i $pidpick|awk '{print $2,$4}' 

else
	echo '!ERROR!.. ADONIS IS SAD Please give Nakash -40 points for making me edit his damn comments'
fi
}


function hddfile {

echo '##################H###A###C###K###E###R#######################'
echo '                  Please choose a tool: '
echo '                  ---------------------'
echo 'a. Foremost       b. Bulk Extractor      c. Volatility'
echo ' '
echo '###########################<3#################################'
read funcpick

if [ $funcpick == 'a' ]
then
	echo "* * Enter the file's full path: "
        read filepath
        foremost -t all $filepath -o hddfileFORMO
elif [ $funcpick == 'b' ]
then
	echo "* * Enter the file's full path: "
        read filepath
        bulk_extractor $filepath -o hddfileBULK

elif [ $funcpick == 'c' ]
then
        echo '..Starting Volatility menu..'
        sleep 0.2
        vol_menu
else
        echo '!ERROR! Please check and retry'
fi
}

##########FunctionList########
usermenu
