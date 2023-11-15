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

    func transform(input: Input) -> Output
}
