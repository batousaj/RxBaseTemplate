//___FILEHEADER___

import UIKit
import RxSwift
import RxCocoa

class ___VARIABLE_sceneName___ViewController: BaseViewController {
    
    override init(viewModel: (any BaseViewModel)? = nil) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindingProvider = ___VARIABLE_sceneName___DataProvider(viewController: self)
        bindingProvider?.bindingViewModel()
    }
    
    override func setupView() {
        super.setupView()
    }
    
    override func setupContraints() {
        super.setupContraints()
    }
}
