//
//  PuuPahiViewController.m
//  PuʻuPepa
//
//  Created by Rama McIntosh on 4/11/14.
//  Copyright (c) 2014 Meme Incorporated. All rights reserved.
//

#import "PuuPahiViewController.h"

@interface PuuPahiViewController ()

@end

@implementation PuuPahiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.label.hidden = YES;
  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)show:(id)sender {
  self.label.hidden = NO;
}

- (IBAction)doneAction:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];  
}

@end
