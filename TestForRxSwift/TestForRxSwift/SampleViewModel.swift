//
//  SampleViewModel.swift
//  TestForRxSwift
//
//  Created by Keisuke Horiguchi on 2021/06/30.
//

import Foundation
import RxSwift

class Hoge {
    
    //Privateで発行するObservableを持つ
    private let eventSubject = PublishSubject<Int>()
    
    //発行したものを公開する用のプロパティを持つ
    var event: Observable<Int> { return eventSubject }
    
    //Funcを動かした際に発行するようのものを同時に動かし、値を渡せるようにする
    func doSomething() {
        eventSubject.onNext(1)
    }
    
}
