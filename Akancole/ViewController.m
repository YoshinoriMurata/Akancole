//
//  ViewController.m
//  Akancole
//
//  Created by Yoshinori Murata on 2014/07/10.
//  Copyright (c) 2014年 Yoshinori Murata. All rights reserved.
//

#import "ViewController.h"
//import titleSKScene.h for game title
#import "titleSKScene.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // setting up SKView
    SKView *skView = (SKView *)self.view;
    // creating SKScene
    SKScene *scene = [titleSKScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    // Displaying scene created by SKView
    [skView presentScene:scene];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Make status bar disappear
-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
