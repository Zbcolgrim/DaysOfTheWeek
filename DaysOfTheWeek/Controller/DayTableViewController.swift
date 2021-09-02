//
//  DayTableViewController.swift
//  DaysOfTheWeek
//
//  Created by Zachary Buffington on 9/2/21.
//

import UIKit

class DayTableViewController: UITableViewController {
    
    var manager = DayManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    // determines how many ros are in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.days.count
    }
    
    // determines what each row looks like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        
        cell.textLabel?.text = manager.days[indexPath.row].name
        
        
        
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //I - index path
        guard let indexPath = tableView.indexPathForSelectedRow,
              
              //D - destination
              let destination = segue.destination as? DetailViewController else { return }
        //O - object ready
        let day = manager.days[indexPath.row]
        //O - object sent
        destination.day = day
        
    }
    
}
