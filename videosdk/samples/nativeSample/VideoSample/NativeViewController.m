//
//  NativeViewController.m
//  VideoSDK
//
//  Created by ym on 16-8-10.
//  Copyright (c) 2016年 ym. All rights reserved.
//

#import "NativeViewController.h"
#import "NativeTableViewCell.h"
#import "UMVideoAd.h"
@interface NativeViewController ()
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]
                                initWithTitle:@"退出"
                                style:UIBarButtonItemStyleBordered
                                target:self
                                action:@selector(closeSelf)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    self.title = @"信息流";
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height) ];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor =  [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
  
    [self.view addSubview:self.tableView];
    
}

-(void)closeSelf{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%d",indexPath.row);
    if (indexPath.row == 7) {
        return [UMVideoAd getNativeCellHeight];//获取信息流高度
    }
    return 111;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NativeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[NativeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    NSLog(@"%d",indexPath.row);
    if (indexPath.row == 7) {
        [cell showNative];//显示原生广告
    }else{
        [cell showInfo];
    }
//
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(!decelerate){
        NSLog(@"滚动停止");
        [UMVideoAd relative];
    }
}
// 滚动停止时，触发该函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating  -   End of Scrolling.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
