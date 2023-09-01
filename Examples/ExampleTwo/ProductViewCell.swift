//
//  ProductViewCell.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//

import UIKit

class ProductViewCell: UITableViewCell {

    lazy var userPlan: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    lazy var activityViews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupAutoLayout()
    }
    
    func setupView() {
        contentView.addSubview(userPlan)
        contentView.addSubview(activityViews)
        contentView.addSubview(idLabel)
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            userPlan.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userPlan.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            activityViews.topAnchor.constraint(equalTo: userPlan.bottomAnchor, constant: 10),
            activityViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            idLabel.topAnchor.constraint(equalTo: activityViews.bottomAnchor, constant: 10),
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
    }
    
    func setData(data: ProductData) {
        userPlan.text = "Plan: \(data.user_plan ?? "")"
        activityViews.text = "Activity views: \(data.activity_views ?? 0)"
        idLabel.text = "Id: \(data.id ?? 0)"
    }
    
    func setDataFromCoreData(data: Product) {
        userPlan.text = "Plan: \(data.userPlan ?? "")"
        activityViews.text = "Activity views: \(data.activityViews)"
        idLabel.text = "Id: \(data.id)"
    }

}
