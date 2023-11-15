//___FILEHEADER___

import Foundation
import RxSwift
import RxCocoa

class ___VARIABLE_sceneName___ViewModel: BaseViewModel {
    struct LocalDependency {
    }
    
    struct Input {
    }
    
    struct Output {
    }
    
    internal let navigator: BaseNavigator
    internal let localDependency: LocalDependency
    
    //UseCase define here
    //.....
    
    required init(navigator: BaseNavigator, localDependency: LocalDependency) {
        self.navigator = navigator
        self.localDependency = localDependency
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
