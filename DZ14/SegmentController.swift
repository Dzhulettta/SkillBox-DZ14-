//
//  SegmentController.swift
//  DZ14
//
//  Created by Юлия Чужинова on 09.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class SegmentController: UIViewController {
    
   
    @IBAction func segmentAction(_ sender: Any) {
    
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            performSegue(withIdentifier: "show1", sender: nil)
        case 1:
            performSegue(withIdentifier: "show2", sender: nil)
        case 2:
            performSegue(withIdentifier: "show3", sender: nil)
        default:
            performSegue(withIdentifier: "show4", sender: nil)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
