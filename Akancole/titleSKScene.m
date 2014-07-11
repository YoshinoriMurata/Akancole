//
//  titleSKScene.m
//  Akancole
//
//  Created by Yoshinori Murata on 2014/07/10.
//  Copyright (c) 2014年 Yoshinori Murata. All rights reserved.
//

#import "titleSKScene.h"
//import mainSKScene.h for main scene
#import "mainSKScene.h"

@interface titleSKScene (){
    //Label fot start scene
    SKLabelNode *startSKLabel;
}
@end

@implementation titleSKScene

-(instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        //setting up background color
        self.backgroundColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.6 alpha:1];
        //title
        SKLabelNode *mySKLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
        mySKLabel.text = @"AKANCOLLE";
        mySKLabel.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:mySKLabel];
        //start label
        startSKLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
        startSKLabel.text = @"START";
        startSKLabel.position = CGPointMake(size.width/2, size.height/2 - 100);
        [self addChild:startSKLabel];
    }
    return self;
}

//Switch to main scene after start label is pressed
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //getting position that users pressed
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    //After start label is touched
    if ([startSKLabel containsPoint:location]) {
        //creating main scene
        mainSKScene *scene = [[mainSKScene alloc] initWithSize:self.size];
        //opens the door
        SKTransition *transition = [SKTransition doorsOpenHorizontalWithDuration:1];
        [self.view presentScene:scene transition:transition];
    }
}

@end
