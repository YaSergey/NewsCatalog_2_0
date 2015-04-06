//
//  ViewController.h
//  NewsCatalog_2_0
//
//  Created by Sergey Yasnetsky on 15.03.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

{
    NSArray *_data;    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

