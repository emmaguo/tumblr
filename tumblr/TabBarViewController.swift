//
//  TabBarViewController.swift
//  tumblr
//
//  Created by Emma Guo on 2/27/16.
//  Copyright © 2016 emmaguo. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var popupView: UIImageView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    var fadeTransition: FadeTransition!
    var originalPopupY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewStoryboard")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewStoryboard")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewStoryboard")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewStoryboard")
        viewControllers = [
            homeViewController,
            searchViewController,
            accountViewController,
            trendingViewController
        ]
        onPressTab(buttons[selectedIndex])
        
        // Animate explore popup
        originalPopupY = popupView.frame.origin.y
        UIView.animateWithDuration(0.9, delay: 0, options: [
                UIViewAnimationOptions.Autoreverse,
                UIViewAnimationOptions.Repeat
            ],
            animations: {
                self.popupView.frame.origin.y = self.originalPopupY + 6
            },
            completion: {
                (Bool) -> Void in
            }
        )
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.7
    }

    @IBAction func onPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].selected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        if selectedIndex == 1 {
            popupView.alpha = 0
        } else {
            popupView.alpha = 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
