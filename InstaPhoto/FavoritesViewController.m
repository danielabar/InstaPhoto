//
//  FavoritesViewController.m
//  InstaPhoto
//
//  Created by Daniela Baron on 1/19/2014.
//  Copyright (c) 2014 DaniB. All rights reserved.
//

#import "FavoritesViewController.h"
#import "ProfileViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Favorites";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    // Logo image as static display
    UIImageView *tryiosView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    [tryiosView setContentMode:UIViewContentModeTop];
    tryiosView.frame = self.view.frame;
    [self.view addSubview:tryiosView];
    
    // Logo image as clickable button
    /*
    UIButton *tryiosView = [UIButton buttonWithType:UIButtonTypeCustom];
    [tryiosView setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateNormal];
    [tryiosView setImage:[UIImage imageNamed:@"logo.jpg"] forState:UIControlStateHighlighted];
    [self.view addSubview:tryiosView];
     */
    
    UIButton *profileButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    profileButton.frame = CGRectMake(60, 100, 200, 44);
    [profileButton setTitle:@"Profile" forState:UIControlStateNormal];
    [profileButton addTarget:self action:@selector(showProfile:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:profileButton];
}

- (void)showProfile:(UIButton *)sender
{
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:profileViewController animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
