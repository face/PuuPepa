//
//  PuuRootViewController.m
//  PuʻuPepa
//
//  Created by Rama McIntosh on 4/11/14.
//  Copyright (c) 2014 Meme Incorporated. All rights reserved.
//

#import "PuuRootViewController.h"

#import "PuuModelController.h"

#import "PuuDataViewController.h"

@interface PuuRootViewController ()
@property (readonly, strong, nonatomic) PuuModelController *modelController;
@end

@implementation PuuRootViewController

@synthesize modelController = _modelController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  // Configure the page view controller and add it as a child view controller.
  self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
  self.pageViewController.delegate = self;

  PuuDataViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
  NSArray *viewControllers = @[startingViewController];
  [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];

  self.pageViewController.dataSource = self.modelController;

  [self addChildViewController:self.pageViewController];
  [self.view addSubview:self.pageViewController.view];

  // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
  CGRect pageViewRect = self.view.bounds;
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
      pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0);
  }
  self.pageViewController.view.frame = pageViewRect;

  [self.pageViewController didMoveToParentViewController:self];

  // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
  self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PuuModelController *)modelController
{
     // Return the model controller object, creating it if necessary.
     // In more complex implementations, the model controller may be passed to the view controller.
    if (!_modelController) {
        _modelController = [[PuuModelController alloc] init];
    }
    return _modelController;
}

#pragma mark - UIPageViewController delegate methods

/*
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}
 */

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
  if (UIInterfaceOrientationIsPortrait(orientation) || ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)) {
      // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
      
      UIViewController *currentViewController = self.pageViewController.viewControllers[0];
      NSArray *viewControllers = @[currentViewController];
      [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
      
      self.pageViewController.doubleSided = NO;
      return UIPageViewControllerSpineLocationMin;
  }

  // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.

  [self.pageViewController setViewControllers:self.pageViewController.viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];


  return UIPageViewControllerSpineLocationMid;
}

@end
