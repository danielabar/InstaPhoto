//
//  PhotoViewController.m
//  InstaPhoto
//
//  Created by Daniela Baron on 1/20/2014.
//  Copyright (c) 2014 DaniB. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageFileName]];
    imageView.frame = CGRectMake(10, 10, 300, 300);
    [self.view addSubview:imageView];
    
    UILabel *imageTitleLabel = [[UILabel alloc] init];
    imageTitleLabel.text = self.imageTitle;
    imageTitleLabel.frame = CGRectMake(10,320,300,40);
    [self.view addSubview:imageTitleLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
