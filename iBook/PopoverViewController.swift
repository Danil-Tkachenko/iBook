//
//  PopoverViewController.swift
//  iBook
//
//  Created by Леонид Шелудько on 03.01.2023.
//

import UIKit

protocol PopoverActions {
    func colorText(color: UIColor?)
    func fontText(font: UIFont?)
}

class PopoverViewController: UIViewController {
    
    var delegate: PopoverActions?
    
    let (blackColorButton, grayColorButton, redColorButton, brownColorButton) = (UIButton(), UIButton(), UIButton(), UIButton())

    var seeSementControll = UISegmentedControl()
    let nameSegmentArray = ["Обычный", "Для бати"]
    var fontSegmet: UIFont? = UIFont.systemFont(ofSize: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        createColor()
        
        seeSementControll = UISegmentedControl(items: self.nameSegmentArray)
        seeSementControll.frame = CGRect(x: 30, y: 70, width: 200, height: 30)
        seeSementControll.selectedSegmentIndex = 0
        view.addSubview(seeSementControll)
        
        seeSementControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
    fileprivate func createColor() {
        let arrayColorButton = [blackColorButton, grayColorButton, redColorButton, brownColorButton]
    
        blackColorButton.backgroundColor = .black
        grayColorButton.backgroundColor = .gray
        redColorButton.backgroundColor = .red
        brownColorButton.backgroundColor = .brown
        
        var x = 10
        for color in arrayColorButton {
            color.frame = CGRect(x: x, y: 120, width: 40, height: 40)
            x += 60
            
            color.layer.cornerRadius = 0.5 * color.bounds.size.width
            color.clipsToBounds = true
            color.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
            view.addSubview(color)
        }
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.seeSementControll {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                self.fontSegmet = UIFont.systemFont(ofSize: 16)
            } else {
                self.fontSegmet = UIFont.boldSystemFont(ofSize: 22)
            }
            self.delegate?.fontText(font: fontSegmet)
        }
    }
    
    @objc func thumbsUpButtonPressed(button: UIButton) {
        self.delegate?.colorText(color: button.backgroundColor)
    }
}
