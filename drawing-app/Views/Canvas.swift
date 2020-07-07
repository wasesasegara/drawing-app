//
//  Canvas.swift
//  drawing-app
//
//  Created by Bisma S Wasesasegara on 07/07/20.
//  Copyright © 2020 Bisma S Wasesasegara. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    fileprivate var lines = [[CGPoint]]()
    
    func undo() {
        guard lines.count > 0 else { return }
        lines.removeLast()
        setNeedsDisplay()
    }
    
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Stylize strokes
        context.setLineWidth(10)
        context.setLineCap(.round)
        
        // Read all lines and start drawing
        lines.forEach { (line) in
            for (index, point) in line.enumerated() {
                if index == 0 { context.move(to: point) }
                else { context.addLine(to: point) }
            }
        }
        
        context.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Create new line
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        
        // Pop out last line and modify it then append it again to lines
        guard var line = lines.popLast() else { return }
        line.append(touch)
        lines.append(line)
        
        // Update display of lines
        setNeedsDisplay()
    }
    
}
