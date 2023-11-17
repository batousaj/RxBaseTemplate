//
//  BaseViewController.swift
//  MilwaukeeDemo
//
//  Created by Thien.Vu2 on 15/11/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    internal let disposeBag = DisposeBag()
    
    var viewModel: (any BaseViewModel)?
    var bindingProvider: BaseBindingViewModelProvider?
    
    init(viewModel: (any BaseViewModel)? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenBackButton()
        setupView()
        setupContraints()
    }
    
    private func hiddenBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func setupView() {}
    
    func setupContraints() {}
}
