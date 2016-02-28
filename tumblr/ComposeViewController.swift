//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Emma Guo on 2/27/16.
//  Copyright © 2016 emmaguo. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var nevermindButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    let originalY1 = CGFloat(140)
    let originalY2 = CGFloat(289)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contentView.alpha = 0.8
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textButton.frame.origin.y = 568
        photoButton.frame.origin.y = 568
        quoteButton.frame.origin.y = 568
        linkButton.frame.origin.y = 568
        chatButton.frame.origin.y = 568
        videoButton.frame.origin.y = 568
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [],
            animations: {
                () -> Void in
                self.photoButton.frame.origin.y = self.originalY1
                self.chatButton.frame.origin.y = self.originalY2
            },
            completion: {
                (Bool) -> Void in
            }
        )
        
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [],
            animations: {
                () -> Void in
                self.textButton.frame.origin.y = self.originalY1
                self.quoteButton.frame.origin.y = self.originalY1
                self.linkButton.frame.origin.y = self.originalY2
            },
            completion: {
                (Bool) -> Void in
            }
        )
        
        UIView.animateWithDuration(0.6, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [],
            animations: {
                () -> Void in
                self.videoButton.frame.origin.y = self.originalY2
            },
            completion: {
                (Bool) -> Void in
            }
        )
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.photoButton.frame.origin.y = -100
            self.chatButton.frame.origin.y = -100
            self.videoButton.frame.origin.y = -100
        })

        UIView.animateWithDuration(0.5, delay: 0.2, options: [],
            animations: {
                () -> Void in
                self.textButton.frame.origin.y = -100
                self.quoteButton.frame.origin.y = -100
                self.linkButton.frame.origin.y = -100
            },
            completion: {
                (Bool) -> Void in
            }
        )
    }
    
    @IBAction func dismissModal(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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
