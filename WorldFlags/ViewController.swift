//
//  ViewController.swift
//  WorldFlags
//
//  Created by Mihai Leonte on 8/28/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let items = try! FileManager.default.contentsOfDirectory(atPath: Bundle.main.resourcePath!)
        print(items)
        let items2 = try! FileManager.default.contentsOfDirectory(atPath: Bundle.main.bundlePath)
        print(items2)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath)
        
        if countries[indexPath.row] == "uk" || countries[indexPath.row] == "us" {
            cell.textLabel?.text = countries[indexPath.row].uppercased()
        } else {
            cell.textLabel?.text = countries[indexPath.row].capitalized
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController {
         
            vc.selectedFlag = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            //present(vc, animated: true)
        }
    }


}

