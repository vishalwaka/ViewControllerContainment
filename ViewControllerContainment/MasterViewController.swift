//
//  MasterViewController.swift
//  ViewControllerContainment
//
//  Created by Bart Jacobs on 01/05/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import UIKit

protocol MasterDelegate {
    func openFirstVC(flag: Bool)
}

final class MasterViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet weak var cv: UIView!
    @IBOutlet weak var heigtConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var firstContainer: UIView!
    @IBOutlet weak var secondContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    /*private lazy var summaryViewController: SummaryViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)

        return viewController
    }()

    private lazy var sessionsViewController: SessionsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "SessionsViewController") as! SessionsViewController

        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        viewController.delegate = self
        return viewController
    }()*/

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let childViewController = segue.destination as? SummaryViewController {
            childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if let childViewController = segue.destination as? SessionsViewController {
            childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    // MARK: - View Methods

    private func setupView() {
        setupSegmentedControl()

        updateView()
    }

    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            firstContainer.isHidden = false
            secondContainer.isHidden = true
            //remove(asChildViewController: sessionsViewController)
            //add(asChildViewController: summaryViewController)
        } else {
            firstContainer.isHidden = true
            secondContainer.isHidden = false
            //remove(asChildViewController: summaryViewController)
            //add(asChildViewController: sessionsViewController)
        }
        
        //scrollView.scrollToView(view: cv, animated: false)
    }

    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Summary", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Sessions", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)

        // Select First Segment
        segmentedControl.selectedSegmentIndex = 0
    }

    // MARK: - Actions

    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }

    // MARK: - Helper Methods

    /*private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)

        // Add Child View as Subview
        cv.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = cv.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }*/
    
    /*override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        // heightConstraint is a IBOutlet to your NSLayoutConstraint you want to adapt to height of your content
        super.preferredContentSizeDidChange(forChildContentContainer: container)
        heigtConstraint.constant = container.preferredContentSize.height
    }*/
    
}

extension UIScrollView {
    
    // Scroll to a specific view so that it's visible inside the scrollview
    func scrollToView(view:UIView, animated: Bool) {
        
        // Get the position of your child view
        let childStartPoint = self.convert(view.frame.origin, to: self)
        
        // Scroll so that view visible inside the scroll view.
        DispatchQueue.main.async {
            self.scrollRectToVisible(CGRect(x: childStartPoint.x, y:childStartPoint.y, width: view.frame.width, height: 1), animated: animated)
        }
    }
}

extension MasterViewController : MasterDelegate {
    func openFirstVC(flag: Bool) {
        segmentedControl.selectedSegmentIndex = 0
        //summaryViewController.flag = flag
        updateView()
    }
}
