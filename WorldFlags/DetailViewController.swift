//
//  DetailViewController.swift
//  WorldFlags
//
//  Created by Mihai Leonte on 8/28/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var flagImageView: UIImageView!
    var selectedFlag: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
        
        guard let flag = selectedFlag else { return }
        flagImageView.image = UIImage(named: flag)
        navigationItem.title = flag
    }
    
    @objc func shareFlag() {
        guard let flag = selectedFlag else { return }
        
        let ac = UIActivityViewController(activityItems: [flag, UIImage(named: flag)], applicationActivities: [])
        present(ac, animated: true)
    }

}
