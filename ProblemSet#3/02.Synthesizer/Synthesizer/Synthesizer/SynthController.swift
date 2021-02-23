//
//  SynthController.swift
//  Synthesizer
//
//  Created by Akito van Troyer on 1/27/21.
//

import Foundation
import SwiftUI
import AudioKit

class SynthController: ObservableObject, KeyboardDelegate {
    let engine = AudioEngine()
    let osc = MorphingOscillator(waveformArray: [Table(.sine), Table(.sawtooth), Table(.square), Table(.triangle)] )
    
    var amplitudeRange: ClosedRange<AUValue> = 0...1
        @Published var amplitude: AUValue = 0.2{
            didSet{
                osc.$amplitude.ramp(to: amplitude, duration: 0.1)
            }
        }
    

    
    init() {
        engine.output = osc
    }
    
    func start(){
        osc.index = 0
        osc.start()
        do {
            try engine.start()
        } catch let error {
            Log(error)
        }
    }
    
    func stop(){
        osc.stop()
        engine.stop()
    }
    
    func setWaveform(tableType: TableType) {
        switch tableType {
        case .sine:
            osc.index = 0
        case .sawtooth:
            osc.index = 1
        case .square:
            osc.index = 2
        case .triangle:
            osc.index = 3
        default:
            osc.index = 0
        }
    }
    
    func noteOn(note: MIDINoteNumber) {
        osc.frequency = note.midiNoteToFrequency()
        osc.amplitude = 0.2
    }
    
    func noteOff(note: MIDINoteNumber) {
        osc.amplitude = 0
    }
}

struct SynthView : View {
    @ObservedObject var controller = SynthController()

    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        VStack {
        
        
            Spacer()
            ButtonView(controller: controller)
            
            Spacer()
            KeyboardWidget(firstOctave: 2, octaveCount: 3, delegate: controller)
                .frame(height: screenSize.height/2)
        }
        .onAppear(){
            controller.start()
        }
        .onDisappear(){
            controller.stop()
        }
    }
}

// A view responsible for creating buttons for changing waveforms
// Buttons are stacked horizontally
struct ButtonView: View {
    var controller:SynthController
    @State var tableType:TableType = .sine
    @ObservedObject  var amp:amplitud = 0.2

    
    var body: some View {
        HStack {
            Button(action: {
                self.tableType = .sine
                controller.setWaveform(tableType: .sine)
            }) {
                Image(tableType == .sine ? "SIN" : "SINOFF")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            Button(action: {
                self.tableType = .sawtooth
                controller.setWaveform(tableType: .sawtooth)
            }) {
                Image(tableType == .sawtooth ? "SAW" : "SAWOFF")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            Button(action: {
                self.tableType = .square
                controller.setWaveform(tableType: .square)
            }) {
                Image(tableType == .square ? "SQR" : "SQROFF")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            Button(action: {
                self.tableType = .triangle
                controller.setWaveform(tableType: .triangle)
            }) {
                Image(tableType == .triangle ? "TRI" : "TRIOFF")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
        }
   

       
            VStack {
                Slider(
                    value: ,
                    in: 0...1,
                    onEditingChanged: { editing in
                        isEditing = editing
                    }
                )
                Text("\(speed)")
                    .foregroundColor(isEditing ? .red : .blue)
            }
        }
    
                                
            }
        
     
    


// This struct is neSlider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)eded to make KeyboardView from AudioKit available for SwiftUI
struct KeyboardWidget: UIViewRepresentable {

    typealias UIViewType = KeyboardView
    
    var firstOctave = 2
    var octaveCount = 2
    var delegate: KeyboardDelegate?

    func makeUIView(context: Context) -> KeyboardView {
        let view = KeyboardView()
        view.delegate = delegate
        view.firstOctave = firstOctave
        view.octaveCount = octaveCount
        return view
    }

    func updateUIView(_ uiView: KeyboardView, context: Context) {
        //
    }
}

struct SynthView_Previews: PreviewProvider {
    static var previews: some View {
        SynthView()
    }
}
