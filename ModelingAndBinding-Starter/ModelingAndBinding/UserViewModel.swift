//
//  UserViewModel.swift
//  ModelingAndBinding
//
//  Created by 马海平 on 2021/5/25.
//  Copyright © 2021 Ryan Nystrom. All rights reserved.
//

import Foundation
import IGListKit

final class UserViewModel:ListDiffable{
    var username : String
    let timestamp:String
    init(username:String, timestamp:String) {
        self.username = username
        self.timestamp = timestamp
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return "user" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? UserViewModel else {
            return false
        }
        return username == object.username && timestamp == object.timestamp
    }
}
