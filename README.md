# Bash script
I share some small project which help me learn shell programming. I will try to put resources for every script.

### 1. Filename randomizer
This project came to my mind when I wanted to burn some music for my car. As it turns out the car does not have the ability to shuffle play so I decided to randomize the music. That way I would at least be sure that there won't be blocks of music from the same authors. But the default program for burning files did not have an option to shuffle files, so I decided to make  this small script. 
I also added a reverse script, which can be used to reshuffle the files, or fix some mistakes, or add new files.
####
Just *cd* to the desired folder and call the script:
```bash
cd desired-folder
./path-to-script/filename-rand.sh
```

### 2. Hydrate notify
I have been struggling to find a decent way of rehidrating myself, since I usually forget to drink something until I get completely dehidrated. 
This script is tested only on Ubuntu, and chances are that it won't work on any other distributiions since it uses *notify-send* app. What the app does is it edits the **crontab** file on every reboot to get the current time and notifies the user every hour to hidrate himself.

#### Usage
To setup the script first edit the crontab file using
```bash
crontab -e
```
to call the editor and append the crontab.txt file. Then put the *hydrate-notify.sh* script to your *home* folder (or where you feel convenient, but then you have to edit crontab file to add the path of the script). The changes to crontab take palce immediately.

### 3. Trap interrupt
Just a small snippet used to trap interrupts such as **Ctrl-C**. For usage just run the script. There isn't much to it here.

### 4. Wifi-kill
A small script for *arpspoofing* in Linux. Use with care and only on your own network and on your own responsibility. Arpspoofing is a type of man-in-the-middle attack which automatically disrupts the connection of all other devices connected on the same network as you are. Might have some dependencies, but I cannot recall what they are (arpspoof app probably).
