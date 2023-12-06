//
//  HomeViewNavigator.swift
//  MilkeeDemo
//
//  Created by Thien.Vu2 on 06/12/2023.
//

import Foundation
import UIKit

class HomeViewNavigator: BaseNavigator {
    var navigationController: UINavigationController?
    
    var store: StoreInterface
    
    init(navigationController: UINavigationController? = nil, store: StoreInterface) {
        self.navigationController = navigationController
        self.store = store
    }
    
    func start() {
        // Local dependencies
        let localDependency = HomeViewModel.LocalDependency()

        let viewModel = HomeViewModel.initialize(
            withStore: store,
            navigator: self,
            localDependency: localDependency)

        let viewController = HomeViewController(viewModel: viewModel)

        navigationController?.pushViewController(viewController, animated: true)
    }
}
