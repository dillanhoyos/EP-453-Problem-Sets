//
//  DoodleScene.swift
//  3rd
//
//  Created by Dillan Hoyos on 4/21/21.
//

import SpriteKit
import SwiftUI


class DoodleScene: SKScene, SKPhysicsContactDelegate{
  
    
    
    let rectangleSize:CGRect = CGRect(x: 1, y: 1, width: 300, height: 90)
    let sprite = SKSpriteNode(imageNamed: "Video-Game-Character-Design-Collection-002.jpeg")
    
//    let Point1:CGPoint = CGPoint(x: 900, y: 10000)
//    let Point2:CGPoint = CGPoint(x: 900, y: -500)
//    let Point3:CGPoint = CGPoint(x: 0,y: 10000)
//    let Point4:CGPoint = CGPoint(x: 0,  y: -500)
//    let path:CGPath = CGPath(rect: self , transform: <#T##UnsafePointer<CGAffineTransform>?#>)
//
//
   
    
    let circleRadius:CGFloat = 20
 
    let conerRadius:CGFloat = 2
    var isTouchingBall = false
    var isBallMoving = true
    var touchedBall:SKSpriteNode!
    var touchLocation:CGPoint!
   
  
//    var audioPlayer = Player()
    var count = 1
    //cameranode
    let cameraNode = SKCameraNode()
//    let isPlayerMoving = true
    
    let columns = 3
    let rows = 6
    var bar = [SKShapeNode]()
    //ball declaration
    

    //Bit mask basedon categories of Objects
    let ballCategory: UInt32 = 0x1 << 0
    let barCategory: UInt32 = 0x1 << 1
    
    override func didMove(to view: SKView) {
        
        self.camera = cameraNode
        
//        let border = SKPhysicsBody(edgeChainFrom: CGPath)
//        border.friction = 1
//        border.restitution = 1
//        border.pinned = true
//        self.physicsBody = border
//
//        let border1 = SKPhysicsBody(edgeFrom: Point2, to: Point1)
//        border1.friction = 1
//        border1.restitution = 1
//        border1.pinned = true
//        self.physicsBody = border1
        //ball
      
        /// Camera
        
//        scene!.addChild(cameraNode)
//        scene!.camera = cameraNode
//
        cameraNode.position = CGPoint(x: 420, y: 500)
       
//
//        createBar(location: CGPoint(x: self.frame.midX/random(min: 0, max: 5), y: self.frame.midY/random(min: 0, max: 1)))
       
       
        sprite.name =  "ball"
        sprite.size = CGSize(width: 75, height: 75)
        sprite.position = CGPoint(x: 250, y: 500)


        sprite.physicsBody = SKPhysicsBody(circleOfRadius: circleRadius)
        sprite.physicsBody?.allowsRotation = false
        sprite.physicsBody?.friction = 0
        sprite.physicsBody?.restitution = 1
        sprite.physicsBody?.angularDamping = 0
        sprite.physicsBody?.linearDamping = 0
        sprite.physicsBody?.mass = 0.5
 
        addChild(sprite)
        sprite.physicsBody?.categoryBitMask = ballCategory
        sprite.physicsBody?.contactTestBitMask = ballCategory | barCategory
       ////
////
        createwalls()
//        createBall(location: CGPoint(x: self.frame.midX, y: self.frame.midY/random(min: 1, max: 2)))
        addRect()
    }
    func didBegin(_ contact: SKPhysicsContact) {
       
       let bodyA = contact.bodyA.node?.name
       let bodyB = contact.bodyB.node?.name

       if bodyA != nil && (bodyA?.contains("ball"))!{
       print("bodyACollided")
       
     
           
       }
   
       if bodyB != nil && (bodyB?.contains("ball"))!{
       print("bodyBcollided")
          
           
       
       }
   }
   
    
    func createwalls(){
        let leftWall = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 50, height: 100000))
        leftWall.position = CGPoint(x: 10, y: 0)
        leftWall.physicsBody = SKPhysicsBody(rectangleOf: leftWall.size)
        leftWall.physicsBody!.isDynamic = false
        self.addChild(leftWall)

        let rightWall = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 50, height: 100000))
        rightWall.position = CGPoint(x: 825, y: 0)
        rightWall.physicsBody = SKPhysicsBody(rectangleOf: rightWall.size)
        rightWall.physicsBody!.isDynamic = false
        self.addChild(rightWall)
//    2t
        
//        let touchscreen = SKShapeNode(rectOf: screen)
//
//        touchscreen.physicsBody?.pinned = true
//        touchscreen.physicsBody?.isDynamic = false
//        touchscreen.alpha = 0
//        touchscreen.name = "pad"
    }
