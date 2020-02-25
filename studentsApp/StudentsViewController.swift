//
//  StudentsViewController.swift
//  studentsApp
//
//  Created by Andrei Apekunou on 2/18/20.
//  Copyright © 2020 Andrei Apekunou. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var students: [Student] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var studentCell: UITableViewCell
        
     //   var student = Student(name: "")
        
     //   student = students[indexPath.row]
        
        switch students[indexPath.row].gender {
            
        case "m":
        studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
        
        studentCell.textLabel?.text = students[indexPath.row].name + " " + students[indexPath.row].surname
        
        case "f":
            studentCell = tableView.dequeueReusableCell(withIdentifier: XIBTableViewCell.id, for: indexPath)
            studentCell.textLabel?.text = students[indexPath.row].name + " " + students[indexPath.row].surname
//        case 2:
//        studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
//
//        case 3:
//        studentCell = tableView.dequeueReusableCell(withIdentifier: CodeTableViewCell.id, for: indexPath)
            
        default:
            studentCell = tableView.dequeueReusableCell(withIdentifier: XIBTableViewCell.id, for: indexPath)
            studentCell.textLabel?.text = students[indexPath.row].name + " " + students[indexPath.row].surname
        }
        return studentCell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   if let vc = storyboard?.instantiateViewController(identifier:"MyProfileViewController") as? MyProfileViewController {
    //        vc.selectedProfile = [arrayProfile[indexPath.row]]
    //        navigationController?.pushViewController(vc,animated: true)
    //    }
      
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //tableView.reloadData()
        }
//        if editingStyle == .insert {
//
//        }
    }

    //MARK: ViewDIDLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        students = prepareArray()
        tableView.register(CodeTableViewCell.self, forCellReuseIdentifier: CodeTableViewCell.id)
        tableView.register(UINib(nibName: "XIBTableViewCell", bundle: nil), forCellReuseIdentifier: XIBTableViewCell.id)
    }
    
    func prepareArray() -> [Student] {
        var array: [Student] = []
     //   let firstStudent = Student(name:"FirstOne")
    //    array.append(firstStudent)
        let path1 = Bundle.main.path(forResource: "names", ofType:"html" )
        guard let path = Bundle.main.path(forResource: "names", ofType:"html" ) else {return array }
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
              var name = String(splittedStudentData[0])
              var surname = String(splittedStudentData[1])
              var gender = String(splittedStudentData[2])
             array.append(Student(name: name, surname: surname, gender: gender))
        }
        
        return array
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
