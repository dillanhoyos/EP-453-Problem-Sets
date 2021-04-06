//
//  AUDIORECORDER.swift
//  RECORDER
//
//  Created by Dillan Hoyos on 3/30/21.
//

import AudioKit
import AVFoundation

//Enum for switching between sound source for recording
enum SourceType: String, CaseIterable{
    case microphone = "Microphone"
    case synthesizer = "Synthesizer"
    
}

class AudioRecorder{
    
    var engine = AudioEngine()
    var mic:AudioEngine.InputNode!
    var osc:Oscillator!
    var mixer:Mixer!
    var curSource:SourceType = .microphone
    
    //Timer for controlling random pitch of the synth
    var timer:Timer!
    var curNote:MIDINoteNumber = 60
    
    //For recording
    var recorder:NodeRecorder!
    
    init(){
        //Initialize the mic input
        guard let input = engine.input else{
            fatalError()
        }
        mic = input
        osc = Oscillator(waveform: Table(.sine))
        mixer = Mixer([Fader(mic, gain: 0), osc])
        
        //Delete recoding if needed
         deleteRecording()
    }
    func startRecording(source: SourceType){
        //Clear any temporary recordings
        NodeRecorder.removeTempFiles()
        do {
            //keep track of current source
         
            switch source {
            case .microphone:
                curSource = .microphone
                recorder = try NodeRecorder(node: mic)
                
                break
            case .synthesizer:
                curSource = .synthesizer
                recorder = try NodeRecorder(node: osc)
                startTimer()
                break
            }
            try recorder.record()
            
        } catch let error{
            Log(error)
        }
    }
    func startTimer(){
            //start the time for random melody generator
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(randomFreq), userInfo: nil, repeats: true)
            osc.start()
        }
    func stopRecording(){
        recorder.stop()
        //StopTimer
        if curSource == .synthesizer{
            stoptimer()
        }
       
        //Initiate saving Recording
        saveRecording()
    }
    func saveRecording(){
        //create a name for the recording
        let format = DateFormatter()
        format.dateFormat = "yMMddHHmmss"
        //Get document directory
        let fileManager = FileManager.default
        var url = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        //Append our file name to the document directory
        url = url.appendingPathComponent("\(format.string(from:Date())).caf") // core audio file
        do {
            if fileManager.fileExists(atPath: (recorder.audioFile?.url.path)!){
            try fileManager.copyItem(at: (recorder.audioFile?.url)!, to: url)
            }
        } catch{
            print("Error: while copying file\(url.path):\(error.localizedDescription)")
        }
        
        
    }
   
    @objc func randomFreq(){
        let note = MIDINoteNumber(Int8.random(in: 60...72))
        osc.frequency = note.midiNoteToFrequency()
    }
    
    
    
    func stoptimer(){
        timer.invalidate()
        osc.stop()
    }
    
    func start(){
        engine.output = mixer
        do {
            try engine.start()
        } catch {
            print(error)
        }
    }
    func stop(){
        engine.stop()
    }
  
   
    func deleteRecording(){
        let fileManager = FileManager.default
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do{
            //get all file
            let files = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
            
            //delete
            for file in files{
                try fileManager.removeItem(at: file)
                
            }
            
        }catch{
            print(error)
        }
    }
}
