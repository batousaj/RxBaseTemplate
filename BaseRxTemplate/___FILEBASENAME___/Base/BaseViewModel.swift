//___FILEHEADER___

import Foundation

protocol BaseViewModel {
    associatedtype LocalDependency
    associatedtype Input
    associatedtype Output
    
    var navigator: BaseNavigator { get }

    func transform(input: Input) -> Output
}
