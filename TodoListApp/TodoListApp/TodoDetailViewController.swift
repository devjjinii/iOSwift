//
//  TodoDetailViewController.swift
//  TodoListApp
//
//  Created by dev jin on 2022/02/15.
//

import UIKit
import CoreData

protocol TodoDetailViewControllerDelegate: AnyObject {
    func didFinishSaveData()
}

class TodoDetailViewController: UIViewController {
    
    weak var delegate: TodoDetailViewControllerDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!

    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var selectedTodoList: TodoList?
    
    var prioirty: PrioirtyLevel?
    
    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
    
    @IBAction func setPriority(_ sender: UIButton) {
        switch sender.tag {
        //low
        case 1:
            prioirty = .level1
        case 2:
            prioirty = .level2
        //high
        case 3:
            prioirty = .level3
            
        default:
            break
        }
        
        makePriorityButtonDesign()
    }
    
    func makePriorityButtonDesign() {
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear
        
        switch self.prioirty {
        //low
        case .level1:
            prioirty = .level1
            lowButton.backgroundColor = prioirty?.color
        
        case .level2:
            prioirty = .level2
            normalButton.backgroundColor = prioirty?.color
        //high
        case .level3:
            prioirty = .level3
            highButton.backgroundColor = prioirty?.color
            
        default:
            break
        }
    }
    
    @IBAction func saveTodo(_ sender: Any) {

        if selectedTodoList != nil {
                updateTodo()
        } else {
            saveTodo()
        }
        
        // delegate 호출
        delegate?.didFinishSaveData()
        // 화면 내림
        self.dismiss(animated: true, completion: nil)
    }
    
    // 저장
    func saveTodo() {
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else { return }
        
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? TodoList else { return }
       
        object.title = titleTextField.text
        // 저장하는 순간 날짜 저장
        object.date = Date()
        // 유니크 생성
        object.uuid = UUID()
        
        object.prioirtyLevel = prioirty?.rawValue ?? PrioirtyLevel.level1.rawValue
       
        let appDelegate = (UIApplication.shared.delegate as!
                       AppDelegate)
        appDelegate.saveContext()
    }
    
    // 수정
    func updateTodo() {
        
        guard let hasData = selectedTodoList else {
            return
        }
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        // 불러옴
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
    
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        do{
           let loadedData = try context.fetch(fetchRequest)
            
            loadedData.first?.title = titleTextField.text
            loadedData.first?.date = Date()
            loadedData.first?.prioirtyLevel = self.prioirty?.rawValue ?? PrioirtyLevel.level1.rawValue
           
            let appDelegate = (UIApplication.shared.delegate as!
                           AppDelegate)
            appDelegate.saveContext()
     
        } catch {
            print(error)
        }
    }
    
    // 삭제
    @IBAction func deleteTodo(_ sender: UIButton) {
        guard let hasData = selectedTodoList else {
            return
        }
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        // 불러옴
        let fetchRequest: NSFetchRequest<TodoList> = TodoList.fetchRequest()
    
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        do{
           let loadedData = try context.fetch(fetchRequest)
            
            if let loadFirstData = loadedData.first {
                //context 를 통해서 delete
                context.delete(loadFirstData)
                let appDelegate = (UIApplication.shared.delegate as!
                               AppDelegate)
                appDelegate.saveContext()
                
            }
           
        } catch {
            print(error)
        }
        
        delegate?.didFinishSaveData()
        // 화면 내림
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hasData = selectedTodoList{
            titleTextField.text = hasData.title
            
            // 우선순위
            prioirty = PrioirtyLevel(rawValue: hasData.prioirtyLevel)
            
            makePriorityButtonDesign()
            
            deleteButton.isHidden = false
            saveButton.setTitle("Update", for: .normal)
            
        } else {
            deleteButton.isHidden = true
            saveButton.setTitle("Save", for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = lowButton.bounds.height / 2
        highButton.layer.cornerRadius = lowButton.bounds.height / 2
    }

}
