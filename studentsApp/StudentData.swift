//
//  StudentData.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/28/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//
//swiftlint:disable trailing_whitespace
//swiftlint:disable vertical_whitespace
//swiftlint:disable opening_brace
//swiftlint:disable trailing_whitespace
//swiftlint:disable tatement_position
import Foundation
import UIKit

class StudentData: NSObject, UITableViewDataSource{
    
    public var students: [Student] = []
    
    override init()
    {
        super.init()
        let path1 = Bundle.main.path(forResource: "names", ofType:"html" )
                guard let path = Bundle.main.path(forResource: "names", ofType:"html" ) else { return }
                var allStudentsString: String = ""
                do{
                    allStudentsString =  try String(contentsOfFile: path)
                }
                catch{ }
                    
                var splittedNames = allStudentsString.split(separator: ",")
                
                splittedNames.forEach { (name) in
                    var studentData = String(name)
                    var splittedStudentData = studentData.split(separator: ".")
        ////            var student: Student
        //           splittedStudentData.forEach{ (data) in
        //               student.name
        //           }
                    let name = String(splittedStudentData[0])
                    let surname = String(splittedStudentData[1])
                      var gender : Gender
                      switch splittedStudentData[2]
                      {
                      case "m":
                        gender = .male
                      case "f":
                        gender = .femail
                      default:
                        gender = .other
                    }
                     students.append(Student(name: name, surname: surname, gender: gender))
                }
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return self.students.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//            var studentCell: UITableViewCell
//
//         //   var student = Student(name: "")
//
//         //   student = students[indexPath.row]
//
//            switch students[indexPath.row].gender {
//
//            case .m:
//            studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
//
//            studentCell.textLabel?.text = students[indexPath.row].name + " " + students[indexPath.row].surname
//
//            case .f:
//                studentCell = tableView.dequeueReusableCell(withIdentifier: XIBTableViewCell.id, for: indexPath)
//                studentCell.textLabel?.text = students[indexPath.row].name + " " + students[indexPath.row].surname
//    //        case 2:
//    //        studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
//    //
//    //        case 3:
//    //        studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
//
//            default:
//                studentCell = tableView.dequeueReusableCell(withIdentifier: XIBTableViewCell.id, for: indexPath)
//                let st = students[indexPath.row]
//                studentCell.textLabel?.text = st.name + " " + st.surname
//            }
//            return studentCell
//        }
    
}

extension StudentData{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var studentCell: UITableViewCell
            
         //   var student = Student(name: "")
            
         //   student = students[indexPath.row]
            
            switch students[indexPath.row].gender {
                
            case .male:
            studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
            
            studentCell.textLabel?.text = students[indexPath.row].name + " " + students[indexPath.row].surname
            
            case .femail:
                studentCell = tableView.dequeueReusableCell(withIdentifier: XIBTableViewCell.id, for: indexPath)
                studentCell.textLabel?.text = students[indexPath.row].name + " " + students[indexPath.row].surname
    //        case 2:
    //        studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
    //
    //        case 3:
    //        studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
                
            default:
                studentCell = tableView.dequeueReusableCell(withIdentifier: XIBTableViewCell.id, for: indexPath)
                let st = students[indexPath.row]
                studentCell.textLabel?.text = st.name + " " + st.surname
            }
            return studentCell
        }
}
