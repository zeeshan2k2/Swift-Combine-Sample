//
//  ViewController.swift
//  SwiftCombineSample
//
//  Created by Zeeshan Waheed on 02/07/2025.
//

import UIKit

class MainViewController: UIViewController {
    
    var current = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func traditionalVCBtnClicked(_ sender: Any) {
        navigateToVC(TraditionalViewController.self)
    }
    
    @IBAction func combineVCBtnClicked(_ sender: Any) {
        navigateToVC(CombineViewController.self)
    }
    
    
    @IBAction func refactoredCombineVCBtnClicked(_ sender: Any) {
        navigateToVC(RefactoredCombineViewController.self)
    }
}
