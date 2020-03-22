//
//  StudentStruct.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/18/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import Foundation
enum Gender {
    case male
    case femail
    case other
}
struct Student {
    var name : String
    var surname: String
    var gender: Gender
}
