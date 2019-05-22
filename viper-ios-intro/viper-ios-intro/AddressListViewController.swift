////
////  ViewController.swift
////  viper-ios-intro
////
////  Created by Akash Kundu on 5/21/19.
////  Copyright © 2019 Akash Kundu. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//
//}


import UIKit

class AddressListViewController: UIViewController {
    
    var addressList: [String]? = nil
    let reuseId: String = "cell"
    
    @IBOutlet weak var addressListTableView: UITableView! {
        didSet {
            addressListTableView.delegate = self
            addressListTableView.dataSource = self
            addressListTableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
            
            let cellNib = UINib(nibName: "AddressListTableViewCell", bundle: nil)
            addressListTableView.register(cellNib, forCellReuseIdentifier: reuseId)
            addressListTableView.separatorStyle = .none
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SVProgressHUD.show()
        fetchAddressList { (addressList) in
            self.addressList = addressList
            //SVProgressHUD.dismiss()
            self.addressListTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Address List"
    }
    
    func presentAlert(with message:String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Allright", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addNewAddressTapped(_ sender: UIBarButtonItem) {
        print("show address detail")
        //performSegue(withIdentifier: "showAddressDetail", sender: nil)
    }
}

extension AddressListViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let addressList = addressList else {
            return 0
        }
        
        return addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let addressListCell = tableView.dequeueReusableCell(withIdentifier: reuseId) as? AddressListTableViewCell else {fatalError()}
        
        let addressModel = addressList![indexPath.row]
        addressListCell.addessLabel.text = addressModel
        return addressListCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \(indexPath.row)")
        //performSegue(withIdentifier: "showAddressDetail", sender: nil)
    }
}

extension UIViewController {
    func fetchAddressList(onSuccess: @escaping ([String]?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            onSuccess(["111 sun lane","222 croft ave","333 trifecta rd"])
        }
    }
}
