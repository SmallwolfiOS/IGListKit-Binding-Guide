//
//  ActionCell.swift
//  ModelingAndBinding
//
//  Created by Ryan Nystrom on 8/18/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit
import IGListKit
protocol ActionCellDelegate: AnyObject {
  func didTapHeart(cell: ActionCell)
}

final class ActionCell: UICollectionViewCell, ListBindable {

    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    override func awakeFromNib() {
      super.awakeFromNib()
      likeButton.addTarget(self, action: #selector(ActionCell.onHeart), for: .touchUpInside)
    }
    
    weak var delegate: ActionCellDelegate? = nil
    
    func bindViewModel(_ viewModel: Any) {
        guard  let model = viewModel as? ActionViewModel else {
            return
        }
        likesLabel.text = "\(model.likes)"
    }
    
    
    @objc func onHeart() {
      delegate?.didTapHeart(cell: self)
    }
}
