//
//  ResetAllSmartAlert.swift
//  eKologger
//
//  Created by Alexey Golovanov on 28.10.2022.
//

import UIKit

class ResetAllSmartAlert {
    
    func resetAllSmartAlert(vc: UIViewController, viewModel: ViewModel) {
        var messageFont: [NSAttributedString.Key : NSObject]

            messageFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor: UIColor.white]
        let messageString = "Все данные прибора будут удалены в смартфоне"
        let messageAttrString = NSMutableAttributedString(string: messageString, attributes: messageFont)
        let titleString = "ВНИМАНИЕ"
        let dialogWindow = UIAlertController(title: titleString, message: "", preferredStyle: .alert)
        dialogWindow.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .darkGray
        dialogWindow.setValue(messageAttrString, forKey: "attributedMessage")
        dialogWindow.setValue(NSAttributedString(string: dialogWindow.title!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold), NSAttributedString.Key.foregroundColor : UIColor.white]), forKey: "attributedTitle")

        let ok = UIAlertAction(title: "OK", style: .default) { action in
            viewModel.bluetoothManager.deleteDataFromDB.deleteDataFromDB(db: viewModel.bluetoothManager.sqliteDB)
        }
        ok.setValue(UIColor.white, forKey: "titleTextColor")
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        cancel.setValue(UIColor.white, forKey: "titleTextColor")
        dialogWindow.addAction(ok)
        dialogWindow.addAction(cancel)
        vc.present(dialogWindow, animated: false, completion: nil)
    }
}
