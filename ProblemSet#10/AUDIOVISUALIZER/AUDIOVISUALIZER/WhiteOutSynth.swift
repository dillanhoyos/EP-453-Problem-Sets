//
//  WhiteOutSynth.swift
//  WhiteOut
//
//  Created by Akito van Troyer on 4/2/21.
//
import AudioKit
import Foundation

class WhiteOutSynth {
    var engine = AudioEngine()
    var noise:WhiteNoise!
    var filter:LowPassFilter!
    var filter1:ResonantFilter!
    var filter2:ResonantFilter!
    var filter3:ResonantFilter!
    var filter4:ResonantFilter!
    var filter5:ResonantFilter!
    var filter6:ResonantFilter!
    var filter7:ResonantFilter!
    var filter8:ResonantFilter!
    var filter9:ResonantFilter!
    var filter10:ResonantFilter!
    let fader1:Fader!
       let fader2:Fader!
       let fader3:Fader!
       let fader4:Fader!
       let fader5:Fader!
       let fader6:Fader!
       let fader7:Fader!
       let fader8:Fader!
       let fader9:Fader!
//       let fader10:Fader!
    var reverb:Reverb!
    var fft:FFTTap!
    var mic:AudioEngine.InputNode!
    var amp:AmplitudeTap!
    var fftData = [Float]()
    var mixer:Mixer!
    
    init(){
        // Track the amp of microhpne input
        guard let input = engine.input else {
            fatalError()
        }
        
        //Track microphone signal
        mic = input
        amp = AmplitudeTap(mic)
        
        // Keep the audio silent at the beginning
        noise = WhiteNoise(amplitude: 0)
        
        filter2 = ResonantFilter(noise, frequency: 40, bandwidth: 44100)
        filter3 = ResonantFilter(noise, frequency: 1945, bandwidth: 44100)
        filter4 = ResonantFilter(noise, frequency: 3000, bandwidth: 44100)
        filter5 = ResonantFilter(noise, frequency: 5000, bandwidth: 44100)
        filter6 = ResonantFilter(noise, frequency: 1000, bandwidth: 44100)
        filter7 = ResonantFilter(noise, frequency: 1200, bandwidth: 44100)
        filter8 = ResonantFilter(noise, frequency: 15000, bandwidth: 44100)
        filter9 = ResonantFilter(noise, frequency: 17000, bandwidth: 44100)
        filter10 = ResonantFilter(noise, frequency: 19050, bandwidth: 44100)
//        reverb = Reverb(filter2)
        
        //Add Fader to the mic input, a trick to get FFTTap to get audio signal from the mic input
        let fader = Fader(mic)
         fader1 = Fader(filter2)
         fader2 = Fader(filter3)
         fader3 = Fader(filter4)
         fader4 = Fader(filter5)
         fader5 = Fader(filter6)
         fader6 = Fader(filter7)
         fader7 = Fader(filter8)
         fader8 = Fader(filter9)
         fader9 = Fader(filter10)
        

        
//        mixer = Mixer([Fader(fader, gain: 0), reverb])
        mixer = Mixer([Fader(fader, gain: 0), Fader(fader1, gain: 0.01), Fader(fader2, gain: 0), Fader(fader3, gain: 0), Fader(fader4, gain: 0), Fader(fader5, gain: 0),Fader(fader6, gain: 0.03),Fader(fader7, gain: 0), Fader(fader8, gain: 0),Fader(fader9, gain: 0)])
        reverb = Reverb(mixer)
//
        // Track the spectrum of the filtered noise
        fft = FFTTap(fader){ fftData in
            self.fftData = fftData
        }

        // Make AudioKit more responsive to microphone input
        Settings.bufferLength = .shortest
    }
    
    func start(){
        //Start microphon input and noise source
        mic.start()
        noise.start()
        
        //Start the audio engine
        engine.output = mixer
        do {
            try engine.start()
        } catch {
            print(error)
        }

        //Taps seemed to like to start after the engine is started
        fft.start()
        amp.start()
        
        // Start a timer to track microphone amplitude
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateAmp), userInfo: nil, repeats: true)
    }
    
    func stop(){
        mic.stop()
        fft.start()
        amp.stop()
        engine.stop()
    }
    
    @objc func updateAmp(){
        noise.amplitude = amp.amplitude * 15
    }
    
    //Assumes freq value in between 0 ~ 1
    func setFrequency(freq: Double) {
        filter?.cutoffFrequency = AUValue(freq * Settings.sampleRate * 0.125)
    }
    
    //assumes values from 0 to 4
  
    func setVol2(gain: Double){
        
        fader1?.gain = AUValue(gain)
        }
    func setVol(gain: Double){
        
        fader6?.gain = AUValue(gain)
        }
    
    
    //
    
    //Assumes res value in between 0 ~ 1
    func setResonance(res: Double) {
        filter?.resonance = AUValue(res * 20)
    }
    
    func getFFTData() -> [Float] {
        return fft.fftData
    }
}
