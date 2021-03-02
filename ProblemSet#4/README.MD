### Project Name
Problem Set 4

### Submitted by
DILLAN HOYOS CABEZAS

### For Course
EP-453

### Due Date
11:59:59 PM on 3/1/2021

### Submission Date
11:50:00 PM on 3 /21/2021

### Files Included
- README.md 
- Samplepayback folder
- Problem4.1.playground


### Purpose
The purpose of this problem set was to understand how to change the UI of the app, and setup sliders that control playback

### Description

## Problem 4.1: Control Flow
- Create a file named "ProblemSet4.1.playground" in Xcode.
- Write a program that creates two integer type variables, `num` and `width`.
- Assign arbitrary numbers to both `num` and `width`.
- Print out `*`, the number of times specified by `num`.
- While printing, every time a number of `*`s reaches the number in `width`, print a newline before continue to print `*`.
- For example, `num` with a value of 48 and `width` with a value of 5 should print out the following `*` sequence:

        *****
        *****
        *****
        *****
        *****
        *****
        *****
        *****
        *****
        ***

## Problem 4.1: Sample Playback
- Copy the example `SamplePlayback` Xcode project from the class material repository to your GitHub repo.
- Modify the app to have the guitar and trumpet buttons to be horizontally aligned instead of vertical.
- Add two more buttons with new icons/images that play different sounds of your own.
- These two new horizontally-aligned buttons should occupy the top of the screen above the guitar and trumpet buttons using `HStack`, and `Spacer`.
- Add a slider below the guitar and trumpet buttons that controls the rate of playback for the background music between 0.1 ~ 1.0.


### Dependencies (If applicable)
This program does require the AudioKit library and Xcode
	

### Comments
I had some issues implementing the Slider playback, i added some more samples. 

### Acknowledgement
I used the Class examples to create this problemSet.
