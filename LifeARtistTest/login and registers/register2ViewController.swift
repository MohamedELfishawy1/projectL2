//
//  register2ViewController.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/11/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class register2ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
   
    @IBOutlet weak var imageprovider: UIImageView!
    
    
    @IBAction func importphoto(_ sender: Any) {
        let imagepickercontrller = UIImagePickerController()
        imagepickercontrller.delegate = self
        
        let actionsheet = UIAlertController(title:"photo source" , message: "chosse a source" , preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagepickercontrller.sourceType = .camera
                self.present(imagepickercontrller, animated: true, completion: nil)
                
            }else{
                print("camera not availble")
            }
            
        }))
         actionsheet.addAction(UIAlertAction(title: "photo Libarary", style: .default, handler: { (action:UIAlertAction) in
            imagepickercontrller.sourceType = .photoLibrary
            self.present(imagepickercontrller, animated: true, completion: nil)
        }))
        actionsheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        self.present(actionsheet, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageprovider.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
        
            
            
        
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    @IBOutlet weak var fullnameTf: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var namecompanyTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var listproviderTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerpressed1(_ sender: UIButton) {
        guard let  fullname = fullnameTf.text?.trimmed, !fullname.isEmpty, let username = usernameTF.text?.trimmed,!username.isEmpty, let email = emailTF.text?.trimmed,!email.isEmpty, let password = passwordTf.text, !password.isEmpty,let Number = numberTF.text?.trimmed, !Number.isEmpty, let namecompany = namecompanyTF.text?.trimmed, !namecompany.isEmpty, let listprovider = listproviderTf.text?.trimmed, !listprovider.isEmpty  else { return }
        Apiservice2.register2(fullname: fullname, username: username, email: email, password: password, Number: Number, namecompnay: namecompany, listprovider: listprovider) { (error:Error?, succes:Bool) in
            if succes{
                ///
            }else{
                //////
            }
        }
        
        
        
     
    
 
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func placeproviders(_ sender: UIButton) {
    }
    
}
