//
//  SwipeViewTests.m
//  Gesture Testing
//
//  Created by Stephen Anthony on 30/12/2015.
//  Copyright © 2015 Darjeeling Apps. All rights reserved.
//

@import XCTest;
@import UIKit;
#import "SwipeView.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
#import <objc/runtime.h>
#import <objc/message.h>

/*!
 A fake delegate object for testing the `SwipeView` behaviour when swiped.
 */
@interface FakeDelegate : NSObject<SwipeViewDelegate>

/*!
 A `BOOL` indicating whether the swipe delegate message was received.
 */
@property (nonatomic) BOOL swipeDelegateMessageReceived;

@end

@interface SwipeViewTests : XCTestCase

@property (nonatomic) SwipeView *swipeView;
@property (nonatomic) FakeDelegate *fakeDelegate;

@end

@implementation SwipeViewTests

- (void)setUp {
    [super setUp];
    self.swipeView = [[SwipeView alloc] initWithFrame:CGRectZero];
    self.fakeDelegate = [[FakeDelegate alloc] init];
    self.swipeView.delegate = self.fakeDelegate;
}

- (void)tearDown {
    self.swipeView = nil;
    self.fakeDelegate = nil;
    [super tearDown];
}

- (void)testSwipingSendsTheExpectedDelegateMessage {
    UIGestureRecognizer *gestureRecogniser = self.swipeView.gestureRecognizers.firstObject;
    gestureRecogniser.state = UIGestureRecognizerStateChanged;
    gestureRecogniser.state = UIGestureRecognizerStateEnded;
    /**
     This assert will fail as the gesture recogniser will only fire its actions
     in the next cycle of the runloop.
     */
    XCTAssertTrue(self.fakeDelegate.swipeDelegateMessageReceived);
}

- (void)testSwipingSendsTheExpectedDelegateMessagezzz {
    UIGestureRecognizer *gestureRecogniser = self.swipeView.gestureRecognizers.firstObject;
    [self forceGestureRecognitionForGestureRecogniser:gestureRecogniser];
    XCTAssertTrue(self.fakeDelegate.swipeDelegateMessageReceived);
}

- (void)forceGestureRecognitionForGestureRecogniser:(UIGestureRecognizer *)gestureRecogniser {
    Class gestureRecogniserTarget = NSClassFromString(@"UIGestureRecognizerTarget");
    Ivar targetIvar = class_getInstanceVariable(gestureRecogniserTarget, "_target");
    Ivar actionIvar = class_getInstanceVariable(gestureRecogniserTarget, "_action");
    
    for (id gestureRecogniserTarget in [gestureRecogniser valueForKey:@"targets"]) {
        id target = object_getIvar(gestureRecogniserTarget, targetIvar);
        SEL action = (__bridge void *)object_getIvar(gestureRecogniserTarget, actionIvar);
        void (*actionMethod)(id, SEL, id) = (void (*)(id, SEL, id))objc_msgSend;
        actionMethod(target, action, gestureRecogniser);
    }
}

@end

@implementation FakeDelegate

#pragma mark - SwipeViewDelegate
- (void)swipeViewDidSwipe:(SwipeView *)swipeView {
    self.swipeDelegateMessageReceived = YES;
}

@end
