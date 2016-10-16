//
//  ViewController.swift
//  XibInStoryboardExample
//
//  Created by Guillaume Laurent on 12/10/16.
//  Copyright © 2016 Guillaume Laurent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /**
     * Set a different view type for the next ViewController depending on the segue's name
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? MutatingViewController else { return }

        guard let segueIdentifier = segue.identifier else { return }

        switch segueIdentifier {
        case "view1":
            destinationViewController.viewType = .View1
        case "view2":
            destinationViewController.viewType = .View2
        default:
            NSLog("unknown segue identifier \(segueIdentifier)")

        }
    }
}

