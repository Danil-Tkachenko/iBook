//
//  ViewController.swift
//  iBook
//
//  Created by Леонид Шелудько on 03.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let navBar = UINavigationBar()
    var bookTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "iBook"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                                 target: self,
                                                                 action: #selector(creatPopover))
        
        bookTextView = UITextView(frame: self.view.bounds)
        bookTextView.text = bookText.text
        bookTextView.font = .systemFont(ofSize: 16)
        bookTextView.isEditable = false
        bookTextView.scrollRangeToVisible(bookTextView.selectedRange)
        //стало грузиться с начала страницы
        bookTextView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        view.addSubview(bookTextView)
        
    }

    @objc func creatPopover(param: UIBarButtonItem) {
        let popoverViewController = PopoverViewController()
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.preferredContentSize = CGSize(width: self.view.bounds.width - 150, height: 300)
        
        guard let presentionVC = popoverViewController.popoverPresentationController else { return }
        presentionVC.delegate = self
        //откуда отталкиваается поповер
        presentionVC.sourceItem = navigationItem.rightBarButtonItem
        //направление хвостика
        presentionVC.permittedArrowDirections = .up
        presentionVC.sourceRect = CGRect(x: (navigationItem.rightBarButtonItem?.accessibilityFrame.midX)!,
                                         y: (navigationItem.rightBarButtonItem?.accessibilityFrame.minY)!,
                                         width: 0,
                                         height: 0)
        
        present(popoverViewController, animated: true)
        
        popoverViewController.delegate = self
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

extension ViewController: PopoverActions {
    func colorText(color: UIColor?) {
        bookTextView.textColor = color
        //print(color!)
    }
    func fontText(font: UIFont?) {
        bookTextView.font = font
        //print(font!)
    }
    
}
