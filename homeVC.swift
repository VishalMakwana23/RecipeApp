//
//  homeVC.swift
//  Recipeapp
//
//  Created by DCS on 26/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class homeVC: UIViewController {

    private var cityState = [Int]()
    
    private let myTableView = UITableView()
    
    private var foodArray = ["pizza", "Burger", "Sandwich", "Vada Pav", "French Fries"]
    private var shopArray = ["a","b","c","d","e"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menus"
        
        view.addSubview(myTableView)
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}

extension homeVC: UITableViewDataSource, UITableViewDelegate {
    
    private func setupTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(FoodCell.self, forCellReuseIdentifier: "FoodCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell
        
        cell.setupFoodCellWith(title: foodArray[indexPath.row], index: indexPath.row, and: (cityState.contains(indexPath.row) ? true : false))
        cell.myButton.addTarget(self, action: #selector(openCityDetails), for: .touchUpInside)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.cellForRow(at: indexPath) as! FoodCell
        if !cityState.contains(indexPath.row) {
            cityState.append(indexPath.row)
           
        }
        openCityDetails(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myTableView.beginUpdates()
            foodArray.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
            myTableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @objc private func openCityDetails(_ sender:Int) {
        navigationController?.pushViewController(WebViewController(search: foodArray[sender]), animated: true)
    }

}
