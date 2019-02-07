//
//  PortfolioViewController.swift
//  Consubanco
//
//  Created by Jose González on 2/5/19.
//  Copyright © 2019 Gonet. All rights reserved.
//

import UIKit
import PDFKit
import AVKit
import MediaPlayer

class PortfolioViewController: UIViewController {

    let pdfView = PDFView()
    var player: AVPlayer?

    var playerController = AVPlayerViewController()

    
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
        
    playVideo3()

    }
    
    //MARK: Remove PDFView
    @objc func buttonAction (sender: UIButton!) {
        
      //  self.view.removeFromSuperview()
        self.pdfView.removeFromSuperview()
    }
    
    //MARK: Play Video function
    
    //Prueba
    func playVideo () {
        
        guard let path = Bundle.main.path(forResource: "RegistroConsubanco", ofType:"mp4") else {
            debugPrint("video not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player

        present(playerController, animated: true) {
            player.play()
        }
        
    }
    
    // Prueba
    func playVideo2() {
       
        let videoURL = NSURL(string: "https://static.videokart.ir/clip/100/480.mp4")
        player = AVPlayer(url: videoURL! as URL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.addChild(playerController)
        
        // Add your view Frame
        playerController.view.frame = self.view.frame
        
        // Add subview in your view
        self.view.addSubview(playerController.view)
        
        player?.play()
        
        
    }
    
    //Funcionando
    func playVideo3()  {
        
        guard let path = Bundle.main.path(forResource: "RegistroConsubanco", ofType:"mp4") else {
            debugPrint("video not found")
            return
        }
        
        let videoURL = URL(fileURLWithPath: path)
        
        let player = AVPlayer(url: videoURL)
        let playerVC = AVPlayerViewController()
        playerVC.player = player
        
        self.present(playerVC, animated: true){
            
            playerVC.player?.play()
        }
        
        
        
    }
    
    //MARK: Back button action
    @IBAction func backButtonAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
}
