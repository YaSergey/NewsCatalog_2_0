//
//  NewsData.h
//  news
//
//  Created by Sergey Yasnetsky on 11.03.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NCData : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *createdOn;
@property (nonatomic, copy) NSString *author;

+(NSArray *)fetchData;


@end

//#ifndef news_NewsData_h
//#define news_NewsData_h
// #endif
