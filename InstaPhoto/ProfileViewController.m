//
//  ProfileViewController.m
//  InstaPhoto
//
//  Created by Daniela Baron on 1/19/2014.
//  Copyright (c) 2014 DaniB. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"
#import "AFHTTPRequestOperation.h"

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
    NSURL *URL = [NSURL URLWithString:@"http://echo.jsontest.com/firstName/Gregg/lastName/Pollack/city/Orlando"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                         initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation
        setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@", responseObject);
            // TODO: Load profile data from responseObject JSON
            self.userProfile = responseObject;
            [self requestSuccessful];
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }
     ];
    [operation start];
}

- (void)requestSuccessful
{
    // Still hardcode the user profile image because mock json service doesn't have it
    UIImageView *profileImageView = [[UIImageView alloc] init];
    profileImageView.frame = CGRectMake(20, 20, 100, 114);
    [profileImageView setImageWithURL:[NSURL URLWithString:@"http://animalwelfaretaiwan.webs.com/Cow_with_calf_dsc06514.jpg"]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [self.view addSubview:profileImageView];
    
    // Load remainder of user profile
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(20, 140, 280, 40);
    nameLabel.text = [NSString stringWithFormat:@"Name: %@ %@", self.userProfile[@"firstName"], self.userProfile[@"lastName"]];
    [self.view addSubview:nameLabel];
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
//    UIImageView *profileImageView = [[UIImageView alloc] init];
//    profileImageView.frame = CGRectMake(20, 20, 100, 114);
//    [profileImageView setImageWithURL:[NSURL URLWithString:@"http://animalwelfaretaiwan.webs.com/Cow_with_calf_dsc06514.jpg"]
//                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
//    [self.view addSubview:profileImageView];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
