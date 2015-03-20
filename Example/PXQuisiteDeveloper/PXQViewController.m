//
//  PXQViewController.m
//  PXQuisiteDeveloper
//
//  Created by Atanas Dragolov on 03/18/2015.
//  Copyright (c) 2014 Atanas Dragolov. All rights reserved.
//

#import "PXQViewController.h"
#import <PXQuisiteDeveloper/PXQuisiteDeveloper.h>
#import <PXQuisiteExtensions/PXQuisiteExtensions.h>

@interface PXQViewController ()

@end

@implementation PXQViewController

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

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    
    PXQArrayPreviewController * arr = [PXQArrayPreviewController new];
    
    PXQDictionaryPreviewController * dic = [PXQDictionaryPreviewController new];
    
    [self presentViewController:dic animated:YES completion:^{
        
        [dic dataBind:
         
         @{
           @"Screens" : @[
                   [[UIDevice currentDevice] dictionaryRepresentation],
                   [[UIScreen mainScreen] dictionaryRepresentation],
                   ]
           }
         ];
    }];
}

@end
