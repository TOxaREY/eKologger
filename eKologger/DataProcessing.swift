//
//  DataProcessing.swift
//  eKologger
//
//  Created by Alexey Golovanov on 26.10.2022.
//

import UIKit

class DataProcessing {
    
    func dataProcessing(vc: UIViewController) {
        DispatchQueue.main.async {
            let progress = Progress(totalUnitCount: Int64(iterCount))
            let alertView = UIAlertController(title: "", message: "", preferredStyle: .alert)
            alertView.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .darkGray
            let height:NSLayoutConstraint = NSLayoutConstraint(item: alertView.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: vc.view.frame.height * 0.1)
            let widthConstraints = alertView.view.constraints.filter({ return $0.firstAttribute == .width })
            alertView.view.removeConstraints(widthConstraints)
            let width:NSLayoutConstraint = NSLayoutConstraint(item: alertView.view!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: vc.view.frame.width * 0.7)
            alertView.view.addConstraint(height)
            alertView.view.addConstraint(width)
            vc.present(alertView, animated: false, completion: nil)
            
            
            let margin:CGFloat = 10.0
            let rect = CGRect(x: margin, y: vc.view.frame.height * 0.1 / 1.5, width: vc.view.frame.width * 0.7 - margin * 2.0 , height: 0)
            let progressView = UIProgressView(frame: rect)
            progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
            progressView.progressTintColor = .white
            progressView.trackTintColor = .black
            alertView.view.addSubview(progressView)
            
            let labelRect = CGRect(x: 0, y: vc.view.frame.height * 0.075 / 4, width: vc.view.frame.width * 0.7, height: 20)
            let label = UILabel(frame: labelRect)
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            label.textColor = .white
            let titleString = "ОБРАБОТКА ДАННЫХ"
            label.text = titleString
            alertView.view.addSubview(label)
            
            var progressCompletedUnitCount: Int64? {
                didSet {
                    progress.completedUnitCount = progressCompletedUnitCount!
                }
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
                progressCompletedUnitCount = Int64(processingCount)
                let progressFloat = Float(progress.fractionCompleted)
                progressView.setProgress(progressFloat, animated: true)
                guard progress.isFinished == false else {
                    timer.invalidate()
                    if !timer.isValid {
                        print("timerDataProcessingInvalidate")
                    }
                    alertView.dismiss(animated: false, completion: nil)
                    return
                }
            }
        }
    }
}

