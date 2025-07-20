//
//  ViewController.swift
//  SwiftCombineSample
//
//  Created by Zeeshan Waheed on 02/07/2025.
//

import UIKit
import Combine

class CombineViewController: UIViewController {
    
    var current = 0
    
    // PassthroughSubject that emits Int values to subscribers
    let publisher = PassthroughSubject<Int, Never>()
    
    // Stores subscriptions to keep them alive
    var cancellables = Set<AnyCancellable>()
    
    @IBOutlet weak var numlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        // Transform Int values into String representations
        let resultPublisher = publisher.map { (input) -> String in
            return "\(input)"
        }
        
        // Subscribe to the transformed values and assign them to the label's text
        resultPublisher
            .assign(to: \.text!, on: numlabel)
            .store(in: &cancellables)
    }
    
    @IBAction func incrementBtnOnTap(_ sender: Any) {
        current += 1
        // Send the new value through the publisher
        publisher.send(current)
    }
}
