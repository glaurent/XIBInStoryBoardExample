//
//  BaseViewController.swift
//  XibInStoryboardExample
//
//  Created by Guillaume Laurent on 13/10/16.
//  Copyright © 2016 Guillaume Laurent. All rights reserved.
//

import UIKit

/**
 * Base ViewController from which you can derive a ViewController that will load a custom UIView from a NIB
 */
class BaseViewController: UIViewController {

    @IBOutlet weak var placeholderView: UIView!

    override var nibName: String? { return "BaseViewController" }

    var mutableViewNibName:String? { get { return nil } }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if let mutableViewNibName = mutableViewNibName {

            let mutableView = Bundle.main.loadNibNamed(mutableViewNibName, owner: self, options: nil)?[0] as! UIView

            placeholderView.addSubview(mutableView)

            mutableView.frame = placeholderView.bounds
            placeholderView.addSubview(mutableView)

            // add constraints to glue the mutableView to the placeholder
            //
            mutableView.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor).isActive = true
            mutableView.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor).isActive = true
            mutableView.topAnchor.constraint(equalTo: placeholderView.topAnchor).isActive = true
            mutableView.bottomAnchor.constraint(equalTo: placeholderView.bottomAnchor).isActive = true
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
