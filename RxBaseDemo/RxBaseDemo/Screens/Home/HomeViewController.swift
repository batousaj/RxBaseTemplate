//
//  TestViewController.swift
//  MilkeeDemo
//
//  Created by Thien.Vu2 on 06/12/2023.
//

import Foundation

class HomeViewController: BaseContentCollectionViewController<HomeSection> {
    
    override init(viewModel: (any BaseViewModel)? = nil) {
        super.init(viewModel: viewModel)
        dataProvider = HomeViewDataProvider(viewController: self)
        collectionViewDataSource = HomeViewDataProvider(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupView() {
        super.setupView()
    }
    
    override func setupContraints() {
        super.setupContraints()
    }
}
