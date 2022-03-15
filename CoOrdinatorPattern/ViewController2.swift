//
//  ViewController2.swift
//  CoOrdinatorPattern
//
//  Created by Ashika Shetty on 15/03/22.
//

import UIKit

class ViewController2: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func createAccount(_ sender: Any) {
        coordinator?.createAccount()
    }
    
    @IBAction func buy(_ sender: Any) {
        coordinator?.buySubscription()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
