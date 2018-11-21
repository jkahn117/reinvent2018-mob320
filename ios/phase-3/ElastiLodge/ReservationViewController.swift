//
//  ReservationViewController.swift
//  ElastiLodge
//
//  Created by Stormacq, Sebastien on 18/11/2018.
//  Copyright © 2018 Stormacq, Sebastien. All rights reserved.
//

import Foundation
import UIKit

class ReservationViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // create a strong reference to our datasource
    private var dataSource = TableDataSource()
    private let app = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {

        // at the time this view loads, we assume data will be available already
        // real world application should check data availability and trigger a reload when not available
        tableView.dataSource = self.dataSource
        tableView.reloadData()

        // add ourselves as observer to be notified when mutation data are available
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onDataAvailable),
                                               name: app.mutationAvailableNotificationName,
                                               object: nil)
        
    }
    
    deinit {
        // unregister from notification center
        NotificationCenter.default.removeObserver(self,
                                                  name: app.mutationAvailableNotificationName,
                                                  object: nil)
    }
    
    @objc func onDataAvailable(_ notification:Notification) {
        print("reloading data")
        tableView.reloadData()
    }

}

class TableViewCell : UITableViewCell {
    
    @IBOutlet weak var imageLodge: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var confirmation: UILabel!
    @IBOutlet weak var call: UIButton!
    
}

class TableDataSource : NSObject, UITableViewDataSource {
    private let app = UIApplication.shared.delegate as! AppDelegate
    private let cellIdentifier = "BookingCell"
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app.api.bookings("")?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell else {
            fatalError("Dequeued cell is not an instance is TableViewCell")
        }
        
        guard let b = app.api.bookings("")?[indexPath.row] else {
            print("No bookings for this identity")
            return cell
        }

        cell.confirmation.text = "Confirmation Number : \(app.api.confirmation(b) ?? "")"
        cell.date.text = "\(app.api.checkin(b) ?? "") to \(app.api.checkout(b) ?? "")"
        cell.name.text = "\(app.api.bookingName(b) ?? "")"
        if let imageURL = app.api.bookingImageUrl(b) {
            app.loadImageFrom(url: imageURL, into: cell.imageLodge)
        }

        return cell
    }
 
}
