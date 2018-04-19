//
//  providerservice.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/17/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class providerservice: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    
    
    @IBOutlet var p: UIImageView!
    
    
    
    
    
    
    
    
    @IBAction func addbutton(_ sender: Any) {
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
        p.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    

    var imageArray = [UIImage(named:"profile"),UIImage(named:"profile"),UIImage(named:"profile"),UIImage(named:"profile"),UIImage(named:"profile"),UIImage(named:"profile"),UIImage(named:"profile")]
    

    
      
    @IBOutlet var safeArea3: NSLayoutConstraint!
    var issidehidden3 = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea3.constant = 600

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sidemenubutton1(_ sender: UIButton) {
        if issidehidden3{
            safeArea3.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                
            })
       // }else{
         //   safeArea3.constant = 600
           // UIView.animate(withDuration: 0.3, animations: {
               // self.view.layoutIfNeeded()
            //})
            
        }
        issidehidden3 = !issidehidden3
        
        
    }

    @IBAction func cancelbutton(_ sender: UIButton) {
        if issidehidden3{
            safeArea3.constant = 600
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()            })
            
        }else{
            safeArea3.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        issidehidden3 = !issidehidden3
        
    }
    
    

    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
}
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageArray.count
}
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "providerservicecell", for: indexPath)as! providerservicecell
        cell.imgimage.image = imageArray[indexPath.row]
        return cell


}
   
}

