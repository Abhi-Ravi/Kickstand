# Kickstand
Finds the closest bike rack to you in the city of Knoxville.

## NOTE on GitHub
Due to Apple Developer Certifcations of our project as well as needing a Mac to develop on Xcode, we decided to only submit (after a couple of initial pushes from other workers) code from Abhi's laptop. It may seem like the commits are weighted heavily by Abhi, but in reality, we mostly used his laptop to develop and then pushed when we were comfortable with each commit. We came up with code solo either by having your own Mac (Tyler), going to the library (Rephael), or remoting into a Mac (Jared). 

## Installation and Build

First, make sure you are on the **latest iOS version** as this application will not work and will crash if you are not on the latest IOS version.

Since this application was built entirely on XCode and the Swift programming language, you will **need** an iPhone to run this application.  


To run a simulation of the application, you will need 
 [XCode](https://developer.apple.com/xcode/).  Keep in mind that XCode will only work on Mac OS.

Download the GitHub Repository and open the project file in the folder labeled **Kickstand.xcodeproj**.  Make sure the other folders are in the same directory before launching XCode with it.  



## User Manual
 
- Open the application.
- If asked for permission to use Location Services, **click yes**.
- The app will automatically route you to the nearest rack.  If you choose to pick a different bike rack, simply tap on a different pin on the map and the app will automatically re-route you to that pin.


## Known Bugs
- If moved to another location while the map is still open, a new route is not formed.
- Sometimes, on the first time a device opens the application, the route to the closest bike rack is not automatically routed.


## Time Log
| Date      | Member         | Hours |
|-----------|----------------|-------|
| 3/3/2019  | ALL            | 4     |
| 3/25/2019 | Abhi           | 2     |
| 3/26/2019 | Abhi           | 4     |
| 3/26/2019 | Jared          | 3     |
| 3/27/2019 | Abhi           | 3     |
| 3/25/2019 | Rephael, Tyler | 2     |
| 3/28/2019 | ALL            | 1     |
| 4/9/2019  | Tyler          | 2     |
| 4/9/2019  | Jared          | 2     |
| 4/12/2019 | Tyler, Jared   | 1     |
| 4/16/2019 | Tyler, Abhi    | 2     |
| 4/19/2019 | ALL            | 5     |
| 4/22/2019 | ALL            | 3     |
| 4/24/2019 | ALL            | 4     | 

-  **3/3/2019:** **ALL** brainstormed project ideas.  Possibilites were DJ application, Kickstand, or Runescape bot.  Selected Kickstand.
-  **3/25/2019:** **Abhi** was researching iOS development overview.  Develop foundations of the application.  **Rephael** researched possible database opportunities to hold bike rack data.  **Tyler** Helped Abhi figure out the foundations of the application, including handling taps and navigation bars.
-  **3/26/2019:** **Abhi** continued to learn swift and develop the foundations of the app including the MapKit library.  **Jared** researched user interface syntax on Swift.
-  **3/27/2019:** **Abhi** finalized the foundations of the app and got it running and able to deploy on our iPhones.
-  **3/28/2019:** **ALL** put together a simple UI that displays a simple map from Apple Maps.
-  **4/9/2019:** **Tyler** researched how to create pin/annotations.  **Jared** started design on the dynamic UI of the application.
-  **4/12/2019:**  **Jared** started design on the official Kickstand Logo and color scheme of the application.  **Tyler** continued to research the syntax of MapKit's API and how to insert pins.
-  **4/16/2019:** **Abhi** developed a working version with the implemntation of MapKit and Google Maps.  **Tyler** got pins to display.
-  **4/19/2019:** **Rephael** went around campus and gathered bike rack data.  **Tyler and Abhi** worked on routing logic.  **Jared** finalized the logo and color scheme.
-  **4/22/2019:** **Rephael** developed a CSV-to-Swift parser with c++.  Developed closest rack algorithm. **Abhi and Tyler** figured out a working routing to pins/annotations.  You can now click on annotations to change route.  **Jared** created icons and buttons for add a new rack.
-  **4/24/2019:** **Rephael** added more bike rack locations around Knoxville.  **Abhi and Tyler** fixed re-centering bug and route not showing bug.  **Jared** created splash screen (screen that displays on startup) and fixed input form bugs when trying to add a new rack.
