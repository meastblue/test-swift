//
//  ProfilTableViewController.swift
//  DevHub
//
//  Created by Massinissa Amalou on 02/12/2023.
//

import UIKit

class ProfilTableViewController: UITableViewController {
    
    var contributors = [Contributor]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadContributors()
        self.navigationItem.title = "DevHub"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return contributors.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (contributors.count + 1) / 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilCell", for: indexPath) as! ProfilTableCell
        let _ = contributors[indexPath.row * 2]
        let _ = indexPath.row * 2 + 1 < contributors.count ? contributors[indexPath.row * 2 + 1] : nil
        return cell
    }
    
    func loadContributors() {
        ContributorService.fetchData { [weak self] c, error in
           DispatchQueue.main.async {
               if let contributors = c {
                   self?.contributors = contributors
                   self?.tableView.reloadData()
               } else if let error = error {
                   print("Error: \(error)")
               }
           }
       }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
}

//extension ProfilTableViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfItemsInSection section: Int) -> Int {
//        return 20
//    }
//    
//    func tableView(_ tableView: UITableView, cellForItemAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilCell", for: indexPath) as? ProfilTableCell else {
//            return UITableViewCell()
//        }
//      
//        return cell
//    }
//    
//    
//}
//
//extension ProfilTableViewController: UITableViewDelegate {
//}


class ProfilTableCell: UITableViewCell {
    @IBOutlet private weak var profilLabel: UILabel!
    @IBOutlet private weak var profilImage: UIImageView!
    
    func setLabel(_ label: String) {
        profilLabel.text = label
    }
    
    func setImage (_ url: String) {
        
    }
}
