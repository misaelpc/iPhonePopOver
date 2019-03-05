//
//  ViewController.swift
//  PopOverDemo
//
//  Created by Misael Pérez Chamorro on 3/5/19.
//  Copyright © 2019 Misael Pérez Chamorro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var dimView: UIView?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let optionController = segue.destination
    optionController.popoverPresentationController?.delegate = self
    let anchor = CGRect(x: 0, y: view.frame.height - 400, width: 1, height: 1)
    optionController.popoverPresentationController!.sourceRect = anchor
    optionController.preferredContentSize = CGSize(width: view.frame.width, height: 200)
  }
  
  @IBAction func launchButtonWasTouchedUpInside(_ sender: Any) {
    performSegue(withIdentifier: "presentOption", sender: sender)
  }
}

extension ViewController: UIPopoverPresentationControllerDelegate {

  func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    return .none
  }
  
  func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
    dimView = UIView(frame: self.view.frame)
    dimView?.backgroundColor = UIColor.black
    dimView?.alpha = 0.3
    
    UIView.transition(with: self.view, duration: 0.3,
                      options: UIView.AnimationOptions.transitionCrossDissolve,
                      animations: { () -> Void in
                        self.view.addSubview(self.dimView!)
    }, completion: { (_) -> Void in
      
    })
  }
  
  func popoverPresentationControllerDidDismissPopover(_
    popoverPresentationController: UIPopoverPresentationController) {
    UIView.transition(with: self.view, duration: 0.2,
                      options: UIView.AnimationOptions.transitionCrossDissolve,
                      animations: { () -> Void in
                        self.dimView?.removeFromSuperview()
    }, completion: { (_) -> Void in
    })
  }

}


