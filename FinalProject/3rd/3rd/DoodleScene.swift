//
//  DoodleScene.swift
//  3rd
//
//  Created by Dillan Hoyos on 4/21/21.
//

import SpriteKit
import SwiftUI
import AVFoundation


class DoodleScene: SKScene, SKPhysicsContactDelegate{
  
    var rightwall = false
    var leftwall = false
    //ScoreManagment
    let scoreLabel = SKLabelNode()
    var score = 0
    var point = 600.0


     
    
    let rectangleSize:CGRect = CGRect(x: 1, y: 1, width: 300, height: 90)
    let sprite = SKSpriteNode(imageNamed: "Video-Game-Character-Design-Collection-002.jpeg")
    var background = SKSpriteNode(imageNamed: "Sky.png")
    

    let circleRadius:CGFloat = 20
    let conerRadius:CGFloat = 2
    var isTouchingBall = false
    var isBallMoving = true

    
    var isTouchingleft = false
    var isTouchingRight = false
    var touchedBall:SKSpriteNode!
    var touchLocation:CGPoint!
    
    //cameranode
    let cameraNode = SKCameraNode()
//    let isPlayerMoving = true
    
    let columns = 10
    let rows = 10
    var bar = [SKSpriteNode]()
    //ball declaration
    

    //Bit mask basedon categories of Objects
//    let ballCategory: UInt32 = 0x1 << 0
//    let barCategory: UInt32 = 0x1 << 1
    //audioPlayer
    let audioPlayer = Player()
    var count = 1
    
   
    
    override func didMove(to view: SKView) {
        
        
        addChild(background)

        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        
        
        self.camera = cameraNode
        //score labeling
        
        scoreLabel.position = CGPoint(x: 300, y: 500)
        scoreLabel.fontColor = .white
        scoreLabel.fontSize = 150
        scoreLabel.text = String(score)
        cameraNode.addChild(scoreLabel)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -6)
        self.physicsWorld.contactDelegate = self

        cameraNode.position = CGPoint(x: 420, y: 500)
       
        sprite.name =  "sprite"
        sprite.size = CGSize(width: 75, height: 75)
        sprite.position = CGPoint(x: 250, y: 500)
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: circleRadius)
        sprite.physicsBody?.allowsRotation = false
        sprite.physicsBody?.friction = 0
        sprite.physicsBody?.restitution = 1
        sprite.physicsBody?.angularDamping = 0
        sprite.physicsBody?.linearDamping = 0
        sprite.physicsBody?.mass = 0.0001
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.hero
//        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.hero | PhysicsCategory.step
        sprite.physicsBody?.collisionBitMask = PhysicsCategory.step
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.step
        addChild(sprite)
       
        
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.ballCategory
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.ballCategory | PhysicsCategory.borderCategory
        audioPlayer.linkSound(ball: sprite.name!)
         
   
        createwalls()
        add()

      
    }
    
// Physics Categories
    struct PhysicsCategory{
        static var None: UInt32 = 0;
        static var step: UInt32 = 0b1;
        static var hero: UInt32 = 0b10;
        static var All: UInt32 = UInt32.max;
        static var ballCategory: UInt32 = 0x1 << 0
        static var borderCategory: UInt32 = 0x1 << 1
        
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
       
       let bodyA = contact.bodyA.node?.name
       let bodyB = contact.bodyB.node?.name
        
    
       

       if bodyA != nil && (bodyA?.contains("sprite"))!{
       print("bodyACollided")
       
        audioPlayer.playSound(ball: bodyA!)
       
           
       }
   
       if bodyB != nil && (bodyB?.contains("sprite"))!{
       print("bodyBcollided")
        audioPlayer.playSound(ball: bodyB!)
        
      
        sprite.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0.01))
        print("score")
        score += 1
        scoreLabel.text = String(score)
       
       
       }
   }
    func dieAndRestart(){
                print("Dead")
                sprite.physicsBody?.velocity.dy = 0
                sprite.removeFromParent()
                
                scoreLabel.position = cameraNode.position
                removeChildren(in: bar)
                sprite.position = CGPoint(x: 450, y: 500)
                sprite.physicsBody?.angularVelocity = 0
                sprite.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                addChild(sprite)
                sprite.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0.1))
                add()
             

                
       
    }
