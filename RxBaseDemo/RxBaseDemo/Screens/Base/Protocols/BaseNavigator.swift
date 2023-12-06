//
//  BaseNavigator.swift
//  MilwaukeeDemo
//
//  Created by Thien.Vu2 on 15/11/2023.
//

import Foundation
import UIKit

protocol BaseNavigator {
    var navigationController: UINavigationController? { get }
    var store: StoreInterface { get }
    
    func start()
}
