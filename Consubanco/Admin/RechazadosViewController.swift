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
        
        let storyboar = UIStoryboard.init(name: "Main", bundle: nil)
        
        let logInVC = storyboar.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        
        present(logInVC, animated: true, completion: nil)
    }
    

}
