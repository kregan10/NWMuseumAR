//
//  TutorialPageViewController.swift
//  NWMuseumAR
//
//  Created by Harrison Milbradt on 2018-02-09.
//  Copyright © 2018 NWMuseumAR. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    lazy var subViewControllers:[UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "help1"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "help2"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "help3")
        ]
    }()
    
    var currentPage : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self
        
        currentPage = 0
        
        setViewControllers([subViewControllers[0]], direction: .forward, animated: false, completion: nil)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        if currentIndex <= 0 {
            return nil
        }
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndex:Int = subViewControllers.index(of: viewController) ?? 0
        if currentIndex >= subViewControllers.count - 1 {
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard completed else { return }
        self.currentPage = pageViewController.viewControllers!.first!.view.tag
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        /*****  May want to implement an alert that comes up prompting the user if they want directions,
                instead of just a button that asks them if they want directions.  Below is some of the code
                that can help us do that
        
        let alertController = UIAlertController(title: "Need Directions?", message:
            "Would you like directions to the Museum?", preferredStyle: UIAlertControllerStyle.alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { _ -> Void in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NavigateToMuseumController") as! NavigateToMuseumController
            self.present(nextViewController, animated: true, completion: nil)
        })
        alertController.addAction(yesAction)
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default,handler: nil))
        self.presentViewController(alert, animated: true){}
        */

    }
    
    func startNavigation() {
        
    }
}
