//
//  Comment.swift
//  ModelingAndBinding
//
//  Created by 马海平 on 2021/5/24.
//  Copyright © 2021 Ryan Nystrom. All rights reserved.
//

import Foundation
import IGListKit

final class Comment : ListDiffable{
    let username: String
        let text: String
    
    init(username: String ,text:String) {
        self.username = username
        self.text = text
    }
    // MARK: ListDiffable
        func diffIdentifier() -> NSObjectProtocol {
            return (username + text) as NSObjectProtocol
        }

        func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
            return true
        }

}
