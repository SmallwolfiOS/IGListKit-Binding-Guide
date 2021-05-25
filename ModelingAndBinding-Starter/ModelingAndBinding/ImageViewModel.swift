//
//  ImageViewModel.swift
//  ModelingAndBinding
//
//  Created by 马海平 on 2021/5/25.
//  Copyright © 2021 Ryan Nystrom. All rights reserved.
//

import Foundation
import IGListKit

final class ImageViewModel : ListDiffable{
    let url : URL
    init(url:URL) {
        self.url = url
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return "image" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ImageViewModel else {
            return false
        }
        return url ==  object.url
    }
    
    
    
}
final class ActionViewModel: ListDiffable {
    let likes: Int

    init(likes: Int) {
        self.likes = likes
    }

    // MARK: ListDiffable

    func diffIdentifier() -> NSObjectProtocol {
        return "action" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ActionViewModel else { return false }
        return likes == object.likes
    }
}
