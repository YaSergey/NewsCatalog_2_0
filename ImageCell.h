//
//  ImageCell.h
//  NewsCatalog_2_0
//
//  Created by Sergey Yasnetsky on 15.03.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTextLabel;


@end
