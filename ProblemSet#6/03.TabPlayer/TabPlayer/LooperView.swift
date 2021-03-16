
//
//  DrumPad.swift
//  TabPlayer
//
//  Created by Akito van Troyer on 2/25/21.
//

import SwiftUI
import AVFoundation
import AudioKit

class LooperView: ObservableObject {
    @Published var padStates = [Bool]()
    var players = [AppleSampler]()
    
    init() {
        let files = Bundle.main.paths(forResourcesOfType: "wav", inDirectory: "Samples")
        
        do {
            for file in files {
                let audioFile = try AVAudioFile(forReading: URL(string: file)!)
                let player = AppleSampler()
                try player.loadAudioFile(audioFile)
                padStates.append(false)
                players.append(player)
            }
        }
        catch let error {
            print("Cannot read audio file: ", error)
        }
    }
    
    func play(id: Int){
        try? players[id].play()
    }
}
