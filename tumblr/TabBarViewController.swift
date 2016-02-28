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
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewStoryboard")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewStoryboard")
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewStoryboard")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewStoryboard")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewStoryboard")
        viewControllers = [
            homeViewController,
            searchViewController,
            composeViewController,
            accountViewController,
            trendingViewController
        ]
        onPressTab(buttons[selectedIndex])
    }

    @IBAction func onPressTab(sender: UIButton) {
        let previousIndex = selectedIndex
        buttons[previousIndex].selected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        selectedIndex = sender.tag
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
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
