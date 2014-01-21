//
//  FeedViewController.h
//  InstaPhoto
//
//  Created by Daniela Baron on 1/19/2014.
//  Copyright (c) 2014 DaniB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController

@property (strong, nonatomic) NSArray *photos;

- (void)showFavorites:(UIButton *)sender;

@end
