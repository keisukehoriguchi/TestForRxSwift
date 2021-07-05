//
//  ViewController.swift
//  RxSwiftVersion2
//
//  Created by Keisuke Horiguchi on 2021/07/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    private var viewModel: CounterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CounterViewModel()
        
    }
    
    @IBAction func countUp(_ sender: Any) {
        viewModel.incrementCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }
    
    @IBAction func countDown(_ sender: Any) {
        viewModel.decrementCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }
    
    @IBAction func countReset(_ sender: Any) {
        viewModel.resetCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }
    
    private func updateCountLabel(_ count: Int) {
        countLabel.text = String(count)
    }
    
}

