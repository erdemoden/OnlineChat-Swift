//
//  ViewController.swift
//  onlinechat
//
//  Created by erdem öden on 29.01.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var HamburgerRight: NSLayoutConstraint!
    @IBOutlet weak var TitleBackGround: UIView!
    @IBOutlet weak var ChatTables: UITableView!
    
    @IBAction func MenuClicked(_ sender: Any) {
        HamburgerRight.constant = 0;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = ChatTables.dequeueReusableCell(withIdentifier: "Chats", for: indexPath) as! ChatTables
        return Cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatTables.delegate = self;
        ChatTables.dataSource = self;
        ChatTables.separatorStyle = .none;
        TitleBackGround.layer.cornerRadius = 20;
        // Do any additional setup after loading the view.
    }


}

