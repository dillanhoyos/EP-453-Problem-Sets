
//
//  MultiTouchView.swift
//  MultiTouch
//
//  Created by Dillan Hoyos on 3/29/21.
//

import SwiftUI
import UIKit

class MultiTouchView2: UIView {
    let circleSize:CGFloat = 50
    var color:CGFloat = 0
    var ids = [Int:Int]()
    var count = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        isMultipleTouchEnabled = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        clipsToBounds = true
        isMultipleTouchEnabled = true
    }
    
    // Add circle to this view based the touch position
    // NOTE: This is not the best way to draw something in iOS, but the code is easier to understand
    
   }
    


