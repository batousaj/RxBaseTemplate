//
//  BaseViewController.swift
//  MilkeeDemo
//
//  Created by Thien.Vu2 on 04/12/2023.
//

import Foundation
import RxSwift

class BaseViewController: UIViewController {
    internal let disposeBag = DisposeBag()
    
    var viewModel: (any BaseViewModel)?
    
    init(viewModel: (any BaseViewModel)? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
