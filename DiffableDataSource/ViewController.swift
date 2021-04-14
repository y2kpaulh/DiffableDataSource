//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by Inpyo Hong on 2021/03/31.
//

import UIKit

class ViewController: UIViewController {

    let arrItems = [EmpModel(id: "1", name: "Tushar"), EmpModel(id: "2", name: "Anshul"), EmpModel(id: "3", name: "Ayush"), EmpModel(id: "4", name: "Prajakta")]
    
    @IBOutlet weak var tblShow: UITableView!
    
    var dataSource: UITableViewDiffableDataSource<Section, EmpModel>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<Section, EmpModel>! = nil
    let identifer = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblShow.register(UITableViewCell.self, forCellReuseIdentifier: identifer)
        
        configureDataSource()
        updateUI()
    }

    func configureDataSource() {
        self.dataSource = UITableViewDiffableDataSource<Section, EmpModel>(tableView: tblShow) { [weak self] (tableView: UITableView, indexPath: IndexPath, item: EmpModel) -> UITableViewCell? in
                    
            let cell = tableView.dequeueReusableCell(
                        withIdentifier: self!.identifer,
                        for: indexPath)
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = item.id
                        
            return cell
        }
        
      //self.dataSource.defaultRowAnimation = .fade
    }
    
    func updateUI(animated: Bool = true) {
        currentSnapshot = NSDiffableDataSourceSnapshot<Section, EmpModel>()
        currentSnapshot.appendSections([.main])
        currentSnapshot.appendItems(arrItems, toSection: .main)
        
        self.dataSource.apply(currentSnapshot, animatingDifferences: animated)
    }
}

