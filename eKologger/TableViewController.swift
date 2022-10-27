//
//  TableViewController.swift
//  eKologger
//
//  Created by Alexey Golovanov on 26.10.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.cellData(tableView: tableView, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDevice.count
    }
    
    deinit {
        dataDevice.removeAll()
        print("deinit TableVC")
    }
}
