//
//  AllShowPushViewController.m
//  Testarray
//
//  Created by feirui on 2018/5/23.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "AllShowPushViewController.h"
#import "AllShowTableViewCell.h"
#import "AllShowPushTableViewCell.h"
#import "CHCommentModel.h"
@interface AllShowPushViewController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;
@property (nonatomic, strong) NSMutableArray *commentArray;
//@property (weak, nonatomic) IBOutlet UITextField *commentTextFile;

@end

@implementation AllShowPushViewController

- (NSMutableArray *)commentArray
{
    if (!_commentArray) {
        _commentArray = [[NSMutableArray alloc]init];
    }
    
    return _commentArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupTableViewHeard];
    self.commentArray = [[CHCommentModel findAll] mutableCopy];
    [self.commentTableView registerNib:[UINib nibWithNibName:@"AllShowPushTableViewCell" bundle:nil] forCellReuseIdentifier:@"pushcell"];
    self.commentTableView.delegate = self;
    self.commentTableView.dataSource = self;
    self.commentTextField.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupTableViewHeard
{
    UIView *header = [[UIView alloc]init];
    AllShowTableViewCell *cell = [AllShowTableViewCell cell];
    cell.house = self.model;
    [header addSubview:cell];
    
    //self.commentTableView.tableHeaderView = header;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    self.commentTableView.tableFooterView = view;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllShowPushTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pushcell"];
    cell.model = self.commentArray[indexPath.row];
    return cell;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    
    NSUserDefaults *user = [[NSUserDefaults alloc]init];
    
    NSString *getUsername = [user objectForKey:@"id"];
    
    CHCommentModel *comment = [[CHCommentModel alloc]init];
    
    comment.name = getUsername;
    
    comment.mesageText = textField.text;
    
    [comment save];
    
    if ([comment save]) {
        [self.commentTableView reloadData];
    }
    
    return YES;
}
@end
