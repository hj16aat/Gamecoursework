//
//  DraggedImage.swift
//  Game Coursework
//
//  Created by Hetarth Joshi on 27/11/2018.
//  Copyright © 2018 Hetarth Joshi. All rights reserved.
//

import UIKit
import SpriteKit

class DraggedImageView: UIImageView {
    
    var myDelegate: subviewDelegate?
    var startLocation: CGPoint?
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        startLocation = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let currentLocation = touches.first?.location(in: self)
        let dx = currentLocation!.x - startLocation!.x
        let dy = currentLocation!.y - startLocation!.y
        
        self.center = CGPoint(x: self.center.x+dx, y: self.center.y+dy)
        
        let horizontal = self.bounds.midX
        center.x = max(horizontal,center.x)
        center.x = min(self.superview!.bounds.size.width - horizontal, center.x)
        
        let vertical = self.bounds.midY
        center.y = max(vertical, center.y)
        center.y = min(self.superview!.bounds.size.height - vertical, center.y)
        
        self.center = center
        
    
        
        self.myDelegate?.changeSomething()
    }
    
    
   
    
    
}

