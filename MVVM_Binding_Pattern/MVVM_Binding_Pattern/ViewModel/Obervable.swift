//
//  Obervable.swift
//  MVVM_Binding_Pattern
//
//  Created by 전상민 on 2021/07/09.
//

import Foundation

class Observable<T> {
    var value: T?{
        didSet{
            listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void){
        listener(value)
        self.listener = listener
    }
}
