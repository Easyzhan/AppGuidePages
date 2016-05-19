//
//  GuidAnimation.m
//  AppGuidDemo
//
//  Created by Zin_戦 on 16/5/19.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import "GuidAnimation.h"
#define GuidAnimationTime  1

@implementation GuidAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return GuidAnimationTime;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    to.view.layer.zPosition = -1;
    [containerView addSubview:to.view];
    
    NSTimeInterval animationTime = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:animationTime delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
       from.view.transform = CGAffineTransformMakeScale(2.0, 2.0);
       from.view.alpha = 0.0;
       
    } completion:^(BOOL finished) {
        
        if (finished)
        {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            to.view.layer.zPosition = 0;
        }
    }];
}


@end
