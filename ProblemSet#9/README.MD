### Project Name
Problem Set 9

### Submitted by
DILLAN HOYOS CABEZAS

### For Course
EP-453

### Due Date
11:59:59 PM on 4/06/2021

### Submission Date
11:50:00 PM on 4 /06/2021

### Files Included
- README.md 
- MultiTouch



### Purpose
The purpose of this problem set was to understand how to create a dictionary, and utilize the multitouch functions

### Description

## Problem 9.1: Expand Audio Recorder
- Start from the `AudioRecorder` Xcode Project.

1.  
    - Add a `Text` in the `RecorderView` right underneath the record button.
    - Make sure that the `Text` is centered. 
    - This `Text` should display the recording time in real-time using `Timer` in the following format: `00:00`. 
    - The first two digits are the minute, and the second two digits are for the second.
    - The `Timer` should start from `00:00` when the recording button is pressed, and it should stop when the recording is stopped.
    - Hint: [How to make a start/stop timer](https://stackoverflow.com/questions/63548432/swiftui-how-to-make-a-start-stop-timer)

2.  
    - Currently, the `AudioRecorder` project has a bug where clicking on the `Recorded Sounds` button while the recording is in progress, the recording continues. 
    - Implement a mechanism so that recording stops appropriately when the `Recorded Sounds` button is touched even when the recording is in progress.

3.  
    - In the `LibraryView`, add a button at the top that deletes all the recordings and refereshed the `ListView`.



### Dependencies (If applicable)
This program does require the AudioKit library and Xcode
	

### Comments
I implemented the timer, and the delete button but it stopped taking recordings after that for some reason. Im going to try debuging it.
### Acknowledgement
I used the Class examples to create this problemSet and stackOverflow

