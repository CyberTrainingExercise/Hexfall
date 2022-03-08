# CTX0 - Operation Hexfall

Welcome to Operation Hexfall, a Cyber Training Exercise (CTX) designed for AFROTC cadets.

This CTX was designed to test cadets for leadership competencies in a high intensity simulation. This simulation will be carried out in both the land domain and in the cyber domain.

If you would like to perform this CTX you will need the following:

1. Someone who is technically skilled to setup the scenario.
    - Hopefully this guide will make it easy, but you still need technical know how to do it.
2. The following equipment:
    - FTX simulation equipment such as nerf guns or rubber duckies.
    - A computer or virtual machine.
    - A USB stick.
    - A headless server.
    - Optional: a phone with the tor browser installed.

### Expected Design

The CTX is designed such that the leader will have to balance both domains simultaneously. The land domain will have sporadic action while the cyber domain will remain more stable, with one main path to completion.

The CTX admin, whoever is administering it, will be tasked with augmenting it to fit their specific location. The situtational diagram found in `SituationalDiagram_Det538` is designed specifically for Detachment 538 and their available space. When you augment the scenario, please keep the following in mind:

1. The cyber domain should be as easy to complete as possible, while still retaining the wow factor of taking down a darknet website.
    - Let them feel like they're flying, but make sure they don't crash
2. The land domain should be sporadic, incorporate additional measures to challenge them constantly.
    - An example of a way to do this is adding to the Rules of Engagement (ROEs): "You must take all causualties back to base to perform any medical treatment." This forces the cadets out of the safety of the newly captured enemy base. This will give more opportunity for OPFOR to attack and will also create a more dynamic and stressful situation.
    - Another example would be to turn off the lights in the Hexfall HQ (and add an ROE so they can't turn them back on). This forces them to act in low light and increases the enviromental stressors.

Augment the scenario as you see fit.

### Objectives

For: POC
Time: 37 mins
 - 7 for planning
 - 30 for execution

Technical Objectives:
1. Intro to Kali Linux
2. Intro to brute forcing passwords
3. Intro to SSH

Tools:
1. Kali linux box
2. USB stick
3. Headless server with SSH port open
4. Optional: LED lights
5. Optional: a phone with the tor browser installed.
    - You can find other ways to have them verify the website is up and running, but this is the recommended way

### Setup

1. Create a cloud server with an open SSH port and with login credentials as found in `passwords.txt`.
2. Run a website off of the cloud server.
    - For this use tor and run a hidden service.
    - See: https://www.youtube.com/watch?v=GVMjk9pj2Cw for instructions on how to run a hidden service.
    - Use `python3 -m http.server --bind 127.0.0.1 8080` to run the web server
    - If you would like to include the server to run on boot, edit `/etc/rc.local` with `python3 -m http.server --directory /home/pi/Desktop/HexfallWebsite --bind 127.0.0.1 8080 &`
    - Store url to hidden service in `url.txt`
3. Load a box with Kali linux and connect it to the internet.
    - See: https://www.kali.org/
4. Load a USB stick with the cloud server login credentials and location of the second weapons create (see step 8).
5. Encrypt the file with the credentials found in `passwords.txt`.
    - Use `zip -e secret_files.zip data.txt`
    - The password `elemen` is a good option as it takes John The Ripper about a minute to process (depending on hardware).
6. Put the Kali box and USB stick in Hexfall HQ as described below.
7. Put a weapons crate in the Hexfall HQ.
8. Put a weapons crate in a secret secondary location.
    - Record this location and put it into the `secret_files.zip` in step 5.
9. Update presentation in `Presentation/` with details for your specific scenario.
10. Execute training exercise!
    - See section `Onsite Setup` below for more details.

### Scenario

Team is briefed with the following or using the presentation found in `Presentation/`':

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
1. Plug in Server
2. Verify website is runing, see `url.txt.` for site url
3. Verify Server IP address, ssh into `pi@hexfallserver.student.rit.edu`
4. Get IP address
5. Load IP address and weapon crate (#2) location onto zip file `zip -e secret_files.zip file1.txt`
6. Setup Kali box and optional LED lights
7. Setup presentation and have print outs (and optionally: phone) ready
8. Present presentation
9. Hand out print outs and optionally the phone with tor browser installed