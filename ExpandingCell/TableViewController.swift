//
//  ViewController.swift
//  ExpandingCell
//
//  Created by Justyna Kowalkowska on 12/01/2021.
//

import UIKit

struct cellData {
    var oppend = Bool()
    var title = String()
    var sectionData = [String]()
}

class TableViewController: UITableViewController {

    //MARK: - Properties
    
    private var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [cellData(oppend: false, title: "ExpandingCell1", sectionData: ["one", "two", "three"]),
        cellData(oppend: false, title: "ExpandingCell2", sectionData: ["one", "two", "three"])
        ]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].oppend == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].oppend == true {
            tableViewData[indexPath.section].oppend = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            tableViewData[indexPath.section].oppend = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }
}

