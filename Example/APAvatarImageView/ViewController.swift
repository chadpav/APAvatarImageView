//
//  ViewController.swift
//  APAvatarImageView
//
//  Created by Chad Pavliska on 10/25/2016.
//  Copyright (c) 2016 Chad Pavliska. All rights reserved.
//

import UIKit
import APAvatarImageView

class ViewController: UIViewController {

    @IBOutlet weak var avatarImageView: APAvatarImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        avatarImageView.fullName = "Chad Pavliska"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

