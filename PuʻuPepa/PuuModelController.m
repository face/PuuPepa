//
//  PuuModelController.m
//  PuʻuPepa
//
//  Created by Rama McIntosh on 4/11/14.
//  Copyright (c) 2014 Meme Incorporated. All rights reserved.
//

#import "PuuModelController.h"

#import "PuuMeaViewController.h"
#import "PuuHoloholonaViewController.h"


/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface PuuModelController()
@property (strong, nonatomic) NSMutableArray *pages;
@end

@implementation PuuModelController

- (id)init
{
    self = [super init];
    if (self) {
      _pages = [[NSMutableArray alloc] init];
    }
    return self;
}

- (PuuDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
  
  if ( index >= 2 )
    return nil;
  
    if ( index >= [self.pages count]) {
        PuuMeaViewController *meaview = [[PuuMeaViewController alloc] initWithNibName:@"PuuMeaViewController" bundle:nil];
        [self.pages addObject: meaview];
        PuuHoloholonaViewController *holoview = [[PuuHoloholonaViewController alloc] initWithNibName:@"PuuHoloholonaViewController" bundle:nil];
        [self.pages addObject: holoview];
    }
    return self.pages[index];;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
  if ([viewController class] == [PuuHoloholonaViewController class])
    return [self.pages objectAtIndex:0];
  else
    return nil;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
  if ([viewController class] == [PuuMeaViewController class])
    return [self.pages objectAtIndex:1];
  else
    return nil;
}

@end
