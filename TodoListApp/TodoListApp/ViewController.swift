//
//  ViewController.swift
//  TodoListApp
//
//  Created by dev jin on 2022/02/14.
//

import UIKit
import CoreData

enum PrioirtyLevel: Int64 {
    case level1
    case level2
    case level3
}

extension PrioirtyLevel {
    var color: UIColor {
        switch self {
        case .level1:
            return .green
        case .level2:
            return .yellow
        case .level3:
            return .systemPink
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    // AppDelegate 접근
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var todoList = [TodoList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "To Do List"
        // 네비게이션
        self.makeNavigationBar()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        fetchData()
        todoTableView.reloadData()
    }
    
    // coreData -- 로컬스토리지
    func fetchData() {
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
        let context = appdelegate.persistentContainer.viewContext
        
        do{
            self.todoList = try context.fetch(fetchRequest)
            
        }catch {
            print(error)
        }
    }

    func makeNavigationBar() {
        
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(red: 30/255, green: 40/255, blue: 100/255, alpha: 0.3)
        self.navigationController?.navigationBar.standardAppearance = barAppearance
        // 추가
        self.navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
    }
    
    @objc func addNewTodo() {
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        // 델리게이트 연결
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        cell.topTitle.text = todoList[indexPath.row].title
       
        if let hasDate = todoList[indexPath.row].date {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd hh:mm:ss"
            let dateString = formatter.string(from: hasDate)
            cell.dateLabel.text = dateString
        } else {
            cell.dateLabel.text = ""
        }
      
        let priority = todoList[indexPath.row].prioirtyLevel
        
        let priorityColor = PrioirtyLevel(rawValue: priority)?.color
        
        cell.prioirtyView.backgroundColor = priorityColor
        cell.prioirtyView.layer.cornerRadius = cell.prioirtyView.bounds.height / 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        // 델리게이트 연결
        detailVC.delegate = self
        // 선택
        detailVC.selectedTodoList = todoList[indexPath.row]
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController: TodoDetailViewControllerDelegate {
    
    func didFinishSaveData() {
        self.fetchData()
        self.todoTableView.reloadData()
    }
}
