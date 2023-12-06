//
//  ViewController.swift
//  RxBaseDemo
//
//  Created by Thien.Vu2 on 07/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gotoHome()
    }

    func gotoHome() {
        let stored = Store()
        let navigator = HomeViewNavigator(navigationController: navigationController, store: stored)
        navigator.start()
    }
}

