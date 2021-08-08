//
//  CustomCell.swift
//  UITableView-Practice
//
//  Created by 大西玲音 on 2021/08/08.
//

import UIKit

final class CustomCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
    
    func configure(name: String) {
        nameLabel.text = name
    }
    
}
