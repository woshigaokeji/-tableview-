//
//  ViewController.m
//  修改系统tableview分割线
//
//  Created by 马红涛 on 16/4/13.
//  Copyright © 2016年 马红涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *TableView;
@property(nonatomic,strong)NSMutableArray *DataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#warning UITableView设置全屏分隔线的几种方法比较
    [self DataSource];
    [self TableView];
    [self.view addSubview:self.TableView];
    [_DataSource addObject:@"猫猫和狗"];
    [_DataSource addObject:@"猫猫和狗"];
    [_DataSource addObject:@"猫猫和狗"];
    [_DataSource addObject:@"猫猫和狗"];
    [_DataSource addObject:@"猫猫和狗"];
    
    NSLog(@"哈哈哈哈!");
    NSLog(@"github good ");
    
}


#pragma mark --tableViewDelegate--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.DataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:indentifier];
    }
    cell.textLabel.text = self.DataSource[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"猫猫和狗.jpg"];
    //设置第3步  --调整(iOS8以上)view边距
    cell.layoutMargins = UIEdgeInsetsZero;
    
    return cell;
}

- (NSMutableArray *)DataSource {
    if (nil == _DataSource) {
        _DataSource = [[NSMutableArray alloc] init];
    }
    return _DataSource;
}

- (UITableView *)TableView {
    if (nil == _TableView) {
        _TableView = [[UITableView alloc] initWithFrame:self.view.frame];
        _TableView.delegate = self;
        _TableView.dataSource = self;
        _TableView.tableFooterView = [[UIView alloc] init];
        //设置这里3步中的每一步都可以达到不同的效果
        //设置第1步 --调整(iOS7以上)表格分割线边距
        _TableView.separatorInset = UIEdgeInsetsZero;
        //设置第2步 --调整(iOS8以上)view边距(或者在cell中设置preservesSuperviewLayoutMargins,二者等效)
        _TableView.layoutMargins = UIEdgeInsetsZero;
    }
    return _TableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
