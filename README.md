# CTX0 - Operation Hexfall

Welcome to Operation Hexfall, a Cyber Training Exercise (CTX) designed for i5 cadets.

This CTX was designed to test cadets for leadership competencies in a high intensity simulation. This simulation will be carried out in both the land domain and in the cyber domain.

### Objectives

Estimated skills (see [skill levels](https://github.com/CyberTrainingExercise/Docs/blob/master/ctx_requirements.md) for meaning)
- Programming skills required (0-3)
    - 0
- System adminitration skills required (0-3)
    - 1
- Pentesting skills required (0-3)
    - 1

Total time: 35 mins
 - 5 for planning
 - 30 for execution

Technical Objectives:
1. Intro to Kali Linux
2. Intro to brute forcing passwords with John the Ripper
3. Intro to SSH
4. Intro to Tor

### Requirements

If you would like to perform this CTX you will need the following:

1. An Admin who is technically skilled to setup the scenario.
    - Hopefully this guide will make it easy, but you still need technical know how to do it.
    - Required skills:
        - Linux, SSH, John the Ripper, Tor, Webservers 
2. The following equipment:
    - FTX simulation equipment such as rubber duckies.
    - A computer or virtual machine capable of running Kali Linux.
    - A computer or virtual machine capable of running a Tor hidden service.
    - A USB stick.

### Expected Design

The CTX is designed such that the Leader will have to balance both domains simultaneously. The land domain will have sporadic action while the cyber domain will remain more stable, with one main path to completion.

The Admin will be tasked with augmenting it to fit their specific location. The situtational diagram found in `SituationalDiagram_Det538` is designed specifically for Detachment 538 and their available space. When you augment the scenario, please keep the following in mind:

1. The cyber domain should be as easy to complete as possible, while still retaining the wow factor of taking down a darknet website.
    - Let them feel like they're flying, but make sure they don't crash
2. The land domain should be sporadic, incorporate additional measures to challenge them constantly.
    - Don't break them, but keep them challenged and engaged.

Augment the scenario as you see fit.

### Scenario

Team is briefed with the following or using the presentation found in `Presentation/`':

    Intel has located a nefarious hacking group, known only as Hexfall, in a nearby facility. Hexfall was brought to the the governments attention after they opened an online weapons marketplace. Due to increasing demand of black market guns, the store is shipping thousands of dollars worth of weapons daily. It is believed they have two crates of weapons onsite as well as the hardware to run their own online weapons marketplace. You are being tasked with taking down the operation. You must take down the online weapon marketplace and take control of both weapons crates.

    To do this it is believed Hexfall's lead hacker has a flash drive where he stores the passwords to all their computers. You must obtain the flash drive, get the passwords, login to the remote server, and takedown the website.

    Your mission is complete when you take down the Hexfall website and take control of both weapons crates.

    Below is a list of helpful guides a technical specialist has prepared for you.


### Difficulty Dials

1. Add to the Rules of Engagement (ROEs): "You must take all causualties back to base to perform any medical treatment." This forces the cadets out of the safety of the newly captured enemy base. This will give more opportunity for OPFOR to attack and will also create a more dynamic and stressful situation.
2. Turn off the lights in the Hexfall HQ (and add an ROE so they can't turn them back on). This forces them to act in low light and increases the enviromental stressors.
3. Remove any number of the docs. This will make them have to find the knowledge themselves. CAUTION: this could derail the flow, only do this to technically competant cadets.

### Docs

Print out the following and hand the useful information to the Leader:

1. Crack a password protected file: https://linuxconfig.org/how-to-crack-zip-password-on-kali-linux

2. Guide on how to SSH into a remote server: https://linuxconfig.org/Ssh

3. Shutting down the server: `systemctl -poweroff`

### Setup

With Docker (RECOMMENDED):

1. Build the Docker container: `sudo docker build . -t hexfall`
1. Run the Docker container: `sudo docker run -p 8000:8000 8080:8080 --name hexfall hexfall`
    - This will publish the .onion address to port 8000 and will use port
    8080 for the Tor hidden service.
1. Visit `ip:8000` and click on `hostname.txt`
    - Now copy this .onion address and visit it with the Tor browser.
1. Verify that the Hexfall site is working.
1. Stop the Docker container: `sudo docker stop hexfall`


Without Docker (NOT RECOMMENDED):

1. Create a server with an open SSH port and with login credentials as found in `passwords.txt`.
2. Run a darknet website off of the cloud server.
    - For this use tor and run a hidden service.
    - See: https://www.youtube.com/watch?v=GVMjk9pj2Cw for instructions on how to run a hidden service.
    - Use `python3 -m http.server --bind 127.0.0.1 8080` to run the web server
    - If you would like to include the server to run on boot, edit `/etc/rc.local` with something like `python3 -m http.server --directory /home/pi/Desktop/HexfallWebsite --bind 127.0.0.1 8080 &`
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
10. Print out print outs found in `PrintOuts/`
    - You do not need all the pages, but read them over and select which ones you think the cadets would need. For example, the `HowToCrackPasswords` document should only need to be page 5.
11. Execute training exercise!
    - See section `Onsite Setup` below for more details.

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

### Debrief Ideas

Non-technical questions:
1. How did you manage splitting up or lack of splitting up?
1. Did you find the second crate? How did you manage that new objective?

Technical questions:
1. How did you juggle Kali's extensive toolkit to exploit the known vulnerabiities?
1. Was there any technical rabbit trails you went down during the CTX?

Additional thoughts:
1. Let them know that the CTX is based on real world scenarios and used real world software.
    - They just took down a legit dark net website, that's pretty cool


### Misc: Opfor Guidance

Provide moderate resistance in Hexfall HQ shootout.

Provide mild attacks during hacking campaign.

Provide moderate resistance at second crate point.

Provide mild resistance during evacuation.