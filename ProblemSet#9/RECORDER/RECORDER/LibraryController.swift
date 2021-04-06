//
//  LibraryController.swift
//  RECORDER
//
//  Created by Dillan Hoyos on 3/30/21.
//

import AudioKit
import SwiftUI
import AVFoundation



class LibraryController: ObservableObject{
   
    var recordings = [String]()
    var players = [AudioPlayer]()
    var engine = AudioEngine()
    var mixer = Mixer()
    
    init(){
        self.getRecordingNames()
       
        
      
        
    }
    func load(){
        for fileName in recordings{
            let file = loadAudioFile(file: fileName)
            let player = AudioPlayer(file: file)
            player?.isLooping = false
            players.append(player!)
            mixer.addInput(player!)
        }
    }
    func start(){
        engine.output = mixer
        do{
            try engine.start()
            
        } catch{
            print(error)
        }
    }
    func stop(){
        engine.stop()
    }
    func getRecordingNames(){
    
            let fileManager = FileManager.default
            let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            do{
                //get all file
            recordings = try fileManager.contentsOfDirectory(atPath: url.path)
                
                
                }
                
            catch{
                print(error)
            }
        
        recordings.sort()
        recordings.reverse()
        
        }
    func loadAudioFile(file:String) -> AVAudioFile{
        var audioFile:AVAudioFile!
        var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url = url.appendingPathComponent(file)
    
    
    do {
        audioFile = try AVAudioFile(forReading: url)
        } catch{
    print(error)
    }
        return audioFile
        
    }
    
   
        
    func play(index: Int){
        //stop any playback happening now
        for player in players{
            if player.isPlaying{
                player.stop()
            }
            players[index].play()
         }
        
    }
  
 
    
    
}

    
    


