//
//  LoginVC.swift
//  Recipeapp
//
//  Created by DCS on 28/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    private let userlogo_img : UIImageView = {
        let user = UIImageView()
        user.contentMode = .scaleAspectFit
        user.image = UIImage(named: "user")
        return user
    }()
  
    private let username: UITextField = {
        let usr = UITextField()
        usr.borderStyle = .roundedRect
        //text.backgroundColor = .systemFill
        usr.textAlignment = .center
        usr.textColor = .black
        usr.placeholder = "Enter Username"
        usr.layer.cornerRadius = 25
        usr.layer.borderColor = UIColor(red: 80/255, green: 151/255, blue: 164/255, alpha: 1).cgColor
        return usr
        
    } ()
    
    private let password: UITextField = {
        let psw = UITextField()
        psw.borderStyle = .roundedRect
        //text.backgroundColor = .systemFill
        psw.textAlignment = .center
        psw.textColor = .black
        psw.isSecureTextEntry = true
        psw.placeholder = "Enter Pasword"
        psw.layer.cornerRadius = 25
        psw.layer.borderColor = UIColor(red: 80/255, green: 151/255, blue: 164/255, alpha: 1).cgColor
        return psw
        
    } ()
    
    
    private let login:UIButton = {
        let button = UIButton()
        
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(home), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 80/255, green: 151/255, blue: 164/255, alpha: 1).cgColor
        //    button.leftAnchor(width: 0,height: 50)
        return button
    }()
    
    private let go:UIButton = {
        let button = UIButton()
        
        button.setTitle("Check Menus", for: .normal)
        button.addTarget(self, action: #selector(home), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 80/255, green: 151/255, blue: 164/255, alpha: 1).cgColor
        //    button.leftAnchor(width: 0,height: 50)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("run")
        self.title = "Login"
        view.addSubview(userlogo_img)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(login)
        view.addSubview(go)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "login2.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("run")
        userlogo_img.frame = CGRect(x: 40, y: 220, width: view.width - 80, height: 80)
        username.frame = CGRect(x: 20, y: userlogo_img.bottom + 40, width: view.width - 40, height: 50)
        password.frame = CGRect(x: 20, y: username.bottom + 20, width: (view.width-40), height: 50)
        login.frame = CGRect(x: 20, y: password.bottom + 20, width: (view.width-40), height: 50)
        go.frame = CGRect(x: 20, y: login.bottom + 120, width: (view.width-40), height: 50)
    }
    
    @objc func home()
    {
        let hm = homeVC()
        navigationController?.pushViewController(hm, animated: true)
    }
}
