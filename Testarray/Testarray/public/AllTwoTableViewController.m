//
//  AllTwoTableViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/22.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "AllTwoTableViewController.h"
#import "HouseModel.h"
#import "CHStudyModel.h"
#import "CHResModel.h"
#import "CHInternshipModel.h"
#import "CHPartTimeJobModel.h"
#import "AllShowTableViewCell.h"
#import "ShowViewController.h"
#import "AllShowPushViewController.h"
#import "CHTableviewModel.h"
#import "CHTableviewModel.h"
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
    
    switch (self.type) {
        case CHTypeAllHouse:
            self.showArray = [[HouseModel findAll] mutableCopy];
            self.navigationItem.title = @"房屋租赁";
            break;
        case CHTypeAllStudy:
            self.showArray = [[CHStudyModel findAll] mutableCopy];
            self.navigationItem.title = @"学习";
            break;
        case CHTypeAllWPShop:
            self.showArray = [[CHResModel findAll]mutableCopy];
            self.navigationItem.title = @"物品交易";
            break;
        case CHTypeAllJZ:
            self.showArray = [[CHPartTimeJobModel findAll]mutableCopy];
            break;
            
            
        case CHTypeAllSX:
            self.showArray = [[CHInternshipModel findAll]mutableCopy];
            break;
            
        default:
            break;
    }
    
    //self.showArray = [[HouseModel findAll] mutableCopy];
    
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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    AllShowPushViewController *vc = [[AllShowPushViewController alloc]init];
    vc.model = self.showArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CHTableviewModel *model = self.showArray[indexPath.row];
//    return model.cellHeight;
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"pppppppp");
//        switch (self.type) {
//            case CHTypeAllHouse:
//            {
//                HouseModel *model = self.showArray[indexPath.row];
//                [model deleteObject];
//            }
//                break;
//            case CHTypeAllStudy:
//            {
//                CHStudyModel *model = self.showArray[indexPath.row];
//                [model deleteObject];
//            }
//
//                break;
//            case CHTypeAllWPShop:
//            {
//                CHResModel *model = self.showArray[indexPath.row];
//                [model deleteObject];
//            }
//                break;
//
//            default:
//                break;
//        }
        
        
    }];
    deleteRowAction.backgroundColor = [UIColor redColor];
    return @[deleteRowAction];
}

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
    ShowViewController *show = [[ShowViewController alloc]init];
    show.type = self.type;
    [self.navigationController pushViewController:show animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    switch (self.type) {
        case CHTypeAllHouse:
            self.showArray = [[HouseModel findAll] mutableCopy];
            self.navigationItem.title = @"房屋租赁";
            break;
        case CHTypeAllStudy:
            self.showArray = [[CHStudyModel findAll] mutableCopy];
            self.navigationItem.title = @"学习";
            break;
        case CHTypeAllWPShop:
            self.showArray = [[CHResModel findAll]mutableCopy];
            self.navigationItem.title = @"物品交易";
            break;
        case CHTypeAllJZ:
            self.showArray = [[CHPartTimeJobModel findAll]mutableCopy];
            break;
            
            
        case CHTypeAllSX:
            self.showArray = [[CHInternshipModel findAll]mutableCopy];
            break;
            
        default:
            break;
    }
    
    [self.tableView reloadData];
}
@end
