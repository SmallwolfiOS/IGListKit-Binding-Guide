//
//  UserCell.swift
//  ModelingAndBinding
//
//  Created by Ryan Nystrom on 8/18/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import IGListKit

final class UserCell: UICollectionViewCell, ListBindable {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? UserViewModel else {
            return
        }
        usernameLabel.text = model.username
        dateLabel.text = model.timestamp
    }
}
