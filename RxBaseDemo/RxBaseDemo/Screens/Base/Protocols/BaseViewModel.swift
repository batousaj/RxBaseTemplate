//
//  BaseViewModel.swift
//  MilwaukeeDemo
//
//  Created by Thien.Vu2 on 15/11/2023.
//

import Foundation

protocol BaseViewModel {
    associatedtype LocalDependency
    associatedtype Input
    associatedtype Output
    
    var navigator: BaseNavigator { get }
    var localDependency: LocalDependency { get }
    
    init(navigator: BaseNavigator, localDependency: LocalDependency)
    
    func resolve(withStore store: StoreInterface)
    func transform(input: Input) -> Output
}

extension BaseViewModel {
    static func initialize(withStore store: StoreInterface,
                           navigator: BaseNavigator,
                           localDependency: LocalDependency) -> Self {
        let viewModel = Self(navigator: navigator, localDependency: localDependency)
        viewModel.resolve(withStore: store)
        return viewModel
    }

    public func resolve(withStore store: StoreInterface) {
        let mirror = Mirror(reflecting: self)
        for children in mirror.children {
            if let resolvable = children.value as? Resolvable {
                resolvable.resolve(withStore: store)
            }
        }
    }
}
