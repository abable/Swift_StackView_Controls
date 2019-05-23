//
//  Axis.swift
//  StackView
//
//  Created by Seungjun Lim on 23/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class AxisController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func toggleAxis(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            if self.stackView.axis == .horizontal {
                self.stackView.axis = .vertical
            } else {
                self.stackView.axis = .horizontal
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}


