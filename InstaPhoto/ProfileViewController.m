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
    NSURL *URL = [NSURL URLWithString:@"http://echo.jsontest.com/firstName/Gregg/lastName/Pollack/city/Orlando/biography/blahblahblah/memberSince/November-2012"];
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
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Define a scroll view
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(320,480);
    
    // Still hardcode the user profile image because mock json service doesn't have it
    UIImageView *profileImageView = [[UIImageView alloc] init];
    profileImageView.frame = CGRectMake(20, 20, 100, 114);
    [profileImageView setImageWithURL:[NSURL URLWithString:@"http://animalwelfaretaiwan.webs.com/Cow_with_calf_dsc06514.jpg"]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [self.scrollView addSubview:profileImageView];
    
    // Load name from JSON
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(20, 140, 280, 40);
    nameLabel.text = [NSString stringWithFormat:@"Name: %@ %@", self.userProfile[@"firstName"], self.userProfile[@"lastName"]];
    [self.scrollView addSubview:nameLabel];
    
    // Load city from JSON
    UILabel *cityLabel = [[UILabel alloc] init];
    cityLabel.frame = CGRectMake(20,200,280,40);
    cityLabel.text = [NSString stringWithFormat:@"From: %@", self.userProfile[@"city"]];
    [self.scrollView addSubview:cityLabel];

    // Load biography from JSON
    UITextView *biography = [[UITextView alloc] init];
    biography.frame = CGRectMake(12,260,300,180);
    biography.font = [UIFont fontWithName:@"Helvetica" size:17];
    biography.editable = NO;
    biography.text = self.userProfile[@"biography"];
    [self.scrollView addSubview:biography];
    
    // Load member since from JSON
    UILabel *memberSinceLabel = [[UILabel alloc] init];
    memberSinceLabel.frame = CGRectMake(20,440,280,40);
    memberSinceLabel.text = [NSString stringWithFormat:@"Member since %@", self.userProfile[@"memberSince"]];
    [self.scrollView addSubview:memberSinceLabel];
    
    // Add scrolling view to main view
    [self.view addSubview:self.scrollView];
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
