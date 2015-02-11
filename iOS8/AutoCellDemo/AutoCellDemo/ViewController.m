//
//  ViewController.m
//  AutoCellDemo
//
//  Created by Ben on 14/10/29.
//  Copyright (c) 2014年 Tuniu.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.items = @[@{@"title":@"Hello",@"content":@"I answered the phone and this voice went, Hello? Is that Alison?"},
                   @{@"title":@"World",@"content":@"You can use world in expressions such as the Arab world ,the western world, and the ancient world to refer to a particular group of countries or a particular period in history."},];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:1];
    UILabel *contentLabel = (UILabel *)[cell.contentView viewWithTag:2];
    NSDictionary *item = self.items[indexPath.row];
    titleLabel.text = item[@"title"];
    contentLabel.text = item[@"content"];
    return cell;
}

@end
