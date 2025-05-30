//
//  ExpandCollapseCell.swift
//  ExpandCollapse
//
//  Created by Nirzar Gandhi on 29/05/25.
//

import UIKit

class ExpandCollapseCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var titleContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowIcon: UIImageView!
    @IBOutlet weak var expandCollapseBtn: UIButton!
    
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var emptyContainer: UIView!
    @IBOutlet weak var emptyContainer2: UIView!
    @IBOutlet weak var hSeparator: UIView!
    
    
    // MARK: - Cell init methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        // Container
        self.container.backgroundColor = .clear
        
        // Title Container
        self.titleContainer.backgroundColor = .clear
        
        // Title Label
        self.titleLabel.backgroundColor = .clear
        self.titleLabel.textColor = .black
        self.titleLabel.font = UIFont(name: "NunitoSans-SemiBold", size: 15)!
        self.titleLabel.numberOfLines = 1
        self.titleLabel.lineBreakMode = .byTruncatingTail
        self.titleLabel.textAlignment = .left
        self.titleLabel.text = ""
        
        // Arrow Icon
        self.arrowIcon.backgroundColor = .clear
        self.arrowIcon.contentMode = .scaleAspectFit
        self.arrowIcon.image = UIImage(named: "rightArrowIcon")
        
        // Expand Collapse Button
        self.expandCollapseBtn.setBackgroundColor(color: .white, forState: .normal)
        self.expandCollapseBtn.showsTouchWhenHighlighted = false
        self.expandCollapseBtn.adjustsImageWhenHighlighted = false
        self.expandCollapseBtn.adjustsImageWhenDisabled = false
        
        // Stackview
        self.stackview.backgroundColor = .clear
        self.stackview.axis = .vertical
        self.stackview.alignment = .fill
        self.stackview.distribution = .fill
        self.stackview.spacing = 10.0
        
        // Empty Container
        self.emptyContainer.backgroundColor = .clear
        self.emptyContainer.layer.cornerRadius = 10.0
        self.emptyContainer.layer.borderWidth = 0.5
        self.emptyContainer.layer.borderColor = UIColor.black.cgColor
        self.emptyContainer.isHidden = true
        
        // Empty Container 2
        self.emptyContainer2.backgroundColor = .clear
        self.emptyContainer2.isHidden = true
        
        // Horizontal Separator
        self.hSeparator.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    // MARK: - Cell Configuration
    func configureCell(item: String?, isExpanded: Bool?) {
        
        // Title Label
        self.titleLabel.text = ""
        if let title = item, !title.isEmpty {
            self.titleLabel.text = title
        }
        
        // Arrow Icon and Empty Container
        if let expanded = isExpanded, expanded {
            
            self.arrowIcon.image = UIImage(named: "downArrowIcon")
            self.emptyContainer.isHidden = false
            self.emptyContainer2.isHidden = false
            
        } else {
            
            self.arrowIcon.image = UIImage(named: "rightArrowIcon")
            self.emptyContainer.isHidden = true
            self.emptyContainer2.isHidden = true
        }
    }
}

