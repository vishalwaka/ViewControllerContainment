//
//  SummaryViewController.swift
//  ViewControllerContainment
//
//  Created by Bart Jacobs on 01/05/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import UIKit

final class SummaryViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    var flag = true {
        didSet {
            print("flag: \(flag)")
        }
    }
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Summary View Controller Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //preferredContentSize = CGSize(width: 0, height: 0)
        //preferredContentSize = stackView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        print("Summary View Controller Will Disappear")
    }

}
