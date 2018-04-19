//
//  firstpagecollection.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/18/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit

class firstpagecollection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet var safeArea: NSLayoutConstraint!
    
    var issidehidden = true
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea.constant = 600
    }
    
    
    @IBAction func buttonsidemenu(_ sender: UIButton) {
        if issidehidden{
            safeArea.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                
            })
        }else{
            safeArea.constant = 600
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        issidehidden = !issidehidden
        
        
    }
    

   
    
    
    var ImageArry = [UIImage(named:"street"),UIImage(named:"street"),UIImage(named:"street"),UIImage(named:"street")]

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ImageArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstpagecollectionviewcell", for: indexPath)as! firstpagecollectionviewcell
        cell.imgimage.image = ImageArry[indexPath.row]
        
        return cell
    }
    

   
}