//    func createBall(location: CGPoint){
//        let ball = SKShapeNode(circleOfRadius: circleRadius)
//
//        ball.position = location
//        ball.name =  "ball"
//        ball.strokeColor = SKColor.white
//        ball.glowWidth = 4.0
//        ball.fillColor = SKColor.init(red: random(min: 0, max: 1), green: random(min: 0, max: 1), blue: random(min: 0, max: 1), alpha: 1)
//
//        ball.physicsBody = SKPhysicsBody(circleOfRadius: circleRadius)
//        ball.physicsBody?.allowsRotation = false
//        ball.physicsBody?.friction = 0
//        ball.physicsBody?.restitution = 1
//        ball.physicsBody?.angularDamping = 0
//        ball.physicsBody?.linearDamping = 0
//        ball.physicsBody?.mass = 0.00001
//
//
//        self.addChild(ball)
//        ball.physicsBody?.categoryBitMask = ballCategory
//        ball.physicsBody?.contactTestBitMask = ballCategory | barCategory
////
//    }
    func addRect(){
        
        
        let recof = CGSize(width: 90, height: 20)
        var y:CGFloat = 0.0
        let yOffset = CGFloat(rows) * recof.height
        let xOffset = CGFloat(columns) * recof.width
        for row in 0..<rows{
            var x:CGFloat = 0.0
            for column in 0..<columns{
                let rectangle = SKShapeNode(rectOf: recof, cornerRadius: conerRadius)
                rectangle.position = CGPoint(x: x-xOffset+random(min: -180, max: 180) + 550, y: y+yOffset+random(min: -400, max: 180) + 400)
                rectangle.name = "Rect"
                rectangle.fillColor = SKColor.init(red: random(min: 0, max: 1), green: random(min: 0, max: 1), blue: random(min: 0, max: 1), alpha: 1)
                rectangle.physicsBody = SKPhysicsBody(rectangleOf: recof )
                rectangle.physicsBody?.affectedByGravity = false
                rectangle.physicsBody?.friction = 0
//                rectangle.physicsBody?.
                rectangle.physicsBody?.restitution = 1
                rectangle.physicsBody?.linearDamping = 0
                rectangle.physicsBody?.angularDamping = 0
                rectangle.physicsBody?.allowsRotation = false
                rectangle.physicsBody?.pinned = true
                //add to scene
                self.addChild(rectangle)
                x += 1.6 * recof.width
               
                
            }
            y += 2 * recof.height
        }
    
    }
 
//    func createBar(location: CGPoint){
//
//
//        let recof = CGSize(width: 100, height: 30)
//        let rectangle = SKShapeNode(rectOf: recof, cornerRadius: conerRadius)
//SKSpriteNode
//        rectangle.position = location
//        rectangle.name = "Rect" + String(count)
//        count += 1
//        rectangle.strokeColor = SKColor.white
//        rectangle.fillColor = SKColor.init(red: random(min: 0, max: 1), green: random(min: 0, max: 1), blue: random(min: 0, max: 1), alpha: 1)
//
//        rectangle.physicsBody = SKPhysicsBody(rectangleOf: recof )
//        rectangle.physicsBody?.affectedByGravity = false
//        rectangle.physicsBody?.friction = 0
//        rectangle.physicsBody?.restitution = 1
//        rectangle.physicsBody?.linearDamping = 0
//        rectangle.physicsBody?.angularDamping = 0
//        rectangle.physicsBody?.allowsRotation = false
//        rectangle.physicsBody?.pinned = true
//        rectangle.physicsBody?.usesPreciseCollisionDetection = false
//
//        self.physicsBody?.categoryBitMask = barCategory
//        self.physicsWorld.contactDelegate = self
//
//        //add
//
//        self.addChild(rectangle)
//
////        audioPlayer.linkSound(ball: ball.name!)
////
////        rectangle.physicsBody?.applyImpulse(CGVector(dx: random(min: -100, max: 100), dy: 0))
//
//    }
//
    
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     for touch in touches{
         let location = touch.location(in: self)
    
         if let body = self.physicsWorld.body(at: location){
             isBallMoving = true
             if body.node?.name == "ball"{
                 isTouchingBall = true
                
                 touchedBall = body.node as? SKSpriteNode
                 touchLocation = location
                 }
            
             
             }
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
        
        if isBallMoving{
            cameraNode.position.y = sprite.position.y
        }
     
        if isTouchingBall{
            
            let dt:CGFloat = 1.0 / 60.0
            let distance = CGVector(dx: touchLocation.x-touchedBall.position.x, dy: touchLocation.y-touchedBall.position.y)
            let velocity = CGVector(dx: distance.dx/dt, dy: distance.dy/dt)
            touchedBall.physicsBody?.velocity = velocity
          
         
           
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
    
    
}

