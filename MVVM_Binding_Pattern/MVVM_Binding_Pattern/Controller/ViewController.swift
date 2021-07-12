//
//  ViewController.swift
//  MVVM_Binding_Pattern
//
//  Created by 전상민 on 2021/07/09.
//

import UIKit

// MVVM Design Pattern 구성 >
// 1. Obserable(DataBinding)
// 2. Model
// 3. View(ViewController)
// 4. ViewModel

class ViewController: UIViewController, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        
        // data binding
        viewModel.users.bind { [weak self]_ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        fetchData()
    }
    
    func fetchData(){
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/users") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data,error,responds) in
            guard let data = data else { return }
            do{
                let userModels = try JSONDecoder().decode([User].self, from: data)
                self.viewModel.users.value = userModels.compactMap({
                    UserTableViewCellModel(name: $0.name)
                })
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
}

extension ViewController: UITableViewDataSource, UITabBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! userTableViewCell
        cell.userLabel.text = viewModel.users.value?[indexPath.row].name
        return cell
    }
}
