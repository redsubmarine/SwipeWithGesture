//
//  ViewController.m
//  SwipeWithGesture
//
//  Created by 양 원석 on 2013. 7. 25..
//  Copyright (c) 2013년 양 원석. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;

@property (assign, nonatomic) CGFloat initialConstant;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _initialConstant = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)panGestureHandler:(UIPanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        _initialConstant = self.leftConstraint.constant;
    }
    CGPoint translation = [gesture translationInView:self.view];
    CGFloat constant = _initialConstant + translation.x;
    
    if (constant<0) constant =0;
    if (constant>200) constant=200;
    
    self.leftConstraint.constant = constant;
}
@end
