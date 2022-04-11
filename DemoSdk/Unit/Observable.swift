//
//  Observable.swift
//  DemoSdk
//
//  Created by vex on 2022/04/11.
//

class Observable<T> {
    private var listener: ((T) -> Void)?
    var value: T { didSet { listener?(value) } }
    init(_ value: T) { self.value = value }
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
