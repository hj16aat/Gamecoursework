//
//  ViewController.swift
//  Game Coursework
//
//  Created by Hetarth Joshi on 15/11/2018.
//  Copyright © 2018 Hetarth Joshi. All rights reserved.
//

import UIKit //function for the user interface
import SpriteKit //function for collsiion behavior
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
    
    
    @IBOutlet weak var movingroadImage: UIImageView! //connection for  moving road image
    
    @IBOutlet weak var aeroplaneImage: DraggedImageView! //connection for drag and drop animated aeroplane image
    
    @IBOutlet weak var SequenceOfTreeImages: UIImageView! //connection for sequence of tree images
    
    
    //defining a constant array of birds
    
    let arrayOfBirds = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
    let arrayofCoins = [0, 2 ,4, 6, 8, 10, 12, 14, 16, 18, 20]
    
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
        
       
    self.navigationController?.isNavigationBarHidden = true
    
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
        
        movingroadImage.image = UIImage.animatedImage(with: imageArray, duration: 1) //adds animations to the road
        movingroadImage.frame = CGRect(x:0,y:0, width: W*1, height:H*1) //set the size of the road
        
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
        
        
        
    SequenceOfTreeImages.image = UIImage.animatedImage(with: imageArray2, duration: 1) //adds animations to the trees
        
    SequenceOfTreeImages.frame = CGRect(x:0,y:H*(-0.2),width:W*1,height:H*1) //set the size of the trees
    
        
    self.view.bringSubviewToFront(aeroplaneImage) //keeps the aeroplane image in front of the trees when dragged
        
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
        
        let AnimatedBirds = UIImageView(image:nil)
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
        
        AnimatedBirds.image = UIImage.animatedImage(with: imageArray4, duration: 2)
                
        //Assign the size and position of the image
        
        AnimatedBirds.frame = CGRect(x: self.W, y: CGFloat(arc4random_uniform(UInt32(self.H))), width: self.W*(0.17), height: self.H*(0.17))
                
        
                
        self.view.addSubview(AnimatedBirds) //Add the image view to the main view
        self.view.bringSubviewToFront(AnimatedBirds)//keeps the birds in front of other background images
        
        self.dynamicBehavior.addItem(AnimatedBirds)
        self.dynamicBehavior.addLinearVelocity(CGPoint(x:-300, y:10), for: AnimatedBirds)
        self.collisionBehavior.addItem(AnimatedBirds)
            }
        }
        
            
        for index in 0...10 {
        let delay = Double(self.arrayofCoins[index])
        let when = DispatchTime.now() + delay
                
        DispatchQueue.main.asyncAfter(deadline: when){
            
            
        let coins = UIImageView(image:nil)
        var imageArray5: [UIImage]
            
        imageArray5 = [UIImage (named: "star coin rotate 1.png")!,
                       UIImage (named: "star coin rotate 2.png")!,
                       UIImage (named: "star coin rotate 3.png")!,
                       UIImage (named: "star coin rotate 4.png")!,
                       UIImage (named: "star coin rotate 5.png")!,
                       UIImage (named: "star coin rotate 6.png")!]
            
        //Assign an image to the image view
            
        coins.image = UIImage.animatedImage(with: imageArray5, duration: 2)
            
            
        coins.frame = CGRect(x: self.W, y: CGFloat(arc4random_uniform(UInt32(self.H))), width: self.W*(0.08),
        height: self.H*(0.08))
            
        //Assign the size and position of the image
            
            
        self.view.addSubview(coins)
        self.view.bringSubviewToFront(coins)
            
        self.dynamicBehavior.addItem(coins)
        self.dynamicBehavior.addLinearVelocity(CGPoint(x:-100, y:10), for: coins)
        self.collisionBehavior.addItem(coins)
          
            
            }
            
        }
                
            
    }
        

    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    

}
