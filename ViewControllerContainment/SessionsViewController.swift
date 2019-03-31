//
//  SessionsViewController.swift
//  ViewControllerContainment
//
//  Created by Bart Jacobs on 01/05/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import UIKit

final class SessionsViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var greyView: UIView!
    var delegate: MasterDelegate?
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Sessions View Controller Will Appear")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //preferredContentSize = CGSize(width: 0, height: 0)
        //preferredContentSize = stackView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        print("Sessions View Controller Will Disappear")
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        btn.isSelected = !btn.isSelected
        greyView.isHidden = btn.isSelected
        //preferredContentSize = stackView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        //delegate?.openFirstVC(flag: btn.isSelected)
    }
    
}
