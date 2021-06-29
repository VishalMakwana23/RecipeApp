//
//  ViewController.swift
//  Recipeapp
//
//  Created by DCS on 25/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    private let go:UIButton = {
        let button = UIButton()
        
        button.setTitle("Let's Try", for: .normal)
        button.addTarget(self, action: #selector(log), for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 3
        button.tintColor = UIColor.black
        button.layer.borderColor = UIColor(red: 80/255, green: 151/255, blue: 164/255, alpha: 1).cgColor
        
        button.setTitleColor(.red, for: .normal)
        //    button.leftAnchor(width: 0,height: 50)
        return button
    }()
    
    private let mylbl:UILabel = {
        let lbl = UILabel()
        lbl.text = "RECIPE FOR HAPPINESS"
        lbl.highlightedTextColor = .white
        lbl.font = .systemFont(ofSize:25)
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("run")
        self.title = "WELCOME"
        view.addSubview(go)
        view.addSubview(mylbl)
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "home.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("run")
        //            logo_img.frame = CGRect(x: 20, y: 350, width: view.width - 40, height: 200)
 
        go.frame = CGRect(x: 160, y: (view.width-40), width: 80, height: 80)
        mylbl.frame = CGRect(x: 10, y: go.bottom + 20, width: 400, height: 20)
    }
    
    @objc func log()
    {
        let lg = LoginVC()
        navigationController?.pushViewController(lg, animated: true)
    }
    
}
