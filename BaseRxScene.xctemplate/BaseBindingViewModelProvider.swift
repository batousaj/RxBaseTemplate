//
//  BaseBindingViewModel.swift
//  MilwaukeeDemo
//
//  Created by Thien.Vu2 on 15/11/2023.
//

import Foundation

protocol BaseBindingViewModelProvider {
    var viewController: BaseViewController? { get }
    
    func bindingViewModel()
}
