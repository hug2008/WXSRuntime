//
//  ViewController.m
//  WXSRuntime
//
//  Created by 王小树 on 16/4/18.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_nameArr;
    
}
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    _nameArr = @[@"mode",@" ",@" ",@"message"];

    
}
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
#pragma mark Delegate  and Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _nameArr[indexPath.row];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            [TestModel forTest];
        }
            break;
        case 1: {
            [UIViewController forTest];
        }
            break;
        case 2:{
            [NSObject logforTest];
        }
        case 3:{
            [WXSMessage test];
        }
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
