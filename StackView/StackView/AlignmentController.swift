//
//  AlignmentController.swift
//  StackView
//
//  Created by Seungjun Lim on 23/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class AlignmentController: UIViewController {
    
    @IBOutlet weak var horizontalStackView: UIStackView!
    
    @IBAction func alignmentChanged(_ sender: UISegmentedControl) {
        let options: [UIStackView.Alignment] = [.fill, .top, .center, .bottom]
        
        UIView.animate(withDuration: 0.3) {
            self.horizontalStackView.alignment = options[sender.selectedSegmentIndex]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
}
