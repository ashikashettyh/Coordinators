//
//  MainCoordinator.swift
//  CoOrdinatorPattern
//
//  Created by Ashika Shetty on 14/03/22.
//

import UIKit

// have to subclass from NSobject to conform to nav delegates
class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigation: UINavigationController
    
    func start() {
        let vc = ViewController2.instantiate()
        navigation.delegate = self
        vc.coordinator = self
        navigation.pushViewController(vc, animated: false)
    }
    
    init(navigationController: UINavigationController) {
        navigation = navigationController
    }
    
    func buySubscription() {
        let child = BuyCoordinator(navigationController: navigation)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func createAccount() {
        let child = CreateAccountCoordinator(navigationController: navigation)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func childDismissed(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
}

// to notify when the view is in/out of window and handle child addition/ dismissal
extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
            
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return}
        
        
        // we are not popping the controller here, but pushing another vc on to the nav
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        
        // we are popping the controller
        if let buyViewController = fromViewController as? BuyViewController {
            childDismissed(buyViewController.coordinator)
        } else if let createVC = fromViewController as? CreateAccountViewController {
            childDismissed(createVC.coordinator)
        }
        
    }
}
