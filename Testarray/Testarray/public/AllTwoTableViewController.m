//
//  AllTwoTableViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/22.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "AllTwoTableViewController.h"
#import "HouseModel.h"
#import "AllShowTableViewCell.h"

@interface AllTwoTableViewController ()
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) NSMutableArray *showArray;
@end

@implementation AllTwoTableViewController
- (UIButton *)sendButton
{
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.backgroundColor = [UIColor orangeColor];
        [_sendButton setTitle:@"发布" forState:UIControlStateNormal];
        [_sendButton setTintColor:[UIColor whiteColor]];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sendButton addTarget:self action:@selector(sendClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}

- (NSMutableArray *)showArray
{
    if (!_showArray) {
        _showArray = [[NSMutableArray alloc]init];
    }
    return _showArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.showArray = [[HouseModel findAll] mutableCopy];
    HouseModel *hhhh = [[HouseModel alloc]init];
    hhhh = self.showArray[1];
    NSLog(@"%@",hhhh.messageHouse);
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.tableFooterView = view;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.sendButton];
    [self.tableView registerNib:[UINib nibWithNibName:@"AllShowTableViewCell" bundle:nil] forCellReuseIdentifier:@"showtable"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.showArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AllShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"showtable" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.house = self.showArray[indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)sendClick
{
    [self.tableView reloadData];
}
@end
