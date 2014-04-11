//
//  PuuModelController.h
//  PuʻuPepa
//
//  Created by Rama McIntosh on 4/11/14.
//  Copyright (c) 2014 Meme Incorporated. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PuuDataViewController;

@interface PuuModelController : NSObject <UIPageViewControllerDataSource>

- (PuuDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(PuuDataViewController *)viewController;

@end
