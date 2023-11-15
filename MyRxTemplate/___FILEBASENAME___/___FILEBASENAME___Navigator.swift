//___FILEHEADER___

import Foundation
import UIKit

protocol ___VARIABLE_sceneName___Navigator: BaseNavigator {
    func gotoView()
}

class ___VARIABLE_sceneName___NavigatorImpl: ___VARIABLE_sceneName___Navigator {
    weak var navigationController: UINavigationController?
    internal var store: StoreInterface
    
    
    init(store: StoreInterface, navigationController: UINavigationController) {
        self.store = store
        self.navigationController = navigationController
    }

    func start() {
        // Local dependencies
        let localDependency = ___VARIABLE_sceneName___ViewModel.LocalDependency()

        // View model
        let viewModel = ___VARIABLE_sceneName___ViewModel(navigator: self, localDependency: localDependency)

        // View controller
        let viewController = ___VARIABLE_sceneName___ViewController(viewModel: viewModel)

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func gotoView() {}
}
