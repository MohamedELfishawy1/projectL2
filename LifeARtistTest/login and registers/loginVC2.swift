//
//  checkbox2.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/11/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class loginVC2: UIViewController {

    @IBOutlet weak var usernameTf: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginpressed2(_ sender: UIButton) {
        guard let  username = usernameTf.text,!username .isEmpty else {return}
        guard let password = passwordTf.text,!password .isEmpty else {return}
        Apiservice2.login2(username: username, password: password) { (error:Error?, succes:Bool) in
            if succes{
                //bbb
            }else{
                //bbbbb
            }
        }
        
    }
    
   

    
        


    @IBAction func checkbox2(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
}



}
