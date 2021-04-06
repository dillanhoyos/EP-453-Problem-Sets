//
//  LibraryView.swift
//  RECORDER
//
//  Created by Dillan Hoyos on 3/30/21.
//

import SwiftUI


struct LibraryView: View{
    @ObservedObject var controller = LibraryController()
 
    
    var body: some View{
        // listing all recodings
        
       
//      //Button(action: {
//      //  control.deleteRecording()
//
//        }){
//            Text("Disappear")
//            }
        
        
       
        Spacer()
        
        List {
            ForEach(0..<controller.recordings.count, id: \.self){ index in
                Button(action: {
                    controller.play(index: index)
                }){
                    Text(controller.recordings[index])
                }
               
              
            }
        }
        .onAppear(){
            controller.load()
            controller.start()
        }
        .onDisappear(){
            controller.stop()
            
        }
        
    }
  

}


