//
//  LogInViewController.swift
//  Consubanco
//
//  Created by Jose González on 2/4/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.text = ""
        passwordTextField.text = ""
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true


    }
    
    @IBAction func logInbuttonAction(_ sender: UIButton) {
        
        // Verifica si los campos de texto usuario y password han sido capturados.
        
        guard let userName = userTextField.text,  userName != "" else {
        
            //Envia alerta de
            alertGeneral(errorDescrip: "Favor de ingresar su usuario", information: "Información")
            return
        }
        
        guard  let passwordText = passwordTextField.text, passwordText != "" else {
            
             alertGeneral(errorDescrip: "Favor de ingresar su password", information: "Información")
            
            return
        }
        
        let storyboard:  UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        
        if userName == "admin" && passwordText == "123" {
            
            let adminVC = storyboard.instantiateViewController(withIdentifier: "AdminTabBar")
            
            self.present(adminVC, animated:true, completion:nil)

            
        } else if userName == "user" && passwordText == "123"{
            
            
            let userVC = storyboard.instantiateViewController(withIdentifier: "UserTabBar")
            
            self.present(userVC, animated:true, completion:nil)
            
        }
        
    }
    
    // MARK: Alerts
    func alertGeneral(errorDescrip:String, information: String) {

        let alertGeneral = UIAlertController(title: information, message: errorDescrip, preferredStyle: .alert)
        
        let aceptAction = UIAlertAction(title: "OK", style: .default)
        
        alertGeneral.addAction(aceptAction)
        present(alertGeneral, animated: true)
        
        
    }
    
    
}
