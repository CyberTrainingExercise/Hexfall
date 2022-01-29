# CTX0

### Objectives

For: POC
Time: 20-30 mins

Technical Objectives:
1. Intro to Kali Linux
2. Intro to brute forcing passwords
3. Intro to SSH

Tools:
1. Kali linux box
2. USB stick
3. Headless server with SSH port open
4. Optional: RGB lights

### Setup

1. Create a cloud server with an open SSH port and with login credentials as found in `passwords.txt`.
2. Run a website off of the cloud server.
    - For this use tor and run a hidden service.
    - See: https://www.youtube.com/watch?v=GVMjk9pj2Cw for instructions on how to run a hidden service.
    - Use `python3 -m http.server --bind 127.0.0.1 8080`
    - If you would like to include the server to run on boot, edit `/etc/rc.local` with `python3 -m http.server --directory /home/pi/Desktop/HexfallWebsite --bind 127.0.0.1 8080 &`
    - Store url in `url.txt`
3. Load a box with Kali linux and connect it to the internet.
4. Load a USB stick with the cloud server login credentials and location of the second weapons create.
5. Encrypt the file with the credentials found in `passwords.txt`.
6. Put the Kali box and USB stick in Hexfall HQ as described below.
7. Possible darknet stuff here.

### Scenario

Team is briefed with the following:

    Intel has located a nefarious hacking group, known only as Hexfall, in a nearby facility. Hexfall was brought to the the governments attention after they opened an online weapons marketplace. Due to increasing demand of black market guns, the store is shipping thousands of dollars worth of weapons daily. It is believed they have two crates of weapons onsite as well as the hardware to run their own online weapons marketplace. You are being tasked with taking down the operation. You must take down the online weapon marketplace and take control of both weapons crates.

    Additionally, it is believed Hexfall has a small infrastructure of computers. But, due to the sensitive nature of their network, it cannot be moved until the website is disabled. Therefore, you will be tasked with taking Hexfall's website offline on location.

    To do this it is believed Hexfall's lead hacker has a flash drive where he stores the passwords to all their computers. You must obtain the flash drive, get the passwords, login to the remote server, and takedown the website.

    Your mission is complete when you take down the Hexfall website and take control of both weapons crates.

    Below is a list of helpful guides a technical specialist has prepared for you.

Print out the following and hand the useful information to them:

1. Crack a password protected file: https://linuxconfig.org/how-to-crack-zip-password-on-kali-linux

2. Guide on how to SSH into a remote server: https://linuxconfig.org/Ssh

3. Shutting down the server: `systemctl -poweroff`

### Opfor Guidance

Provide moderate resistance in Hexfall HQ shootout.

Provide mild attacks during hacking campaign.

Provide moderate resistance at second crate point.

Provide mild resistance during evacuation.

### Onsite Setup
1. Plug in Pi
2. Verify website is runing, see `url.txt.` for site url
3. Verify Pi IP address, ssh into `pi@hexfallserver.student.rit.edu`
4. Get IP address
5. Load onto zip file `zip -e secret_files.zip file1.txt`
6. Setup Kali box and lights
7. Setup presentation and have print outs ready