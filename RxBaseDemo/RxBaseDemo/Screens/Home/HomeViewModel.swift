//
//  HomeViewModel.swift
//  MilkeeDemo
//
//  Created by Thien.Vu2 on 06/12/2023.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    struct LocalDependency {
    }
    
    struct Input {
    }
    
    struct Output {
        let sections: Driver<[HomeSection]>
    }
    
    internal let navigator: BaseNavigator
    internal let localDependency: LocalDependency
    
    required init(navigator: BaseNavigator, localDependency: LocalDependency) {
        self.navigator = navigator
        self.localDependency = localDependency
    }
    
    func transform(input: Input) -> Output {
        let sections = Driver<[HomeSection]>.just([
            .header(items: [
                .headerCell,
                .headerCell,
                .headerCell
            ])
        ])
        return Output(sections: sections)
    }
}
