### Project Name
Problem Set 10

### Submitted by
DILLAN HOYOS CABEZAS

### For Course
EP-453

### Due Date
11:59:59 PM on 4/13/2021

### Submission Date
11:50:00 PM on 4 /13/2021

### Files Included
- README.md 
- AudioVisualizer



### Purpose
The purpose of this problem set was to understand how to create a dictionary, and utilize the multitouch functions

### Description


## Problem 10.1: Expand White Out / Equalizer
- Start from the `WhiteOut` Xcode Project.
- Modify the `WhiteOutSynth` class to have the following `Node` configuration:

        WhiteNoise -> ResonantFilter * 10 -> Fader * 10 -> Mixer -> Reverb

- There should be ten separate `ResonantFilter`s that take in the noise input from `WhiteNoise`.
- Each `ResonantFilter` should be going through `Fader` and mixed in using `Mixer`.
- Finally, the output of `Mixer` should go through `Reverb` before we hear the sound from the speakers.
- The cut-off frequency of the `ResonantFilter`s should start from 40hz and linearly increase until the Nyquist frequency - 3,000hz. (i.e. If the sampling rate is 44,100hz, First filter == 40hz, second filter == 1,945hz, ..., last filter == 19,050hz)
- The resonance of each filter should be 600.
- Mathematically divide the screen width into ten segments / rectangles in SwiftUI.
- Make the segments invisible. 
- Each horizontally-divided segment should then control the volume of each `ResonantFilter` in the `Mixer` when the user touches the screen through `Fader`.
- The y-axis value from the drag gesture should control the volume for each `ResonantFilter`.
- Make sure to visualize the output of `Mixer` for the spectroscope so that we see all ten filters visualized. 


### Dependencies (If applicable)
This program does require the AudioKit library and Xcode
	

### Comments
I could not get all the filters to work with rectangles, but I did add the filters and have control over two of the filters. One is controlled by the x axis and the other one is contorlled y the Y axis
### Acknowledgement
I used the Class examples to create this problemSet and stackOverflow

