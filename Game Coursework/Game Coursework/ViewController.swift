//
//  ViewController.swift
//  Game Coursework
//
//  Created by Hetarth Joshi on 15/11/2018.
//  Copyright © 2018 Hetarth Joshi. All rights reserved.
//

import UIKit //functions for the user interface

protocol subviewDelegate{
    func changeSomething()
}


class ViewController: UIViewController, subviewDelegate {
  
    
    let W = UIScreen.main.bounds.width //define width to fit different phone screens
    let H = UIScreen.main.bounds.height //define height to fit different phone screens
    
    func changeSomething() {
        collisionBehavior.removeAllBoundaries()
        collisionBehavior.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: aeroplaneImage.frame)) //set the boundary as the aeroplane image
        
    }
    
    //defining mutable variables
    
    var dynamicBehavior: UIDynamicItemBehavior!
    var collisionBehavior: UICollisionBehavior!
    var dynamicAnimator: UIDynamicAnimator!
    var gravityBehavior: UIGravityBehavior!
    
    
    //defining a constant array of birds
    
    let arrayOfBirds = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
    

    
    @IBOutlet weak var movingroadImage: UIImageView! //connection for  moving road image
    
    @IBOutlet weak var aeroplaneImage: DraggedImageView! //connection for drraged aeroplane image
    
    @IBOutlet weak var SequenceOfTreeImages: UIImageView! //connection for sequence tree images
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       aeroplaneImage.myDelegate = self
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicBehavior = UIDynamicItemBehavior(items: [])
        dynamicAnimator.addBehavior(dynamicBehavior)

        gravityBehavior = UIGravityBehavior(items: [])
        collisionBehavior = UICollisionBehavior (items: [])
        dynamicAnimator.addBehavior(collisionBehavior)
        collisionBehavior.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: aeroplaneImage.frame))
        
    
    
    var imageArray: [UIImage]! //road images
    var imageArray2: [UIImage]!//tree images
    var imageArray3: [UIImage]!//plane images
    //var imageArray4: [UIImage]! bird images
    
    imageArray = [ UIImage (named: "road1.png")!,
                   UIImage (named: "road2.png")!,
                   UIImage (named: "road3.png")!,
                   UIImage (named: "road4.png")!,
                   UIImage (named: "road5.png")!,
                   UIImage (named: "road6.png")!,
                   UIImage (named: "road7.png")!,
                   UIImage (named: "road8.png")!,
                   UIImage (named: "road9.png")!,
                   UIImage (named: "road10.png")!,
                   UIImage (named: "road11.png")!,
                   UIImage (named: "road12.png")!,
                   UIImage (named: "road13.png")!,
                   UIImage (named: "road14.png")!,
                   UIImage (named: "road15.png")!,
                   UIImage (named: "road16.png")!,
                   UIImage (named: "road17.png")!,
                   UIImage (named: "road18.png")!,
                   UIImage (named: "road19.png")!]
        
        movingroadImage.image = UIImage.animatedImage(with: imageArray, duration: 1)
        movingroadImage.frame = CGRect(x:0,y:0, width: W*1, height:H*1)
        
        imageArray2 = [ UIImage (named:"tree1.png")!,
                       UIImage (named: "tree2.png")!,
                       UIImage (named: "tree3.png")!,
                       UIImage (named: "tree4.png")!,
                       UIImage (named: "tree5.png")!,
                       UIImage (named: "tree6.png")!,
                       UIImage (named: "tree7.png")!,
                       UIImage (named: "tree8.png")!,
                       UIImage (named: "tree9.png")!,
                       UIImage (named: "tree10.png")!,
                       UIImage (named: "tree11.png")!,
                       UIImage (named: "tree12.png")!,
                       UIImage (named: "tree13.png")!,
                       UIImage (named: "tree14.png")!,
                       UIImage (named: "tree15.png")!,
                       UIImage (named: "tree16.png")!,
                       UIImage (named: "tree17.png")!]
        
        
        
    SequenceOfTreeImages.image = UIImage.animatedImage(with: imageArray2, duration: 1)
        
    SequenceOfTreeImages.frame = CGRect(x:0,y:H*(-0.2),width:W*1,height:H*1)
    
        
        //self.view.bringSubviewToFront(treeImage)
        
        imageArray3 = [ UIImage (named:"plane1.png")!,
                        UIImage (named: "plane2.png")!,
                        UIImage (named: "plane3.png")!,
                        UIImage (named: "plane4.png")!,
                        UIImage (named: "plane5.png")!,
                        UIImage (named: "plane6.png")!,
                        UIImage (named: "plane7.png")!,
                        UIImage (named: "plane8.png")!,
                        UIImage (named: "plane9.png")!,
                        UIImage (named: "plane10.png")!,
                        UIImage (named: "plane11.png")!,
                        UIImage (named: "plane12.png")!,
                        UIImage (named: "plane13.png")!,
                        UIImage (named: "plane14.png")!,
                        UIImage (named: "plane15.png")!]
        
        aeroplaneImage.image = UIImage.animatedImage(with: imageArray3, duration: 1)
        
        aeroplaneImage.frame = CGRect(x: 0,y:H*(0.3),width:W*(0.2),height:H*(0.2))
        
     
        for index in 0...10 {
            let delay = Double(self.arrayOfBirds[index])
            let when = DispatchTime.now() + delay
            
            DispatchQueue.main.asyncAfter(deadline: when) {
                
        //Create a new UIImageView from scratch
        
        let birdView = UIImageView(image:nil)
        var imageArray4: [UIImage]
        
        imageArray4 = [UIImage (named: "bird1.png")!,
                       UIImage (named: "bird2.png")!,
                       UIImage (named: "bird3.png")!,
                       UIImage (named: "bird4.png")!,
                       UIImage (named: "bird5.png")!,
                       UIImage (named: "bird6.png")!,
                       UIImage (named: "bird7.png")!,
                       UIImage (named: "bird8.png")!,
                       UIImage (named: "bird9.png")!,
                       UIImage (named: "bird10.png")!]
                
        //Assign an image to the image view
        
        birdView.image = UIImage.animatedImage(with: imageArray4, duration: 2)
                
        //Assign the size and position of the image
        
        birdView.frame = CGRect(x: self.W, y: CGFloat(arc4random_uniform(UInt32(self.H))), width: self.W*(0.175), height: self.H*(0.175))
                
        //Add the image view to the main view
                
        self.view.addSubview(birdView)
        self.view.bringSubviewToFront(birdView)
        
        self.dynamicBehavior.addItem(birdView)
        self.dynamicBehavior.addLinearVelocity(CGPoint(x:-300, y:10), for: birdView)
        self.collisionBehavior.addItem(birdView)
    
        }
        }
        
        
        //birdView.image = UIImage(named: "bird1.png")
        


   }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
