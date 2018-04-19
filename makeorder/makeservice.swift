//
//  makeservice.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/17/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit

class makeservice: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let List = ["meky","Number","circle"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(List.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! makeservicecell
        
        cell.meky.text = List[indexPath.row]
        cell.number.text = List[indexPath.row]
        cell.circle.text = List[indexPath.row]
        return cell
    }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
