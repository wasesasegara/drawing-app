//
//  ViewController.swift
//  drawing-app
//
//  Created by Bisma S Wasesasegara on 07/07/20.
//  Copyright © 2020 Bisma S Wasesasegara. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    override func draw(_ rect: CGRect) {
        // Custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let start: CGPoint = .zero
        let end = CGPoint(x: 100, y: 100)
        
        context.move(to: start)
        context.addLine(to: end)
        
        context.strokePath()
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

