//
//  phototest.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/15/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit

class phototest: UIViewController {
    
    @IBOutlet weak var phototest: UICollectionView!
    
    fileprivate let cellIdentifer = "cellcollection"
    
    
  //  lazy var addButton: UIBarButtonItem = {
        
     //   let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
       // return button
        
    //}()
    var image = [UIImage]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //navigationItem.leftBarButtonItem = addButton
        image = Array.init(repeating: #imageLiteral(resourceName: "profile"), count: 3)
        view.backgroundColor  = .white
        phototest.backgroundColor = .clear
        
        phototest.alwaysBounceVertical = true
        
        phototest.register(UINib.init(nibName: cellIdentifer , bundle: nil), forCellWithReuseIdentifier: cellIdentifer)
        
        
        
        
        
        phototest.dataSource = self
        phototest.delegate = self
        
    }
    
    
    var picker_image: UIImage? {
        didSet {
            // sss
            guard let image = picker_image else { return }
            self.image.append(image)
            self.phototest.reloadData()
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
extension phototest: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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

extension phototest: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell  = phototest.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath) as? cellCollection else { return UICollectionViewCell() }
        
        cell.photocell.image = image[indexPath.row]
        
        return cell
    }
}
extension phototest: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screnwidth = UIScreen.main.bounds.width
        var width = (screnwidth-30)/2
        width =  width > 200 ? 200 : width
        return CGSize.init(width: width, height: width)
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
