//
//  SampleViewModel.swift
//  TestForRxSwift
//
//  Created by Keisuke Horiguchi on 2021/06/30.
//

import Foundation
import RxSwift

class SampleViewModel {

    //Sample1
    //Privateで発行するObservableを持つ
    private let eventSubject = PublishSubject<Int>()

//    //発行したものを公開する用のプロパティを持つ
//    var event: Observable<Int> { return eventSubject }

    //Funcを動かした際に発行するようのものを同時に動かし、値を渡せるようにする
    func doSomething() {
        eventSubject.onNext(1)
    }
    
    //Sample2
    private let buttonHiddenSubject = BehaviorSubject(value: false)
    var buttonHidden:Observable<Bool> { return buttonHiddenSubject }
    
    func start() {
        buttonHiddenSubject.onNext(true)
    }
    
    func stop() {
        buttonHiddenSubject.onNext(false)
    }
    
    func doAnything() {
        addEvent.onNext(3)
    }
    
    //Sample3 マージさせてみる
    private let addEvent = PublishSubject<Int>()
    
    var event: Observable<Int> {
        return Observable.of(eventSubject, addEvent).merge()
    }
    
    private let locationMonitor = LocationMonitor()
    private let route = Route()
    
    //Sample4
    var distance: Observable<String> {
        return Observable.combineLatest(locationMonitor.location, route.route) {loc, rto in
            String(loc) + rto
        }
    }
    
}


class LocationMonitor {
    private let locationSubject = BehaviorSubject<Int>(value: 1)
    
    var location: Observable<Int> {
        return locationSubject
    }
}

class Route {
    private let routeSubject = BehaviorSubject<String>(value: "100")
    
    var route: Observable<String> {
        return routeSubject
    }
    
}
