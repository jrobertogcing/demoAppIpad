//
//  UserMenuViewController.swift
//  Consubanco
//
//  Created by Jose González on 2/4/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit

class UserMenuViewController: UIViewController {

    
    var tab = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func agentaButtonAction(_ sender: UIButton) {
    
        selectTab(tab: 0)
        
    }
    
    @IBAction func activitiesButtonAction(_ sender: UIButton) {
        
        selectTab(tab: 1)

    }
    
    @IBAction func planningButtonAction(_ sender: UIButton) {
    
        selectTab(tab: 2)

    }
    
    @IBAction func portfolioButtonAction(_ sender: UIButton) {
        
        selectTab(tab: 3)

    }
    
    @IBAction func libraryButtonAction(_ sender: UIButton) {
    
        selectTab(tab: 4)

    }
    
    @IBAction func performanceButtonAction(_ sender: UIButton) {
        
        selectTab(tab: 5)

    }
    
    
    
    func selectTab(tab: Int)  {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let nextVC = storyboard.instantiateViewController(withIdentifier: "UserUITabBarController") as! UserUITabBarController
        
        nextVC.selectedIndex = tab
        
       // present(nextVC, animated: true, completion: nil)
        
       navigationController?.pushViewController(nextVC, animated: true)

        
    }
    
//MARK salir Button Action
    
    @IBAction func salirButtonAction(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    
    
   
}
