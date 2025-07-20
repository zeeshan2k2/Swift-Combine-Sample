//
//  ViewController.swift
//  SwiftCombineSample
//
//  Created by Zeeshan Waheed on 02/07/2025.
//

import UIKit
import Combine

class RefactoredCombineViewController: UIViewController {
    
    var current = 0
    
    let counter = Counter()
    
    // Stores subscriptions to keep them alive
    var cancellables = Set<AnyCancellable>()
    
    @IBOutlet weak var numLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    @IBAction func incrementBtnOnTap(_ sender: Any) {
        counter.increment()
    }

    func bind() {
        // Subscribe to the @Published value property and assign updates to the label's text
        counter.$value
            .assign(to: \.text!, on: numLabel)
            .store(in: &cancellables)
    }
}

class Counter {
    // @Published property automatically creates a Publisher for value changes
    @Published private (set) var value: String = "0"
    
    private var current = 0
    
    func increment() {
        current += 1
        // Updating value emits a new value to any subscribers
        value = "\(current)"
    }
}
