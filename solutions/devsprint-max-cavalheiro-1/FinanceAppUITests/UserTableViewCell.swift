//
//  UserTableViewCell.swift
//  FinanceApp
//
//  Created by Jamile Bastos on 17/08/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(infoLabel)
    }
    private func setupConstraints() {
        setupConstraintsContainerView()
        setupConstraintsTitleLabel()
        setupConstraintsDescriptionLabel()
    }
    
    private func setupConstraintsContainerView() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupConstraintsTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

    private func setupConstraintsDescriptionLabel() {
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            infoLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func configure(_ titleText: String, _ infoText: String) {
        titleLabel.text = titleText
        infoLabel.text = infoText
    }
    
}
