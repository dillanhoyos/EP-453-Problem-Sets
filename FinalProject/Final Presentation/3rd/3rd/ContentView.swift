//
//  ContentView.swift
//  3rd
//
//  Created by Dillan Hoyos on 4/21/21.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var screenSize = UIScreen.main.bounds
    let doodlescene = DoodleScene()
    
    var scene : SKScene{
        
        doodlescene.size = CGSize(width: screenSize.width, height: screenSize.height)
        
        //scale the scene to fill the screen
        doodlescene.scaleMode = .fill
        
        //set up the view in the scene
        doodlescene.view?.ignoresSiblingOrder = true
        doodlescene.view?.showsFPS = true
        doodlescene.view?.showsNodeCount = true
        
        
        return doodlescene
    }
    
    
    var body: some View {
       SpriteView(scene: scene)
        .frame(width: screenSize.width, height: screenSize.height)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
