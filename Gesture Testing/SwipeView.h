//
//  SwipeView.h
//  Gesture Testing
//
//  Created by Stephen Anthony on 30/12/2015.
//  Copyright © 2015 Darjeeling Apps. All rights reserved.
//

@import UIKit;

@protocol SwipeViewDelegate;

/*!
 Our custom view that contains a swipe gesture recogniser.
 */
@interface SwipeView : UIView

/*!
 The delegate of our view.
 */
@property (nonatomic, weak) id<SwipeViewDelegate> delegate;

@end

@protocol SwipeViewDelegate <NSObject>

/*!
 The message sent when a user swipes on the view.
 @param swipeView The `SwipeView` sending the message.
 */
- (void)swipeViewDidSwipe:(SwipeView *)swipeView;

@end
