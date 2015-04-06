//
//  ViewController.m
//  NewsCatalog_2_0
//
//  Created by Sergey Yasnetsky on 15.03.15.
//  Copyright (c) 2015 Sergey Yasnetsky. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"
#import "DetailViewController.h"
#import "RSSParser.h"
#import "UIImageView+AFNetworking.h"
 

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"ITDox";
    
    // http://itdox.ru/feed/
    
    NSURL *url = [NSURL URLWithString:@"http://itdox.ru/feed/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
    [RSSParser parseRSSFeedForRequest:request success:^(NSArray *feedItems) {
        _data = feedItems;
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);

    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:  (NSInteger)section;
{
    return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
   
    static NSString *const ImageCellId = @"ImageCell";
    
    
ImageCell *cell = [tableView dequeueReusableCellWithIdentifier: ImageCellId];
    
    RSSItem *item = [_data objectAtIndex: indexPath.row];
    
    cell.cellTextLabel.text = item.title;
    NSArray *images = [item imagesFromContent];
    NSString  *imageURLString = [images objectAtIndex:0];
    NSURL *imageURL = [NSURL URLWithString:imageURLString];
    [cell.cellImageView setImageWithURL:imageURL];
      
       return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue %@", segue.identifier); 

    NSIndexPath  *indexPath = [self.tableView indexPathForSelectedRow];
    
    if (indexPath)
    {
        RSSItem *item = [_data objectAtIndex: indexPath.row];
        NSLog(@"%@", item.title);
    [segue.destinationViewController setDetail:item];
    }
}
@end
