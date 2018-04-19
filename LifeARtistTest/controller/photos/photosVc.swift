//
//  photosVc.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/14/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit

class photosVc: UIViewController {
    fileprivate let cellIdentifer = "photoscell"
    
    
    @IBOutlet weak var colllectionview: UICollectionView!
    
    lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        return button
        
    }()
    var image = [UIImage]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = addButton
        image = Array.init(repeating: #imageLiteral(resourceName: "profile"), count: 5)
        view.backgroundColor  = .white
        colllectionview.backgroundColor = .clear
        colllectionview.alwaysBounceHorizontal = true
        
        colllectionview.register(UINib.init(nibName: cellIdentifer, bundle: nil), forCellWithReuseIdentifier: cellIdentifer)
        
        
        
        
        
        colllectionview.dataSource = self
        colllectionview.delegate = self
    }
        
    var picker_image: UIImage? {
        didSet {
            // sss
            guard let image = picker_image else { return }
            self.image.append(image)
            self.colllectionview.reloadData()
        }
    
    }
    
    @objc private func handleAdd () {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
        
        
        
    }
    

 
}
extension photosVc: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editimage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.picker_image = editimage
        }else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.picker_image = originalImage

}
        picker.dismiss(animated: true, completion: nil)
    }
}




extension photosVc: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell  = colllectionview.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath) as? photoscell else { return UICollectionViewCell() }
        
        cell.IV.image = image[indexPath.row]
        
        return cell
    }
}
extension photosVc: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screnwidth = UIScreen.main.bounds.width
        var width = (screnwidth-30)/2
        width =  width > 200 ? 200 : width
        return CGSize.init(width: width, height: width)
    }
}

    
        
            
   
        
        
    
        

    

