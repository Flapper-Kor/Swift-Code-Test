//
//  ViewController.swift
//  TodoList
//
//  Created by 이희웅 on 2023/01/17.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem! // outlet 변수의 storage를 weak 가 아닌 Strong 으로 바꿔준다.
    var doneButton : UIBarButtonItem?
    
    var tasks = [Task](){
        didSet{
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tabDoneButton))
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
        // Do any additional setup after loading the view.
    }
    
    @objc func tabDoneButton(){
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }

    @IBAction func tabEditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else {return}
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tabAddButton(_ sender: UIBarButtonItem) {
/*
 STEP 1. 할일 등록 버튼을 누르면 할일을 입력 할 수 있는 입력 창(alert 창을 사용)을 만들고 그 얼럿 창에 버튼과 버튼을 눌렀을 때 수행할 함수까지 등록
 */
//        let alert = UIAlertController(title : "할일 등록", message: "할 일을 입력해주세요.", preferredStyle: .alert)
        let alert = UIAlertController(title : "할일 등록", message: nil, preferredStyle: .alert)
//        let alert = UIAlertController(title : "할일 등록", message: "할 일을 입력해주세요.", preferredStyle: .actionSheet)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler:{[weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            print(title)
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        self.present(alert, animated: true, completion: nil)
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 일을 입력해 주세요"
        })
    }
    /* STEP 1 End */
    
    /* STEP 2. 할일을 등록했다가 앱을 끄면 저장되고 앱을 켜면 저장된 데이터를 로드하도록 하는 기능을 구현한다.*/
    /// 사용자 데이터를 시스템에 저장
    func saveTasks(){
        let data = self.tasks.map {
            [
                "title" : $0.title,
                "done" : $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }

    func loadTasks(){
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String : Any]] else {return}
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else {return nil}
            guard let done = $0["done"] as? Bool else {return nil}
            return Task(title:title, done:done)
        }
    }
}


extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        if task.done{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
