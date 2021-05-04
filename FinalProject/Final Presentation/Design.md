# Jumper 

#### Created by
Dillan Hoyos

#### Project title
Jumper

### Files Included
- README.md
- Proposal
- StatusReport
- 3rd

***
## Description

#### This project is a 2d game built with Sprite Kit for IOS. It is a vertical Platformer that keeps track of your score everytime you reach a higher altitude. Its sound engine was built upon the AudioKit Library. 
It is still an unfinished Project and will be updated with more dynamic features such as shooting and changes in background.

## Design 
#### To create this Game I first started from the beatbounce project of the class. I created one sprite that was bouncing and then I created rectangles that were static, after playing with these two elements I added the Collision system as well as touch Mechanism. 
The next step I did to create this game was to generate randomly rectangles that were going to be evenly spaced around the screen for that i utilized in reference the 3dDrumSequencer code where there are 2 for loops that iterate rectangles in to being a grid conformed of rows and Columns. because I did not want something to be like a grid so I added a random number into the x and y offsets After that everytime it created a column it increased by 500 on the Y axis to get more vertical coverage. 
After having the main mechanics setup I needed to create a mechanism that would dynamically change the bitmasking of the Character. For this I used as reference a StackoverFlow thread in where they created different Physics Categories that would be added to the sprites of the scene. And to trigger this mechanism I utilized the update function in where I added logic to make the Sprite collide with other objects only when his dy was < 0. In this way the main character was not going to collide with the other blocks when he was moving upwards. 
After this I implemented the sound mechanism from the Beatbounce app to create triggers every time the main character collided with the rectangles in the scene.  I implemented a score mechanism that would add to the score everytime you reached a new altitude. 
The score and the DieAndRestart function were referenced from the Raywenderlich repository for his game color switch. 

It still needs a lot of work but the main mechanisms work and It is very playable.
 
 ## References 
 
#### This code was modified by Dillan Hoyos and took as reference 
- Akito van Troyer 
- https://stackoverflow.com/questions/39428866/one-way-platform-collisions-in-sprite-kit
- https://www.raywenderlich.com/790-how-to-make-a-game-like-color-switch-with-spritekit-and-swift


