//
//  CommentCell.swift
//  ModelingAndBinding
//
//  Created by Ryan Nystrom on 8/18/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import IGListKit

final class CommentCell: UICollectionViewCell, ListBindable {
   
    

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? Comment else {
            return
        }
        self.usernameLabel.text = model.username
        self.commentLabel.text = model.text
    }
}
