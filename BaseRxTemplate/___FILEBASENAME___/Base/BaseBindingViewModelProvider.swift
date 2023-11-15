//___FILEHEADER___

import Foundation

protocol BaseBindingViewModelProvider {
    var viewController: BaseViewController? { get }
    
    func bindingViewModel()
}
