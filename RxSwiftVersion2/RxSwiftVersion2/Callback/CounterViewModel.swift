//
//  CounterViewModel.swift
//  RxSwiftVersion2
//
//  Created by Keisuke Horiguchi on 2021/07/05.
//

import Foundation

class CounterViewModel {
    private(set) var count = 0
    
    func incrementCount(callback: (Int) -> ()) {
        count += 1
        callback(count)
    }
    
    func decrementCount(callback: (Int) -> ()) {
        count -= 1
        callback(count)
    }
    
    func resetCount(callback: (Int) -> ()) {
        count = 0
        callback(count)
    }
    
}
