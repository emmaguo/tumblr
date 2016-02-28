//
//  SearchViewController.swift
//  tumblr
//
//  Created by Emma Guo on 2/27/16.
//  Copyright © 2016 emmaguo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var feedView: UIImageView!
    var loadingView: UIView!
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images: [UIImage]!
    var animatedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Prepare loading indicator
        loadingView = UIView(frame: feedView.frame)
        loadingView.backgroundColor = UIColor(red: 0.2, green: 0.27, blue: 0.37, alpha: 1)
        view.addSubview(loadingView)
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImageWithImages(images, duration: 0.7)
        let animatedImageView = UIImageView(image: animatedImage)
        animatedImageView.center = loadingView.center
        loadingView.addSubview(animatedImageView)
        loadingView.alpha = 0
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide image feed and show custom loading indicator
        feedView.alpha = 0
        loadingView.alpha = 1
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Hide loading indicator and show image feed
        delay(1.2) {
            self.loadingView.alpha = 0
            self.feedView.alpha = 1            
        }
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
