//
//  ViewController.m
//  Gesture Testing
//
//  Created by Stephen Anthony on 30/12/2015.
//  Copyright © 2015 Darjeeling Apps. All rights reserved.
//

#import "ViewController.h"
#import "SwipeView.h"

@interface ViewController () <SwipeViewDelegate>

@property (nonatomic, weak) IBOutlet SwipeView *swipeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.swipeView.delegate = self;
}

#pragma mark - SwipeViewDelegate
- (void)swipeViewDidSwipe:(SwipeView *)swipeView {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
