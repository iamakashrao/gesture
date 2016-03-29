//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by TheAppGuruz-iOS-103 on 05/02/15.
//  Copyright (c) 2015 TheAppGururz. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var vwBox: UIView!
    
    @IBOutlet var vwwBox: UIView!
    var firstX:Double = 0;
    var firstY:Double = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initializeGestureRecognizer()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        self.vwwBox.transform = CGAffineTransformMakeScale(-1, 1);

        
        
        
    }
    
    
    func initializeGestureRecognizer()
    {
        //For TapGesture Recognization
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("recognizeTapGesture:"))
        vwBox.addGestureRecognizer(tapGesture)
        vwwBox.addGestureRecognizer(tapGesture)
        
        //For LongPressGesture Recoginzation
        let longPressedGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: Selector("recognizeLongPressedGesture:"))
        vwBox.addGestureRecognizer(longPressedGesture)
        vwwBox.addGestureRecognizer(longPressedGesture)
        //For RotateGesture Recoginzation
        let rotateGesture: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: Selector("recognizeRotateGesture:"))
        vwBox.addGestureRecognizer(rotateGesture)
        vwwBox.addGestureRecognizer(rotateGesture)
        //For PinchGesture Recoginzation
        let pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: Selector("recognizePinchGesture:"))
        vwBox.addGestureRecognizer(pinchGesture)
        vwwBox.addGestureRecognizer(pinchGesture)
        //For PanGesture Recoginzation
        let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("recognizePanGesture:"))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        vwBox.addGestureRecognizer(panGesture)
        vwwBox.addGestureRecognizer(panGesture)
    }
    
    func recognizeTapGesture(sender: UIGestureRecognizer)
    {
        let colorRed: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        let colorGreen: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        let colorBlue: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        vwBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
        vwwBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
    }
    
    func recognizeLongPressedGesture(sender: UILongPressGestureRecognizer)
    {
        let colorRed: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        let colorGreen: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        let colorBlue: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        vwBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
        vwwBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
    }
    
    func recognizeRotateGesture(sender: UIRotationGestureRecognizer)
    {
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        sender.rotation = 0
    }
    
    func recognizePinchGesture(sender: UIPinchGestureRecognizer)
    {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform,
            sender.scale, sender.scale)
        sender.scale = 1
    }
    
    func recognizePanGesture(sender: UIPanGestureRecognizer)
    {
        let translate = sender.translationInView(self.view)
        sender.view!.center = CGPoint(x:sender.view!.center.x + translate.x,
            y:sender.view!.center.y + translate.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }

}
