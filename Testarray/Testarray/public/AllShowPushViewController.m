//
//  AllShowPushViewController.m
//  Testarray
//
//  Created by feirui on 2018/5/23.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#define CHScreenW [UIScreen mainScreen].bounds.size.width
#define CHScreenH [UIScreen mainScreen].bounds.size.height

#import "AllShowPushViewController.h"
#import "AllShowTableViewCell.h"
#import "AllShowPushTableViewCell.h"
#import "CHCommentModel.h"
#import "UIView+CHExtension.h"
@interface AllShowPushViewController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;
@property (nonatomic, strong) NSMutableArray *commentArray;
//@property (weak, nonatomic) IBOutlet UITextField *commentTextFile;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFiledBottom;

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
    
    //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyChangeShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyChangHide:) name:UIKeyboardWillHideNotification object:nil];
    
    //self.commentTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    CGRect frame= [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    self.textFiledBottom.constant = CHScreenH - frame.origin.y;
    
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    self.commentTableView.contentInset = UIEdgeInsetsMake(0, 0, frame.size.height, 0);
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupTableViewHeard
{
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CHScreenW, 300)];
    AllShowTableViewCell *cell = [AllShowTableViewCell cell];
    cell.house = self.model;
    cell.size = CGSizeMake(CHScreenW, 300);
    [header addSubview:cell];
    
    self.commentTableView.tableHeaderView = header;
    
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
    
    //[comment save];
    if ([textField.text isEqualToString:@""]) {
        return NO;
    }
    if ([comment save]) {
        textField.text = @"";
        self.commentArray = [[CHCommentModel findAll] mutableCopy];
        [self.commentTableView reloadData];
    }
    
    return YES;
}

- (void)keyChangeShow:(NSNotification *)note
{
    CGRect frame= [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    self.textFiledBottom.constant += frame.size.height  ;
    
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
               
               
               
               //[@"UIKeyboardAnimationDurationUserInfoKey"];
    //id *bottom = info[@"UIKeyboardFrameBeginUserInfoKey"];
}
- (void)keyChangHide:(NSNotification *)note
{
    CGRect frame= [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    self.textFiledBottom.constant = 0;
    
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (void)settupKeyboardBootm:(CGFloat)bottom time:(NSUInteger)time
{
    [UIView animateWithDuration:time animations:^{
        self.textFiledBottom.constant += bottom;
    } completion:nil];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
   
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
    
    
    
}

















@end
