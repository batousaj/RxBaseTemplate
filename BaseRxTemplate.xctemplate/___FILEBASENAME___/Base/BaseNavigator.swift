//___FILEHEADER___

import Foundation
import UIKit

protocol BaseNavigator {
    var navigationController: UINavigationController? { get }
    var store: StoreInterface { get }
    
    func start()
}
