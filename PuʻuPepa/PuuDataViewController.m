//
//  PuuDataViewController.m
//  PuʻuPepa
//
//  Created by Rama McIntosh on 4/11/14.
//  Copyright (c) 2014 Meme Incorporated. All rights reserved.
//

#import "PuuDataViewController.h"

@interface PuuDataViewController ()

@end

@implementation PuuDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
