# TDP controller rofi script

This is just a basic custom rofi script that can be used to configure the TDP of AMD Ryzen processors.

My Lenovo Ideapad Slim 5 (14ARE05) laptop used to get extremely hot. It was consistently in the range of 70s and 80s Celsius when doing everyday tasks like browsing and so on. I would see very large temperature spikes

Also lenovo bios update was also responsible for this.

All the credit goes to the creator of [ryzenadj](https://github.com/FlyGoat/RyzenAdj)

##### NOTE:- This was only tested on Arch. This hasn't been tested on other distibutions, but it should work fine as long as ryzenadj works on your system. 

## Depedencies 
1. ryzenadj
2. rofi


## Steps
1. Clone this repository

```
git clone https://github.com/ayushjaipuriyar/power-profile-ryzenadj-rofi.git
```

2. Copy the .config file to the home folder
```
cp -R .config ~/
```
3. Make the power.sh script in rofi executable
  ```
  chmod +x ~/.config/rofi/power.sh
  ```
4. Since I am using BSPWM as my window manager and sxhkd is there to manage the key bindings, I have binded fn+q to activate the power.sh script.(On newer lenovo laptops, fn+q is there to manage the thermal profiles on windows so I decided to use the same.)
  * Using xev fn+q returns XF86Launch4
```
XF86Lanuch4
    ~/.config/rofi/power.sh
```

You will need to find how you can bind the power.sh script.

5. lastly you need to add ryzenadj to the sudoers. Since ryzenadj requires sudo to run,this was the only way I could make it work without requiring the password as you can't input password in rofi.
```
sudo visudo
```
```
{username} ALL=(ALL) NOPASSWD: /usr/bin/ryzenadj
```
*{username}* is where your actual username goes. If this return some error then you might need to find your installation location of ryzenadj and replace the locaiton in the above line. You can get the installed by running .
```
which ryzenadj
```
 #### Optional :- 
---
I prefer to keep run my laptop cool , so I created a systemd service , so that at boot, the TDP is set to 5W. These steps as additonal you don't need to follow these.
 
 * Copy the script to the specified folder
```
sudo cp ryzenadj.sh /usr/local/sbin/
``` 
You need to make the script executable.
```
sudo chmod +x /usr/local/sbin/ryzenadj.sh
```
* Copy the service file 
```
sudo cp ryzenadj.service /etc/systemd/system/
```  
Now reload systemd , so that it can find the ryzenadj.service file
```
sudo systemctl daemon-reload
```
Run the following commands to make it executbale on boot
```
sudo systemctl enable ryzenadj.service
```


[](https://raw.githubusercontent.com/ayushjaipuriyar/power-profile-ryzenadj-rofi/master/product.png)
