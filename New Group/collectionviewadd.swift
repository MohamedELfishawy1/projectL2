//
//  collectionviewadd.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/17/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit

class collectionviewadd: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    
    
    
    var imageArray = [UIImage(named:"profile"),UIImage(named:"profile"),UIImage(named:"profile"),UIImage(named:"profile"),]

    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        // Do any additional setup after loading the view.
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
    
    
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Imagecollectionviewcell", for: indexPath)as! Imagecollectionviewcell
        cell.Imgimage.image = imageArray[indexPath.row]
        return cell
        
    }
    

}
