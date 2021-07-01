//
//  ViewController.swift
//  TestForRxSwift
//
//  Created by Keisuke Horiguchi on 2021/06/17.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let sampleViewModel: SampleViewModel = SampleViewModel()
    var disposable: Disposable = SampleViewModel().event.subscribe()
//    var boolDisposable: Disposable = SampleViewModel().buttonHidden.subscribe()
    //bindの場合の初期化例
    var boolDisposable: Disposable = SampleViewModel().buttonHidden.bind { Bool in
    }
    
    //VC開放時に開放する場合
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var rxButton: UIButton!
    @IBOutlet weak var rxLabel: UILabel!
    @IBOutlet weak var fukkatsuBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        disposable = sampleViewModel.event.subscribe(
            onNext: { value in
                self.rxLabel.text = String(value)
            }, onError: { error in
                print(error)
            }, onCompleted: {
                print("completed")
            }
        )
        
//        boolDisposable = sampleViewModel.buttonHidden.subscribe(onNext: { bool in
//            self.rxButton.isHidden = bool
//        })
        
//        //bind使ってみる
//        boolDisposable = sampleViewModel.buttonHidden.bind(to: rxButton.rx.isHidden)
        
        //直接Bindできる？？→機能した。じゃあもうDisposableいらないのでは？？
        sampleViewModel.buttonHidden
            .bind(to: rxButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        //同じ値を別にもBind
        sampleViewModel.buttonHidden
            .bind(to: moreBtn.rx.isHidden)
            .disposed(by: disposeBag)
        
        
    }
    
    @IBAction func pressBtn(_ sender: Any) {
        sampleViewModel.doSomething()
        sampleViewModel.start()
    }
    @IBAction func fukkatsuClicked(_ sender: Any) {
        sampleViewModel.stop()
    }
    
    @IBAction func moreClicked(_ sender: Any) {
        sampleViewModel.doAnything()
    }
    
}

