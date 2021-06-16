//
//  CommentCell.swift
//  ModelingAndBinding
//
//  Created by Ryan Nystrom on 8/18/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import IGListKit


protocol TapActionProtocol {
    func tap()
}

final class CommentCell: UICollectionViewCell, ListBindable {
   
    
    public var delegate: TapActionProtocol?
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? Comment else {
            return
        }
        self.usernameLabel.text = model.username
        self.commentLabel.text = model.text
        self.commentLabel.backgroundColor = UIColor.yellow
        self.commentLabel.isUserInteractionEnabled = true
        self.commentLabel.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapActionForComment)))
    }
    @objc func tapActionForComment() {
        guard let delegate = self.delegate else {
            return
        }
        delegate.tap()
    }
}
