//
//  mainSKScene.m
//  Akancole
//
//  Created by Yoshinori Murata on 2014/07/10.
//  Copyright (c) 2014年 Yoshinori Murata. All rights reserved.
//

#import "mainSKScene.h"
//import titleSKScene
#import "titleSKScene.h"

@interface mainSKScene(){
    //Declaring exit label
    SKLabelNode *exitLabel;
    //items number
    int itemID;
    //items
    SKSpriteNode *kanmusu;
}
@end

@implementation mainSKScene

-(instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        //background color
        self.backgroundColor = [UIColor colorWithRed:0.3 green:0.1 blue:0 alpha:1];
        //Displaying EXIT label
        exitLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
        exitLabel.text = @"EXIT";
        exitLabel.position = CGPointMake(50, size.height - 50);
        [self addChild:exitLabel];
        
        //setting up game field
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, 0, size.width, size.height)];
        
        //enemy1
        SKSpriteNode *enemy1 = [SKSpriteNode spriteNodeWithImageNamed:@"naka"];
        enemy1.position = CGPointMake(100, 100);
        enemy1.size = CGSizeMake(30, 60);
        SKPhysicsBody *pbody1 = [SKPhysicsBody bodyWithRectangleOfSize:enemy1.size];
        enemy1.physicsBody = pbody1;
        [self addChild:enemy1];
        
        //enemy2
        SKSpriteNode *enemy2 = [SKSpriteNode spriteNodeWithImageNamed:@"naka"];
        enemy2.position = CGPointMake(200, 200);
        enemy2.size = CGSizeMake(30, 60);
        SKPhysicsBody *pbody2 = [SKPhysicsBody bodyWithRectangleOfSize:enemy2.size];
        enemy2.physicsBody = pbody2;
        [self addChild:enemy2];
        
        //enemy3
        SKSpriteNode *enemy3 = [SKSpriteNode spriteNodeWithImageNamed:@"naka"];
        enemy3.position = CGPointMake(300, 300);
        enemy3.size = CGSizeMake(30, 60);
        SKPhysicsBody *pbody3 = [SKPhysicsBody bodyWithRectangleOfSize:enemy3.size];
        enemy3.physicsBody = pbody3;
        [self addChild:enemy3];
        
        //reset item ID
        itemID = 0;
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NSArray *itemname = @[@"tanikaze",@"Z1",@"Z3"];
    
    //getting position
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    if (itemID < itemname.count) {
        //creating sprite for getting position
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:itemname[itemID]];
        sprite.position = location;
        sprite.size = CGSizeMake(40, 52);
        //setting up object size
        SKPhysicsBody *pbody = [SKPhysicsBody bodyWithRectangleOfSize:sprite.size];
        //bouces by 0.8
        pbody.restitution = 0.8;
        //direction of pushing
        pbody.velocity = CGVectorMake(300, 300);
        //setting sprite for body
        sprite.physicsBody = pbody;
        //displaying sprite
        [self addChild:sprite];
    }
    //counting up items
    itemID = itemID + 1;
    
}
@end
