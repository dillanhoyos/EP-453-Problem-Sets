//
//  Controllerrecorder.swift
//  RECORDER
//
//  Created by Dillan Hoyos on 3/30/21.
//

import SwiftUI
import AVFoundation



class RecorderController: ObservableObject{
    @Published var audioSource = SourceType.microphone
    @Published var isRecording = false
    var recorder = AudioRecorder()
    init() {
        
        do{
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, options: [.defaultToSpeaker, .mixWithOthers])
            
            try AVAudioSession.sharedInstance().setActive(true)
        } catch{
            print(error)
        }
    }
    
    func record(){
        isRecording.toggle()
        if isRecording{
            recorder.startRecording(source: audioSource)
            
        }
        else{
            recorder.stopRecording()
        }
        
    }
    func start(){
        recorder.start()
    }
    func stop(){
        recorder.stop()
    }
    
}
