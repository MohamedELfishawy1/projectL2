//
//  tableview.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/15/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import DropDown



class tableview: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var textTf: UITextField!
    @IBOutlet weak var text3Tf: UITextField!
    @IBOutlet weak var tableviewT: UITableView!
    @IBOutlet weak var errortf: UILabel!
    @IBOutlet weak var popuoAlet: UIVisualEffectView!
    
    
    var items = [String]()
    
    //Animation duration
    
    let aniDuration = 0.7
    
    @IBAction func donebutton(_ sender: Any) {
        
        if textTf.text?.isEmpty == true {
            errortf.alpha = 1.0
        } else {
            items.append(textTf.text!)
            
            
            UserDefaults.standard.set(items, forKey: "SavedData")
            tableviewT.reloadData()
            
            //Show the pop-up with animation
         animatePopup(alpha: 0.0)
            
            //Re-set the text field for next use
            textTf.text = ""
        }
    
    
        if text3Tf.text?.isEmpty == true {
            errortf.alpha = 1.0
        } else {
            items.append(text3Tf.text!)
            
            
            UserDefaults.standard.set(items, forKey: "SavedData")
            tableviewT.reloadData()
            
            //Show the pop-up with animation
            animatePopup(alpha: 0.0)
            
            //Re-set the text field for next use
            text3Tf.text = ""
            
        }
    }
    
    
    
   





    
    @IBAction func cancelbtn(_ sender: Any) {
        //Hide the pop-up with animation
        animatePopup(alpha: 0.0)
        textTf.text = ""
    }
    
    @IBAction func addbtn(_ sender: Any) {
        animatePopup(alpha: 1.0)
        
    }
    
    
    @IBOutlet weak var chosebutton: UIButton!
    
    let chooseDrobdown = DropDown()
    lazy var dropDowns: [DropDown] = {
        return [
            self.chooseDrobdown,
            ]
    }()
    
    @IBAction func add(_ sender: Any) {
        chooseDrobdown.show()
        
    }
    
    func setupDefaultDropDown() {
        DropDown.setupDefaultAppearance()
        
        
        func customizeDropDown(_ sender: AnyObject) {
            let appearance = DropDown.appearance()
            
            appearance.backgroundColor = UIColor(white: 1, alpha: 1)
            appearance.selectionBackgroundColor = UIColor(red: 0.6494, green: 0.8155, blue: 1.0, alpha: 0.2)
            //        appearance.separatorColor = UIColor(white: 0.7, alpha: 0.8)
            appearance.cornerRadius = 10
            appearance.shadowColor = UIColor(white: 0.6, alpha: 1)
            appearance.shadowOpacity = 0.9
            appearance.shadowRadius = 25
            appearance.animationduration = 0.25
            appearance.textColor = .darkGray
            //        appearance.textFont = UIFont(name: "Georgia", size: 14)
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewT.delegate = self
        tableviewT.dataSource = self
        //Check if there is any saved data
        if let data = UserDefaults.standard.value(forKey: "SavedData") as? [String] {
            
            //Yes, there is saved data and we are loading it to our array and then we reload the tableview to read again from the array after we updated its data
            items = data
    }
        setupDropDowns()
        dropDowns.forEach { $0.dismissMode = .onTap }
        dropDowns.forEach { $0.direction = .any }
        
        
    }

func setupDropDowns() {
    
    setupChooseDropDown()
}

func setupChooseDropDown() {
    chooseDrobdown.anchorView = chosebutton
    
    
    
    chooseDrobdown.bottomOffset = CGPoint(x: 0, y: chosebutton.bounds.height)
    chooseDrobdown.dataSource = [
        "Lorem ipsum dolor",
        "sit amet consectetur",
        "cadipisci en..."
    ]
    // Action triggered on selection
    chooseDrobdown.selectionAction = { [weak self] (index, item) in
        self?.chosebutton.setTitle(item, for: .normal)
    }
}








    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath)as! tableviewcell
        
        
        cell.name?.text = items[indexPath.row]
        cell.price.text = items[indexPath.row]
        cell.kind.text = items[indexPath.row]
        
        
        
        
        return cell
}

    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //Swipe to delete
        if editingStyle == .delete {
            //Remove that task from array
            self.items.remove(at: indexPath.row)
            UserDefaults.standard.set(items, forKey: "SavedData")
            UserDefaults.standard.synchronize()
            tableviewT.reloadData()
        }
    }

func animatePopup(alpha: CGFloat) {
    UIView.animate(withDuration: aniDuration) {
        self.popuoAlet.alpha = alpha
    }
}





















}
