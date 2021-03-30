//
//  ContentView.swift
//  MultiTouch
//
//  Created by Dillan Hoyos on 3/29/21.
//


import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
        MultiTouchControllerContainer()
            .navigationBarTitle("MultiSynth")
            Spacer()
                NavigationLink(destination:XYPadView()){
                    Text("Go to XYPad Control>")
                        .padding()
                }
            }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
