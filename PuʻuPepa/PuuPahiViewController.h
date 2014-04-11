//
//  PuuPahiViewController.h
//  PuʻuPepa
//
//  Created by Rama McIntosh on 4/11/14.
//  Copyright (c) 2014 Meme Incorporated. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PuuPahiViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)show:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *DoneButton;

- (IBAction)doneAction:(id)sender;

@end
