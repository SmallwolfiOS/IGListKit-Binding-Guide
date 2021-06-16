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
    @IBOutlet weak var foldBtn: UIButton!
    
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? Comment else {
            return
        }
        self.usernameLabel.text = model.username
        self.commentLabel.text = model.text
        self.commentLabel.backgroundColor = UIColor.yellow
        self.commentLabel.isUserInteractionEnabled = true
        
        if model.username == "@caitlin" {
            foldBtn.isHidden = false
        }else{
            foldBtn.isHidden = true
        }
        
        
        foldBtn .addTarget(self, action: #selector(tapActionForComment), for: .touchUpInside)
        
        
        
        
    }
    @objc func tapActionForComment() {
        guard let delegate = self.delegate else {
            return
        }
        delegate.tap()
    }
}
