//
//  ViewController.swift
//  drawing-app
//
//  Created by Bisma S Wasesasegara on 07/07/20.
//  Copyright © 2020 Bisma S Wasesasegara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    var undoButton: UIButton!
    var clearButton: UIButton!
    
    func getButton(_ title: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    override func loadView() {
        view = canvas
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.backgroundColor = .white
        
        undoButton = getButton("Undo", action: #selector(handleUndo))
        clearButton = getButton("Clear", action: #selector(handleClear))
        
        addStackMenu()
    }
    
    fileprivate func addStackMenu() {
        
        let stackMenu = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton
        ])
        
        view.addSubview(stackMenu)
        stackMenu.translatesAutoresizingMaskIntoConstraints = false
        stackMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackMenu.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackMenu.distribution = .fillEqually
    }
    
    @objc func handleUndo() {
        canvas.undo()
    }
    
    @objc func handleClear() {
        canvas.clear()
    }

}

