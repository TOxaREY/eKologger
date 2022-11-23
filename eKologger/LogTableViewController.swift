//
//  LogTableViewController.swift
//  eKologger
//
//  Created by Alexey Golovanov on 26.10.2022.
//

import UIKit

class LogTableViewController: UITableViewController {
    
    var viewModel = ViewModel()
    
    @IBOutlet weak var titleLabel: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.title = "LOG"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.cellData(tableView: tableView, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDevice.count
    }
    
    deinit {
        dataDevice.removeAll()
        print("deinit LogTableViewController")
    }
}
