//
//  MainCoordinator.swift
//  CoOrdinatorPattern
//
//  Created by Ashika Shetty on 14/03/22.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigation: UINavigationController
    
    func start() {
        let vc = ViewController2.instantiate()
        vc.coordinator = self
        navigation.pushViewController(vc, animated: false)
    }
    
    init(navigationController: UINavigationController) {
        navigation = navigationController
    }
    
    func buySubscription() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigation.pushViewController(vc, animated: true)
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigation.pushViewController(vc, animated: true)
    }
    
}
