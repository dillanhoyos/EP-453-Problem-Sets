### Project Name
Problem Set 6

### Submitted by
DILLAN HOYOS CABEZAS

### For Course
EP-453

### Due Date
11:59:59 PM on 3/16/2021

### Submission Date
11:50:00 PM on 3 /16/2021

### Files Included
- README.md 
- TabPlayer
- Problem6.1.playground


### Purpose
The purpose of this problem set was to understand how to create a tab player and to create a class

### Description

## Problem 6.1: Class
- Create a file named `ProblemSet6.1.playground` in Xcode.
- Write a program that declares `Weather` class.
- The `Weather` class must have an initializer that takes low and high temperatures (in Fahrenheit), precipitation (Percentage), and wind speed (MPH). Hint:

        init(low: Float, high: Float, prec: Float, wind: Float) {
            self.low = low
            self.high = high
            self.prec = prec
            self.wind = wind
        }
    
- As you create your class, remember that you will need to create associated instance variables in the class that stores low and high temperatures, precipitation, and wind speed. 
- Once the class is created, declare two new instances of the `Weather` class named `yesterday` and `today`.
- Print out the numerical weather difference between `yesterday` and `today` in your playground after assigning arbitrary numbers to both instances. 
- For example, if the weather from `yesterday` was:
    
        Low: 60°F 
        High: 80°F
        Precipitation: 20%
        Wind Speed: 10mph

- and weather from `today` was:

        Low: 64°F 
        High: 76°F
        Precipitation: 10%
        Wind Speed: 11mph

- The difference between the two weather should look like this when they are printed out:

        The weather difference between the two days is:
            Low: 4°F
            High: -4°F
            Precipitation: -10%
            Wind Speed: 1mph
            
## Problem 6.2: Expand Tab Bar Controller
- Start from the `TabPlayer` Xcode Project.
- Add another tab in the project.
- In the new view named `LooperView`, set up a system to stop and start at least two looping `AppleSampler`s.
- Starting and stopping of each player should be controlled by the `Rectangle`s.
- Add a slider from the `swiftui-sliders` framework to control the volume of each looping audio player.
- Create a panic button that can stop all looping audio players at once.



### Dependencies (If applicable)
This program does require the AudioKit library and Xcode
	

### Comments
I had no succes on implementing this problemsets. 

### Acknowledgement
I used the Class examples to create this problemSet and stackOverflow