//    func createbar(){
//        for bars in bar{
//
//        }
//    }
//
    
    func createwalls(){
        let leftWall = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 50, height: 100000))
        leftWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 10000000))
        leftWall.physicsBody?.isDynamic = true
        leftWall.physicsBody?.pinned = true
       
        leftWall.position = CGPoint(x: 10, y: 0)

        leftWall.name = "leftWall"
 
        self.addChild(leftWall)

        let rightWall = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 50, height: 100000))
        rightWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 10000000))
        rightWall.physicsBody?.pinned = true
        rightWall.physicsBody?.restitution = 1
        rightWall.position = CGPoint(x: 825, y: 0)
        rightWall.name = "rightwall"
  
        self.addChild(rightWall)
       
    }

    func add(){
        let recof = CGSize(width: 90, height: 20)
               let rocof =  CGSize(width: 120, height: 20)
               var y:CGFloat = 0.0
               var increase = CGFloat(400.0)
               let yOffset = CGFloat(rows) * recof.height
               let xOffset = CGFloat(columns) * recof.width
               var x:CGFloat = 0.0
        
        for row in 0..<rows{
            for column in 0..<columns{
                let rectangle = SKSpriteNode(imageNamed: "GrassJoinHillRight.png")
                rectangle.size = recof
                rectangle.position = CGPoint(x: x-xOffset+random(min: -220, max: 400) + 1200, y: y+yOffset+random(min: -600, max: 0)+CGFloat(increase))
                rectangle.name = "Rect"
                rectangle.physicsBody = SKPhysicsBody(rectangleOf: rocof)
                rectangle.physicsBody?.affectedByGravity = false
                rectangle.physicsBody?.friction = 0
//                rectangle.physicsBody?.
                rectangle.physicsBody?.restitution = 1
                rectangle.physicsBody?.linearDamping = 0
                rectangle.physicsBody?.angularDamping = 0
                rectangle.physicsBody?.allowsRotation = false
                rectangle.physicsBody?.pinned = true
                rectangle.physicsBody?.categoryBitMask = PhysicsCategory.borderCategory
                rectangle.physicsBody?.categoryBitMask = PhysicsCategory.step
                rectangle.physicsBody?.collisionBitMask = PhysicsCategory.None
                rectangle.physicsBody?.contactTestBitMask = PhysicsCategory.hero
            
       
                
                //add to scene
                self.addChild(rectangle)
               
                
                bar.append(rectangle)
                increase += CGFloat(100)
            }
           
        }
        
    }

   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     for touch in touches{
                 let location = touch.location(in: self)
                
            
                 if let body = self.physicsWorld.body(at: location){
                     isBallMoving = true
                     if body.node?.name == "sprite"{
                         isTouchingBall = true
                        
                         touchedBall = body.node as? SKSpriteNode
                         touchLocation = location
                         }
                    
             
             }
                if location.x > self.frame.midX{
                    isTouchingRight = true
                    
                }
                if location.x < self.frame.midX{
                    isTouchingleft = true
                }
            
                
//        if sprite.position.y == self.frame.midY{
//
//            Spawn = true
//            here += 1000
//        }else {
//            Spawn = false
//        }
        
        
     }
}

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
                    if isTouchingBall{
                        for touch in touches{
                            touchLocation = touch.location(in: self)
                            
                        }
                    }
                }

    
    override func update(_ currentTime: TimeInterval) {
       

        
                if isTouchingleft{
                        sprite.physicsBody?.applyImpulse(CGVector(dx: -0.01, dy: 0))
                        isTouchingleft = false
                        
                }
                if isTouchingRight{
                        sprite.physicsBody?.applyImpulse(CGVector(dx: 0.01, dy: 0))
                        isTouchingRight = false
                }
                
                let deadbarrier = sprite.position.y-(sprite.position.y+100)
               //cameraUpdate
                if isBallMoving{
                        if sprite.position.y < deadbarrier{
                       
                            dieAndRestart()
                        }
                        else{
                            cameraNode.position.y = sprite.position.y
                            background.position = cameraNode.position
                            print("\(sprite.position.y)")
                        }
                       
                    }
     
                if isTouchingBall{
                    
                        let dt:CGFloat = 1.0 / 60.0
                        let distance = CGVector(dx: touchLocation.x-touchedBall.position.x, dy: touchLocation.y-touchedBall.position.y)
                        let velocity = CGVector(dx: distance.dx/dt, dy: distance.dy/dt)
                        touchedBall.physicsBody?.velocity = velocity
                        
                    }
        //BitMasking Collision Update
                if let body = sprite.physicsBody{
                    let dy = body.velocity.dy
                        if dy > 0 {
                            //prevent collision if the hero is jumping
                            body.collisionBitMask &= ~PhysicsCategory.step
                            
                        }
                        else{
                            //allow collision if the hero is fallling
                            body.collisionBitMask |= PhysicsCategory.step
                           
                        
                            
                            
                        }
                }
     
                    var here = CGFloat(1000)
                if sprite.position.y == here {
                    //Delete array
                    removeChildren(in: bar)
                    bar.removeAll()
                    here += 1000
                    //rectangle Spawn
                    add()
                    print ("we are going")
                }
             
          
        
    
    
      
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isTouchingBall{
            isTouchingBall = false
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isTouchingBall{
            isTouchingBall = false
        }
    }
    
    
    
   
    func random(min: CGFloat, max: CGFloat) -> CGFloat{
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (max - min) + min
    }
    
    func start(){
           audioPlayer.start()
       }
       
       func stop(){
           audioPlayer.stop()
       }
    
}

