//
//  ViewController.swift
//  drawing-app
//
//  Created by Bisma S Wasesasegara on 07/07/20.
//  Copyright © 2020 Bisma S Wasesasegara. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    var line = [CGPoint]()
    
    override func draw(_ rect: CGRect) {
        // Custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Test first line
//        let start: CGPoint = .zero
//        let end = CGPoint(x: 100, y: 100)
//        context.move(to: start)
//        context.addLine(to: end)
        
        for (index, point) in line.enumerated() {
            if index == 0 { context.move(to: point) }
            else { context.addLine(to: point) }
        }
        
        context.strokePath()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        line.append(touch)
        setNeedsDisplay()
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let canvas = Canvas(frame: view.frame)
        canvas.backgroundColor = .white
        view.addSubview(canvas)
    }


}

