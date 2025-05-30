//
//  HomeVC.swift
//  ExpandCollapse
//
//  Created by Nirzar Gandhi on 28/05/25.
//

import UIKit

class HomeVC: BaseVC {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    
    // MARK: - Properties
    fileprivate lazy var arrItems = ["Antigua and Barbuda",
                                     "Bosnia and Herzegovina",
                                     "India",
                                     "USA",
                                     "India",
                                     "Congo",
                                     "UK Grenadines",
                                     "Congo (Congo-Brazzaville)",
                                     "China",
                                     "Sri-Lanka 1",
                                     "Sri-Lanka",
                                     "Democratic Republic of the Congo Democratic Republic of the Congo",
                                     "Israel and",
                                     "Saint Vincent and the Grenadines",
                                     "Namibia",
                                     "Saint Vincent and the Grenadines",
                                     "Oman Grenadines",
                                     "Oman",
                                     "Namibia"]
    
    fileprivate lazy var selectedIndex = -1
    
    
    // MARK: -
    // MARK: - View init Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        
        self.setControlsProperty()
        self.setTableData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
    }
    
    fileprivate func setControlsProperty() {
        
        self.view.backgroundColor = .white
        self.view.isOpaque = false
        
        // Tableview
        self.tableview.backgroundColor = .clear
        
        self.tableview.tag = 0
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        self.tableview.separatorStyle = .none
        self.tableview.showsVerticalScrollIndicator = false
        self.tableview.rowHeight = UITableView.automaticDimension
        
        self.tableview.tableFooterView = UIView().addTableFooter(height: getBottomSafeAreaHeight() + 10.0)
        self.tableview.tableFooterView?.backgroundColor = .clear
        
        // No Data Label
        self.noDataLabel.backgroundColor = .clear
        self.noDataLabel.textColor = .white
        self.noDataLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.noDataLabel.numberOfLines = 2
        self.noDataLabel.lineBreakMode = .byTruncatingTail
        self.noDataLabel.textAlignment = .left
        self.noDataLabel.text = "No data available"
        self.noDataLabel.isHidden = true
    }
}


// MARK: - Call back
extension HomeVC {
    
    fileprivate func setTableData() {
        
        if self.arrItems.count > 0 {
            self.tableview.isHidden = false
            self.noDataLabel.isHidden = true
        } else {
            self.tableview.isHidden = true
            self.noDataLabel.isHidden = false
        }
        
        self.tableview.reloadData()
    }
}



// MARK: - Button Touch & Action
extension HomeVC {
    
    @objc fileprivate func expandCollapseBtnTouch(_ sender: UIButton) {
        
        if self.selectedIndex == sender.tag {
            self.selectedIndex = -1
        } else {
            self.selectedIndex = sender.tag
        }
        
        self.tableview.reloadData()
    }
}


// MARK: -
// MARK: - UITableView DataSource
extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: ExpandCollapseCell.className) as? ExpandCollapseCell
        if cell == nil {
            let nib = Bundle.main.loadNibNamed(ExpandCollapseCell.className, owner: self, options: nil)
            cell = nib![0] as? ExpandCollapseCell
        }
        
        let isExpand = (selectedIndex > -1 && selectedIndex == indexPath.row) ? true : false
        cell?.configureCell(item: self.arrItems[indexPath.row], isExpanded: isExpand)
        
        cell?.expandCollapseBtn.tag = indexPath.row
        cell?.expandCollapseBtn.addTarget(self, action: #selector(expandCollapseBtnTouch(_:)), for: .touchUpInside)
        
        return cell!
    }
    
    // MARK: - UITableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}
