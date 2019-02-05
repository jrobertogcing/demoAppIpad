//
//  AdminMenuViewController.swift
//  Consubanco
//
//  Created by Jose González on 2/4/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit

class AdminMenuViewController: UIViewController {

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
