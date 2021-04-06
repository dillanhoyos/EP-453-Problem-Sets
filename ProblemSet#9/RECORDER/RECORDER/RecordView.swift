//
//  RecordView.swift
//  RECORDER
//
//  Created by Dillan Hoyos on 3/30/21.
//

import SwiftUI

struct RecorderView: View{
    
    @ObservedObject var controller = RecorderController()
    @State var isTimerRunning = false
    @State private var startTime =  Date()
    @State private var timerString = "0.00"
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()


    let screenSize = UIScreen.main.bounds
    
  
    var body: some View{
        NavigationView{
            VStack(){
                NavigationLink(
                    
                    destination: LibraryView()){
                    Text("RecordedSounds ->")
                }
             
                  
                    
                
                    Spacer()
                    //Recording Button
                    Button(action:{
                        controller.record()
                        
                    }){
                        Image(systemName: controller.isRecording ? "stop.fill" : "record.circle.fill")
                            
                            .font(.system(size: 60))
                            .frame(width: screenSize.width)
                            
                            .onTapGesture {
                                if !isTimerRunning {
                                    timerString = "0.00"
                                    startTime = Date()
                                }
                                isTimerRunning.toggle()
                            }
                    }
                       
                        Text(self.timerString)
                            .font(Font.system(.largeTitle, design: .monospaced))
                            .onReceive(timer) { _ in
                                if self.isTimerRunning {
                                    timerString = String(format: "%.2f", (Date().timeIntervalSince( self.startTime)))
                                }
                            }
                            .onTapGesture {
                                if !isTimerRunning {
                                    timerString = "0.00"
                                    startTime = Date()
                                }
                                isTimerRunning.toggle()
                            }
                
                    Spacer()
                    
                    //Change sound source using Picker
                    
                    Picker(selection: $controller.audioSource, label: Text("AudioSource:")){
                        ForEach(0..<SourceType.allCases.count, id: \.self){count in Text(SourceType.allCases[count].rawValue)
                            .tag(SourceType.allCases[count])
                        }
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
         
        }
        
        .onAppear(){
            controller.start()
        }
        .onDisappear(){
            controller.stop()
        }
    }
}
