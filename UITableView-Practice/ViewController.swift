//
//  ViewController.swift
//  UITableView-Practice
//
//  Created by 大西玲音 on 2021/08/08.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var editButton: UIBarButtonItem!
    
    private var names = ["Aさん", "Bさん", "Cさん"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.nib,
                           forCellReuseIdentifier: CustomCell.identifier)
        tableView.tableFooterView = UIView()
    }
    
    @IBAction private func addButtonDidTapped(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "アイテムを追加", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "追加", style: .default) { _ in
            self.names.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { alertTextField in
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func editButtonDidTapped(_ sender: Any) {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
            editButton.title = "Edit"
            // save
        } else {
            tableView.setEditing(true, animated: true)
            editButton.title = "Done"
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier) as! CustomCell
        let name = names[indexPath.row]
        cell.configure(name: name)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   moveRowAt sourceIndexPath: IndexPath,
                   to destinationIndexPath: IndexPath) {
        let name = names[sourceIndexPath.row]
        names.remove(at: sourceIndexPath.row)
        names.insert(name, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView,
                   canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView,
                   canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
