//
//  ProfileViewController.m
//  InstaPhoto
//
//  Created by Daniela Baron on 1/19/2014.
//  Copyright (c) 2014 DaniB. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Profile";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_profile"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *profileImageView = [[UIImageView alloc] init];
    profileImageView.frame = CGRectMake(20, 20, 100, 114);
    [profileImageView setImageWithURL:[NSURL URLWithString:@"http://animalwelfaretaiwan.webs.com/Cow_with_calf_dsc06514.jpg"]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [self.view addSubview:profileImageView];
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor yellowColor];
//    UIImageView *greggView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user4"]];
//    //[greggView setContentMode:UIViewContentModeScaleAspectFit];
//    greggView.frame = CGRectMake(20, 20, 100, 114);
//    [self.view addSubview:greggView];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
