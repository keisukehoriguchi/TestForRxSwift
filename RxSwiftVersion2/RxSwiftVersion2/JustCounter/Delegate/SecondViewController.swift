//
//  SecondViewController.swift
//  RxSwiftVersion2
//
//  Created by Keisuke Horiguchi on 2021/07/05.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    private let presenter = CounterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attacheView(self)
    }
    @IBAction func countUp(_ sender: Any) {
        presenter.incrementCount()
    }
    
    @IBAction func countDown(_ sender: Any) {
        presenter.decrementCount()
    }
    
    @IBAction func countReset(_ sender: Any) {
        presenter.resetCount()
    }
    
}

extension SecondViewController: CounterDelegate {
    func updateCount(count: Int) {
        countLabel.text = String(count)
    }
    
}
