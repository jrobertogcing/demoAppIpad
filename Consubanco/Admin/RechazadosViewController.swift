//
//  RechazadosViewController.swift
//  Consubanco
//
//  Created by Jose González on 2/5/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit

class RechazadosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func salirButtonAction(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    

}
