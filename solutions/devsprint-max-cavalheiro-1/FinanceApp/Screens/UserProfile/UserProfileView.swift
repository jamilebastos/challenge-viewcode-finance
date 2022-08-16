//
//  UserProfileView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class UserProfileView: UIView {
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var headerView: UserProfileHeaderView = {
        let view = UserProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var userInfoTable: UserInfoTableView = {
        let tableView = UserInfoTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContainerView()
        setupHeaderView()
        setupUserInfoTable()
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(containerView)
        containerView.addSubview(headerView)
        containerView.addSubview(userInfoTable)
    }
    
    func setupContainerView() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    
    func setupHeaderView() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
        ])
    }
    
    func setupUserInfoTable() {
        NSLayoutConstraint.activate([
            userInfoTable.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            userInfoTable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            userInfoTable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            userInfoTable.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
