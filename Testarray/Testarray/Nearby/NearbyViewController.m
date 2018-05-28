//
//  NearbyViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/20.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "NearbyViewController.h"
#import "ShowViewController.h"
#import "AllShowTableViewCell.h"
#import "CHInternshipModel.h"
#import "CHPartTimeJobModel.h"
#import "CHConst.h"
#import "AllShowPushViewController.h"
#import "CHTourModel.h"
@interface NearbyViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *nearbyTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *changType;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) NSMutableArray *showarray;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) UIButton *leftButton;
@end

@implementation NearbyViewController

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

- (UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.backgroundColor = [UIColor orangeColor];
        [_leftButton setTitle:@"桂林市" forState:UIControlStateNormal];
        [_leftButton setTintColor:[UIColor whiteColor]];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //[_sendButton addTarget:self action:@selector(sendClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return  _leftButton;
}

- (NSMutableArray *)showarray
{
    if (!_showarray) {
        _showarray = [[NSMutableArray alloc]init];
    }
    return _showarray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.nearbyTableView.delegate = self;
    self.nearbyTableView.dataSource = self;
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    self.nearbyTableView.tableFooterView = view;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.sendButton];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
    [self.nearbyTableView registerNib:[UINib nibWithNibName:@"AllShowTableViewCell" bundle:nil] forCellReuseIdentifier:@"showtable"];
    self.type = self.changType.selectedSegmentIndex;
    self.showarray = [[CHInternshipModel findAll]mutableCopy];
    [self.changType addTarget:self action:@selector(changTypeClick:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view from its nib.
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
    return self.showarray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"showtable"];
    cell.house = self.showarray[indexPath.row];
    [cell reloadImage];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllShowPushViewController *vc = [[AllShowPushViewController alloc]init];
    
    vc.model = self.showarray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)sendClick
{
   // [self.tableView reloadData];
    ShowViewController *show = [[ShowViewController alloc]init];
    
    if (self.type == 0) {
        show.type = CHTypeAllSX;
    } else if (self.type == 1){
        show.type = CHTypeAllJZ;
    } else {
        
        show.type = CHTypeAllTour;
    }
    //
    [self.navigationController pushViewController:show animated:YES];
}
- (void)changTypeClick:(UISegmentedControl *)sem
{
    switch (sem.selectedSegmentIndex) {
        case 0:
        {
            self.showarray = [[CHInternshipModel findAll]mutableCopy];
            self.type = sem.selectedSegmentIndex;
            [self.nearbyTableView reloadData];
        }
            
            break;
        case 1: {
            self.showarray = [[CHPartTimeJobModel findAll]mutableCopy];
            self.type = sem.selectedSegmentIndex;
            [self.nearbyTableView reloadData];
        }
            
            
            break;
        case 2:
        {
            self.showarray = [[CHTourModel findAll]mutableCopy];
            self.type = sem.selectedSegmentIndex;
            [self.nearbyTableView reloadData];
        }
            break;
            
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    switch (self.changType.selectedSegmentIndex) {
        case 0:
        {
            self.showarray = [[CHInternshipModel findAll]mutableCopy];
            //self.type = sem.selectedSegmentIndex;
            [self.nearbyTableView reloadData];
        }
            
            break;
        case 1: {
            self.showarray = [[CHPartTimeJobModel findAll]mutableCopy];
            //self.type = sem.selectedSegmentIndex;
            [self.nearbyTableView reloadData];
        }
            
            
            break;
            
        case 2:
        {
            self.showarray = [[CHTourModel findAll]mutableCopy];
            //self.type = sem.selectedSegmentIndex;
            [self.nearbyTableView reloadData];
        }
            break;
            
        default:
            break;
    }
}
@end
