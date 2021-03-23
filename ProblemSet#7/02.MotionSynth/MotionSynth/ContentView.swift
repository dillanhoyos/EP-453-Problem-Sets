//
//  ContentView.swift
//  MotionSynth
//
//  Created by Akito van Troyer on 3/12/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
      
        NavigationView {
                    VStack{
                        Spacer()
                        MotionView()
                            .navigationBarTitle("Processor")
                        Spacer()
                        NavigationLink(
                            destination: NewV(position: CGPoint, rotationAngle: CGFloat)){
                            Text("Go to XYPad Control >")
                                .padding()
                            
                        }
                    }
                }
            }

    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
