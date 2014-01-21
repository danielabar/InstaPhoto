//
//  Photo.h
//  InstaPhoto
//
//  Created by Daniela Baron on 1/20/2014.
//  Copyright (c) 2014 DaniB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detail;
@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSString *thumbnail;

@end
