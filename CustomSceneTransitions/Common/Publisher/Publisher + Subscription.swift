//
//  Publisher + Subscription.swift
//  CustomSceneTransitions
//
//  Created by Yaroslav Abaturov on 09.02.2023.
//

class Publisher<T> {
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(_ subscriber: AnyObject, closure: @escaping ((oldValue: T, newValue: T)) -> ()) {
        subscribers.append(Subscriber(owner: subscriber, closure: closure))
        cleanDeadSubscribers()
    }
    
    private func cleanDeadSubscribers() {
        subscribers = subscribers.filter { $0.owner != nil }
    }
    
    var value: T {
        didSet {
            cleanDeadSubscribers()
            subscribers.forEach { $0.closure((oldValue, self.value)) }
        }
    }
    
    private var subscribers = [Subscriber<T>]()
}

private struct Subscriber<T> {
    init(owner: AnyObject, closure: @escaping ((oldValue: T, newValue: T)) -> ()) {
        self.owner = owner
        self.closure = closure
    }
    
    weak var owner: AnyObject?
    let closure: ((oldValue: T, newValue: T)) -> ()
}
