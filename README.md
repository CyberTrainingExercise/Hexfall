# CTX0

### Objectives

For: POC
Time: 20-30 mins

Technical Objectives:
1. Intro to Kali Linux
2. Intro to brute forcing passwords
3. Intro to SSH

Tools:
1. Kali linux box with John the Ripper
2. USB with encrypted password of server
3. Headless server running linux with SSH port open

### Setup

1. Create a cloud server with an open SSH port and with login credentials as found in `passwords.txt`.
2. Run a website off of the cloud server.
3. Load a box with Kali linux and connect it to the internet.
4. Load a USB stick with the cloud server login credentials and encrypt the file with the credentials found in `passwords.txt`.
5. Put the Kali box and USB stick in the room of the "nefarios hacker" described below.

### Scenario

Team is briefed with the following:

    Intel has located a nefarious hacker is a nearby facility, known only as TheLegend27. He and his associates are well armed, proceed with caution. He has recently started running a website filled with top secret information that is critical to national security. He and his hacking group have recently announced they plan to post a large addition to this website within the coming hours.
    You must stop him before he updates his website with this additional data.
    Additionally, it is believed he have a small infrastructure of computers. But due to the sensitive nature of the equipment, it cannot be moved. Therefore, you will be tasked with taking his website offline at his evil hacker lair.

    To do this it is believed he has a flash drive where he stores the passwords to all his computers. You must obtain the flash drive, get his password, and take down his remote server.

    Your mission is complete when you take down his website.

    Below is a list of helpful guides a technical specialist has prepared for you:
    Crack a password protected file: https://linuxconfig.org/how-to-crack-zip-password-on-kali-linux
    Guide on how to SSH into a remote server: https://linuxconfig.org/Ssh
    
Password options:
elemen - for drive
element - for pi ssh