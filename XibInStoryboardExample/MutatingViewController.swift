//
//  MutatingViewController.swift
//  XibInStoryboardExample
//
//  Created by Guillaume Laurent on 12/10/16.
//  Copyright © 2016 Guillaume Laurent. All rights reserved.
//

import UIKit

enum ViewType {
    case View1
    case View2
}

/**
 * This ViewController dynamically loads a different view in its placeholder, depending
 * on the value of its viewType property
 */
class MutatingViewController: UIViewController {

    @IBOutlet weak var placeholderView: UIView!

    var viewType:ViewType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if let viewType = viewType {

            let saveFrame = placeholderView.frame
            let mutableView:UIView

            switch viewType {
            case .View1:
                mutableView = Bundle.main.loadNibNamed("CustomView1", owner: self, options: nil)?[0] as! UIView
            case .View2:
                mutableView = Bundle.main.loadNibNamed("CustomView2", owner: self, options: nil)?[0] as! UIView
            }

            // put the loaded view in its placeholder
            //
            mutableView.frame = saveFrame
            placeholderView.addSubview(mutableView)

            // add constraints
            //
            mutableView.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor).isActive = true
            mutableView.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor).isActive = true
            mutableView.topAnchor.constraint(equalTo: placeholderView.topAnchor).isActive = true
            mutableView.bottomAnchor.constraint(equalTo: placeholderView.bottomAnchor).isActive = true

        } else {
            NSLog("viewStyle not set")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
