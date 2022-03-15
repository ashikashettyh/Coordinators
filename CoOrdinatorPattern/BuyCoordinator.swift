//
//  BuyCoordinator.swift
//  CoOrdinatorPattern
//
//  Created by Ashika Shetty on 15/03/22.
//

import UIKit

class BuyCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    
    var navigation: UINavigationController
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigation.pushViewController(vc, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        navigation = navigationController
    }
    
    func dismiss() {
        parentCoordinator?.childDismissed(self)
    }
}
