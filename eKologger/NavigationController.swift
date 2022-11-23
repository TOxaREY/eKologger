//
//  NavigationController.swift
//  eKologger
//
//  Created by Alexey Golovanov on 28.10.2022.
//

import UIKit

class NavigationController: UINavigationController {
    
    var viewModel = ViewModel()
    
    @IBOutlet weak var navBar: UINavigationBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        print("deinit NavigationController")
    }
}
