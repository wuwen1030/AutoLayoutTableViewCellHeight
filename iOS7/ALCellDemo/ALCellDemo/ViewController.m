//
//  ViewController.m
//  ALCellDemo
//
//  Created by Ben on 15/2/11.
//  Copyright (c) 2015年 X-Team. All rights reserved.
//

#import "ViewController.h"

@interface MyCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titelLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation MyCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    self.titelLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.titelLabel.frame);
    self.contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentLabel.frame);
}

@end

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = @[@"短文本",
                   @"这是一个很短的文本，估计只有一行",
                   @"这个文本有点长，确实有点长，估计会有两行吧，应该会有两行的，对！",
                   @"楼上的，你觉得你很长吗？敢亮出来比划比划么？小短短，我才是最长的，大概要有三行吧，楼下的，你说是不是啊？"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.titelLabel.text = self.items[indexPath.row];
    cell.contentLabel.text = self.items[indexPath.row];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static MyCell *cell = nil;
    if (cell == nil)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    
    cell.titelLabel.text = self.items[indexPath.row];
    cell.contentLabel.text = self.items[indexPath.row];
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];

    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height + 1;
}

@end
