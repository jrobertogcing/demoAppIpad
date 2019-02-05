//
//  LogInViewController.swift
//  Consubanco
//
//  Created by Jose González on 2/4/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.text = ""
        passwordTextField.text = ""
        
        userTextField.delegate = self
        passwordTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: Keyboard activity
    
    // Activate return button in keyboard
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true


    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true

    }
    
    // Move up scrollView when keyboard appear
    func textFieldDidBeginEditing(_ textField: UITextField) {
     
        logInScrollView.setContentOffset(CGPoint(x: 0, y: 180), animated: true)

        
    }
    
    // Move down scrollView when keyboard dissappear

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        logInScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)

    }
    
    //MARK: LogInButton Action
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
            
            
            let userVC = storyboard.instantiateViewController(withIdentifier: "UserMenuViewController") as! UserMenuViewController
            
            self.present(userVC, animated:true, completion:nil)
            
        } else {
            
            alertGeneral(errorDescrip: "Datos incorrectos", information: "Información")
            
            
        }
        
    }
    
    //MARK: Info button Action
    @IBAction func infoButtonAction(_ sender: UIButton) {
        
        alertGeneral(errorDescrip: "user - password :123, admin- password: 123", information: "Acceso")
        
        
    }
    
    
    // MARK: Alerts
    func alertGeneral(errorDescrip:String, information: String) {

        let alertGeneral = UIAlertController(title: information, message: errorDescrip, preferredStyle: .alert)
        
        let aceptAction = UIAlertAction(title: "OK", style: .default)
        
        alertGeneral.addAction(aceptAction)
        present(alertGeneral, animated: true)
        
        
    }
    
    
}
