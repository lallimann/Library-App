//
//  AllBooksTableViewCell.swift
//  LibraryApp
//
//  Created by Lalli Mann on 04/03/18.
//  Copyright © 2018 c0727815. All rights reserved.
//

import UIKit

class AllBooksTableViewCell: UITableViewCell {

    @IBOutlet weak var bookNameLable: UILabel!
    @IBOutlet weak var bookAuthorLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
