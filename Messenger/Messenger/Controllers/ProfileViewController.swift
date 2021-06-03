//
//  ProfileViewController.swift
//  Messenger
//
//  Created by Jervy Umandap on 6/1/21.
//

import UIKit
import Firebase
import FBSDKLoginKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
//    "Account settings", "Legal and policies"
    let profileOptions = ["Log out"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Profile"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        

    }
    

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = profileOptions[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(
                                title: "Cancel",
                                style: .cancel,
                                handler: nil))
        
        actionSheet.addAction(UIAlertAction(
                                title: "Log out",
                                style: .destructive,
                                handler: { [weak self] (action) in
                                    guard let strongSelf = self else { return }
                                    
                                    // Logout facebook
                                    FBSDKLoginKit.LoginManager().logOut()
                                    
                                    //TODO: Log out the user and send them back to WelcomeViewController
                                    do {
                                        try Auth.auth().signOut()
                                        let vc = LoginViewController()
                                        let nav = UINavigationController(rootViewController: vc)
                                        nav.modalPresentationStyle = .fullScreen
                                        
                                        strongSelf.present(nav, animated: false, completion: nil)
                                    } catch {
                                        print("Error, there was a problem signing out.")
                                    }
                                }))
        
        present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    
}
