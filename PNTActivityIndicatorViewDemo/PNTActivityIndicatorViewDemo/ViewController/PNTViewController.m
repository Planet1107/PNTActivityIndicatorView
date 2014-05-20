//
//  PNTViewController.m
//  PNTActivityIndicatorViewDemo
//
//  Created by Planet 1107
//  Copyright (c) 2014 Planet 1107. All rights reserved.
//

#import "PNTViewController.h"
#import "MBProgressHUD.h"
#import "PNTActivityIndicator.h"

@interface PNTViewController ()

@end

@implementation PNTViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    MBProgressHUD *hud = [PNTActivityIndicator customActivityHUD];
    [self.view addSubview:hud];
    [hud show:YES];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
