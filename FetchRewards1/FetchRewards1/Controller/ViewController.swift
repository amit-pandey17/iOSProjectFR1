//
//  ViewController.swift
//  FetchRewards1
//
//  Created by Amit Pandey on 4/13/21.
//


/// Things needed in table: Event Name, Event place (City, ST), Time
/// Things needed in Detail view: Event Name, Image, Time, Event place (City, ST)
import UIKit

    class ViewController: UIViewController {
        final let url = URL(string: "http://jsonviewer.stack.hu/#http://api.seatgeek.com/2/events?client_id=MjE3MTEzODR8MTYxODM0MDMwMS44NjY3NjU")
        private var events = [Event]()
        @IBOutlet weak var tableView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            downloadJson()
            tableView.tableFooterView = UIView()
        }
// Mark: function to download JSON
        func downloadJson() {
            guard let downloadURL = url else { return }
            URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
                guard let data = data, error == nil, urlResponse != nil else {
                    print("error")
                    return
                }
                print("download succesful")
                do
                {
                    let decoder = JSONDecoder()
                    let downloadEvents = try decoder.decode(EventData.self, from: data)
                    self.events = downloadEvents.events
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("download but error")
                }
            }.resume()
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return events.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = events[indexPath.row].datetime_utc
    //        cell.DOBLbl.text = "DOB: " + events[indexPath.row].datetime_utc
    //        if let imageURL = URL(string: actors[indexPath.row].image) {
    //            DispatchQueue.global().async {
    //                let data = try? Data(contentsOf: imageURL)
    //                if let data = data {
    //                    let image = UIImage(data: data)
    //                    DispatchQueue.main.async {
    //                        cell.imgView.image = image
    //                    }
    //                }
    //            }
    //        }
            return cell
        }
    }

