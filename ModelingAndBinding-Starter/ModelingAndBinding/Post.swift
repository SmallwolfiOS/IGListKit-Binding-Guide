//
//  Post.swift
//  ModelingAndBinding
//
//  Created by 马海平 on 2021/5/24.
//  Copyright © 2021 Ryan Nystrom. All rights reserved.
//

import Foundation
import IGListKit

final class Post : ListDiffable {
    let username : String
    let timestamp: String
    let imageURL: URL
    let likes: Int
    let comments: [Comment]
    
    init(username: String, timestamp: String, imageURL: URL, likes: Int, comments: [Comment]) {
       self.username = username
       self.timestamp = timestamp
       self.imageURL = imageURL
       self.likes = likes
       self.comments = comments
     }
    // MARK: ListDiffable
    func diffIdentifier() -> NSObjectProtocol {
      // 1
      return (username + timestamp) as NSObjectProtocol
    }

    // 2
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      return true
    }

}
