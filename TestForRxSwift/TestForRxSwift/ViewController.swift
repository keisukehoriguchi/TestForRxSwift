//
//  ViewController.swift
//  TestForRxSwift
//
//  Created by Keisuke Horiguchi on 2021/06/17.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let hoge: Hoge = Hoge()
    var disposable: Disposable = Hoge().event.subscribe()
    @IBOutlet weak var rxButton: UIButton!
    @IBOutlet weak var rxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        disposable = hoge.event.subscribe(
            onNext: { value in
                self.rxLabel.text = String(value)
            }, onError: { error in
                print(error)
            }, onCompleted: {
                print("completed")
            }
        )
    }
    
    @IBAction func pressBtn(_ sender: Any) {
        hoge.doSomething()
    }
    
}

