//
//  XIBTableViewCell.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/18/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import UIKit

class XIBTableViewCell: UITableViewCell {
    
    static var id = "XIBcell"
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .red
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
