//
//  ProfileManager.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 3/9/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import Foundation

class ProfileManager {
    var counter = 0
    var profileType = 0
    static let shared = ProfileManager()
    private init()
    {
        
    }
    var login:String = ""
    var password:String = ""
}
