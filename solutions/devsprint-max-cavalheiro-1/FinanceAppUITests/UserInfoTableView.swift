//
//  UserInfoTableView.swift
//  FinanceApp
//
//  Created by Jamile Bastos on 12/08/22.
//

import Foundation
import UIKit

struct Section {
    let title: String
    let rows: [Row]
    struct Row {
        let name: String
        let info: String?
        let haveIndicator: Bool
    }
}


class UserInfoTableView: UIView, UITableViewDelegate {
    private var listIdentifier = "UserInfoTableView"
    
    let datasource: [Section] = [
        Section(title: "My Account", rows: [
            Section.Row(name: "Phone", info: "+55 (11) 99999-9999", haveIndicator: false),
            Section.Row(name: "E-mail", info: "user@devpass.com", haveIndicator: false),
            Section.Row(name: "Address", info: "Rua Bela Cintra, 495", haveIndicator: false),
            Section.Row(name: "Personal Data", info: nil, haveIndicator: true),
            Section.Row(name: "Bank Account", info: nil, haveIndicator: true),
            Section.Row(name: "Taxes", info: nil, haveIndicator: true)
        ]),
        Section(title: "General", rows: [
            Section.Row(name: "Need help?", info: nil, haveIndicator: true),
            Section.Row(name: "About Devpass", info: nil, haveIndicator: true),
            Section.Row(name: "App Version", info: "1.0 (1)", haveIndicator: false),
        ])
    ]
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listIdentifier)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10)
        tableView.clipsToBounds = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        tableView.dataSource = self
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UserInfoTableView {
    func setupViews() {
        self.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.tableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        self.addSubview(self.tableView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension UserInfoTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource[section].rows.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return datasource[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.listIdentifier)!
        cell.textLabel?.text = datasource[indexPath.section].rows[indexPath.row].name
        return cell
    }
}
