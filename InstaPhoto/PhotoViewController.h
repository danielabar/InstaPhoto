//
//  PhotoViewController.h
//  InstaPhoto
//
//  Created by Daniela Baron on 1/20/2014.
//  Copyright (c) 2014 DaniB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface PhotoViewController : UIViewController

@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) NSString *imageFileName;
@property (strong, nonatomic) NSString *imageTitle;

@end
