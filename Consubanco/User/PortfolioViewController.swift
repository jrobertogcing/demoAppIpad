//
//  PortfolioViewController.swift
//  Consubanco
//
//  Created by Jose González on 2/5/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit
import PDFKit


class PortfolioViewController: UIViewController {

    let pdfView = PDFView()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: PDF
    
    @IBAction func PDFButtonAction(_ sender: UIButton) {
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        
        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

       // View size to set the exit button.
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width - 60
       // let screenHeight = screenSize.height - 200
        
        // exit button programmatically
        let button = UIButton(frame: CGRect(x: screenWidth, y: 10, width: 40, height: 40))
        let imageButton = UIImage(named: "rechazados.png")
        button.setImage(imageButton, for: .normal)
    
        // Set action for button
        button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
        
        //Set button in view
        pdfView.addSubview(button)
        
        //Path for pdf File
        guard let path = Bundle.main.url(forResource: "informeCSB", withExtension: "pdf") else { return }

        //PdfView documen configuration.
        if let document = PDFDocument(url: path) {
            pdfView.document = document
            //pdfView.autoScales = true
            //pdfView.canGoBack()
            pdfView.backgroundColor = UIColor.gray
            //pdfView.currentPage
            //pdfView.displaysAsBook = true
        }
        
       
    }
    
    //MARK: PDF second option
    
    @IBAction func pdfWebViewButtonAction(_ sender: UIButton) {
        
        
    }
    
    @objc func buttonAction (sender: UIButton!) {
        
      //  self.view.removeFromSuperview()
        self.pdfView.removeFromSuperview()
    }
    
    
    //MARK: Back button action
    @IBAction func backButtonAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let UserMenuVC = storyboard.instantiateViewController(withIdentifier: "UserMenuViewController") as! UserMenuViewController
        
        present(UserMenuVC, animated: true, completion: nil)
        
    }
    
}
