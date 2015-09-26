#!/bin/bash
#this script will grab all executable files in the
#current directory and delete them 
#it will also delete itself so keep a copy somewhere

echo "WARNING! This script will self-destruct and take all"
echo "executable files in the current directory when executed"
echo ""
#first create a new file to set up executable files 
touch xdelgo.txt

#throw all executable files from the current directory inside
find . -type f -executable >> xdelgo.txt
echo "The following files have been marked for deletion"
echo""
cat xdelgo.txt

#create a new script that will execute deletion
touch xdelgo.sh
echo "#!/bin/bash" >> xdelgo.sh
echo "rm xdelgo.sh" >> xdelgo.sh
echo "rm xdelgo.txt" >> xdelgo.sh

#append rm to each line and throw into new executable file
DEL=$'\n';x=rm;for l in $(<xdelgo.txt);do echo -e "$x\t$l";((x+1));done >> xdelgo.sh

#go give permission to the file
sudo chmod u+x xdelgo.sh

#THE POINT OF NO RETURN
echo "Are sure you really wann delete these files?"
echo "Press ENTER to continue, ctrl+c to abort" 
read input
./xdelgo.sh
