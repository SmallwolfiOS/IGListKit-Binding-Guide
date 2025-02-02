//
//  PostSectionController.swift
//  ModelingAndBinding
//
//  Created by 马海平 on 2021/5/25.
//  Copyright © 2021 Ryan Nystrom. All rights reserved.
//

import Foundation
import IGListKit

final class PostSectionController : ListBindingSectionController<Post>,ListBindingSectionControllerDataSource,ActionCellDelegate{
    var localLikes: Int? = nil
    var expen: Bool = true
    override init() {
        super.init()
        dataSource = self
        expen = true
    }
    
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let object = object as? Post else{fatalError()}
        let result : [ListDiffable] = [UserViewModel(username: object.username, timestamp: object.timestamp),
                                       ImageViewModel(url: object.imageURL),
                                       ActionViewModel(likes: localLikes ?? object.likes)
                                       
        ]
        var data = result + object.comments
        if self.expen {
            return data
        }else {
            data.remove(at: data.count - 2)
            return data
        }
        
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        let identifier: String
        switch viewModel {
        case is ImageViewModel:
            identifier = "image"
        case is Comment:
            identifier = "comment"
        case is UserViewModel:
            identifier = "user"
        default:
            identifier = "action"
        }
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: identifier, for: self, at: index) else {
            fatalError()
        }
        if let cell = cell as? ActionCell {
            cell.delegate = self
        }
        
        if let cell = cell as? CommentCell {
            cell.delegate = self
        }
        
        return cell as! (UICollectionViewCell & ListBindable)
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else {
            fatalError()
        }
        let height : CGFloat
        switch viewModel {
        case is ImageViewModel: height = 250
        case is Comment: height = 100
        default:
            height = 35
        }
        
        print("width:\(width)  height:\(height)  cellClass: \(viewModel.self)" )
        return CGSize(width: width, height: height)
    }
    func didTapHeart(cell: ActionCell) {
      print("like")
        // 1
          localLikes = (localLikes ?? object?.likes ?? 0) + 1
          // 2
          update(animated: true)
    }
    
    
    
}
extension PostSectionController: TapActionProtocol{
    func tap() {
        self.expen = !self.expen
        update(animated: true, completion: nil)
    }
}

