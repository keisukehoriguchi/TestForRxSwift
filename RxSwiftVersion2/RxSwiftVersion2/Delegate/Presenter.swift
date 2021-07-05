//
//  Presenter.swift
//  RxSwiftVersion2
//
//  Created by Keisuke Horiguchi on 2021/07/05.
//

import Foundation

class CounterPresenter {
    private var count = 0 {
        didSet {
            delegate?.updateCount(count: count)
        }
    }
    
    private var delegate: CounterDelegate?
    
    func attacheView(_ delegate: CounterDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func incrementCount() {
        count += 1
    }
    
    func decrementCount() {
        count -= 1
    }
    
    func resetCount() {
        count = 0
    }
    
}

