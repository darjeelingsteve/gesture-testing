//
//  SwipeView.m
//  Gesture Testing
//
//  Created by Stephen Anthony on 30/12/2015.
//  Copyright © 2015 Darjeeling Apps. All rights reserved.
//

#import "SwipeView.h"

@implementation SwipeView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInit];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self commonInit];
    }
    
    return self;
}

#pragma mark - Private Methods
- (void)commonInit {
    UISwipeGestureRecognizer *downSwipeGestureRecogniser = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecogniserDidRecognise:)];
    downSwipeGestureRecogniser.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:downSwipeGestureRecogniser];
}

- (void)gestureRecogniserDidRecognise:(UIGestureRecognizer *)gestureRecogniser {
    [self.delegate swipeViewDidSwipe:self];
}

@end
