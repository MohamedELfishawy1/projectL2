//
//  tableviewcell.swift
//  LifeARtistTest
//
//  Created by Mohamed ELfishawy on 4/15/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit

class tableviewcell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var kind: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
