//
//  ViewController.swift
//  SwiftCombineSample
//
//  Created by Zeeshan Waheed on 02/07/2025.
//

import UIKit

class TraditionalViewController: UIViewController {
    
    var current = 0
    
    @IBOutlet weak var numlabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func incrementBtnOnTap(_ sender: Any) {
        current += 1
        numlabel.text = "\(current)"
    }
}
