//
//  DaysMeasurementTableViewLoad.swift
//  eKologger
//
//  Created by Alexey Golovanov on 26.10.2022.
//

import UIKit


class DaysMeasurementTableViewLoad {

    func daysMeasurementTableViewLoad(vc: UIViewController, alertController: inout UIAlertController, measurementsTableView: inout UITableView) {

        let alertVC = UIViewController.init()
        let rect = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0)
        alertVC.preferredContentSize = rect.size

        measurementsTableView = UITableView(frame: rect)
        measurementsTableView.delegate = vc as? UITableViewDelegate
        measurementsTableView.dataSource = vc as? UITableViewDataSource
        measurementsTableView.tableFooterView = UIView(frame: .zero)
        measurementsTableView.separatorStyle = .singleLine
        measurementsTableView.separatorColor = .black
        measurementsTableView.isUserInteractionEnabled = true
        measurementsTableView.allowsSelection = true
        measurementsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "measurement")
        alertVC.view.addSubview(measurementsTableView)
        alertVC.view.bringSubviewToFront(measurementsTableView)
        alertVC.view.isUserInteractionEnabled = true
        
        let titleString = "Выберите дату для загрузки"
        alertController = UIAlertController(title: titleString, message: nil, preferredStyle: .alert)
        if #available(iOS 13.0, *) {
            alertController.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
        } else {
            // Fallback on earlier versions
        }
        alertController.setValue(NSAttributedString(string: alertController.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
        alertController.setValue(alertVC, forKey: "contentViewController")

        let cancelString = "ОТМЕНА"
        let cancelAction = UIAlertAction(title: cancelString, style: .cancel, handler: nil)
        cancelAction.setValue(UIColor.black, forKey: "titleTextColor")
        
        alertController.addAction(cancelAction)
        vc.present(alertController, animated: true, completion: nil)
    }
}
