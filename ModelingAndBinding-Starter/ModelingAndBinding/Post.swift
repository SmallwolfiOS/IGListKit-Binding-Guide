//
//  Post.swift
//  ModelingAndBinding
//
//  Created by 马海平 on 2021/5/24.
//  Copyright © 2021 Ryan Nystrom. All rights reserved.
//

import Foundation
import IGListKit

final class Post : ListDiffable{
    let userName : String
    let timeStamp: String
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
    }// MARK: ListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
      // 1
      return (username + timestamp) as NSObjectProtocol
    }

    // 2
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
      return true
    }

    ————————————————
    原文作者：JsonXu_UH
    转自链接：https://learnku.com/articles/24068
    版权声明：著作权归作者所有。商业转载请联系作者获得授权，非商业转载请保留以上作者信息和原文链接。
}
