//
//  PlaybackController.swift
//  SamplePlayback
//
//  Created by Akito van Troyer on 1/21/21.
//

import Foundation
import SwiftUI
import AudioKit
import AVFoundation

class PlaybackController: ObservableObject {
    let engine = AudioEngine()
    var mixer:Mixer?
    var guitar:AudioPlayer?
    var trumpet:AudioPlayer?
    var loop:AudioPlayer?
    var band:AudioPlayer?
    var synth:AudioPlayer?
    
    func setupPlayback(){
        let guitarFile = loadAudioFile(file: "Sounds/guitar.wav")
        guitar = AudioPlayer(file: guitarFile!)
        guitar?.isLooping = false
        let trumpetFile = loadAudioFile(file: "Sounds/trumpet.wav")
        trumpet = AudioPlayer(file: trumpetFile!)
        trumpet?.isLooping = false
        let loopFile = loadAudioFile(file: "Sounds/loop.wav")
        loop = AudioPlayer(file: loopFile!)
        loop?.isLooping = true
        let bandFile = loadAudioFile(file: "Sounds/band.wav")
        band = AudioPlayer(file: bandFile!)
        band?.isLooping = false
        let synthFile = loadAudioFile(file: "Sounds/synth.wav")
        synth = AudioPlayer(file: synthFile!)
        synth?.isLooping = false
        
        mixer = Mixer([guitar!, trumpet!, loop!, synth!, band!])
        engine.output = mixer
        
        do {
            try engine.start()
        } catch {
            Log("AudioKit did not start! \(error)")
        }
    }
    
    func loadAudioFile(file: String) -> AVAudioFile? {
        var audioFile:AVAudioFile?
        guard let url = Bundle.main.resourceURL?.appendingPathComponent(file) else { return nil }
        do {
            audioFile = try AVAudioFile(forReading: url)
        } catch {
            Log("Could not load: $file")
        }
        
        return audioFile
    }
    
    func stop(){
        engine.stop()
    }
    
    func playGuitar(){
        if ((guitar?.isStarted) != nil) {
            guitar?.stop()
        }
        guitar?.play()
    }
    
    func playTrumpet(){
        if((trumpet?.isStarted) != nil){
            trumpet?.stop()
        }
        trumpet?.play()
    }
    func playSynth(){
        if((synth?.isStarted) != nil){
            synth?.stop()
        }
        synth?.play()
    }

    func playBand(){
        if((band?.isStarted) != nil){
            band?.stop()
        }
        band?.play()
    }
    
    func playLoop(){
        loop?.play()
    }
    
    func stopLoop(){
        band?.stop()
        synth?.stop()
        guitar?.stop()
        
        loop?.stop()
    }
    
}

struct PlaybackControlView: View {
    @ObservedObject var controller = PlaybackController()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("background")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Button(action: controller.playSynth) {
                        Image("synth")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .bottomLeading)
                    }
                    .padding()
                    .frame(width: 50, height: 50, alignment: .topTrailing)
                    .position(x: 100, y: 330)
                    Spacer()
                    Button(action: controller.playBand) {
                        Image("band")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .bottomLeading)
                            
                    }
                    .frame(width: 50, height: 50, alignment: .topLeading)
                    .position(x: 120, y: 350 )
                    }
                    Spacer()
                    Button(action: controller.playGuitar) {
                        Image("guitar")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .bottomLeading)
                            
                    }
                    .frame(width: 50, height: 50, alignment: .topLeading)
                    .position(x: 70, y: 315)
                    
                    
                    .padding()
                    Button(action: controller.playTrumpet) {
                        Image("trumpet")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .bottomLeading)
                    }
                    .padding()
                    .frame(width: 50, height: 50, alignment: .topTrailing)
                    .position(x: 350, y: 60)
                    Spacer()
                   
                  
                    HStack {
                        Button(action: controller.playLoop) {
                            Text("Play")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .font(.system(size: 40))
                        }
                        
                       
                        .padding()
                        Spacer()
                        Button(action:controller.stopLoop) {
                            Text("Stop")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .font(.system(size: 40))
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            controller.setupPlayback()
        }
        .onDisappear {
            controller.stop()
        }
    }
}

struct PlaybackControlView_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControlView()
    }
}
