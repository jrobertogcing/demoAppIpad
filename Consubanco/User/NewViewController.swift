//
//  NuevoViewController.swift
//  Consubanco
//
//  Created by Jose González on 2/5/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
