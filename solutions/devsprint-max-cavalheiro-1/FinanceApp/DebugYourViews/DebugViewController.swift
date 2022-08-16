//
//  DebugViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

/**

 Use this ViewController to debug your View components.

 1) Change `myView` type to your UIView subclass
 2) Set `myViewHeight` according to your View
 3) Set an instance of DebugViewController as window's rootViewController in `SceneDelegate.swift` file

 */

class DebugViewController: UIViewController {

    private let myView: UIView = {
        let view = UserProfileView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .white

        view.addSubview(myView)

        NSLayoutConstraint.activate([
            myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
