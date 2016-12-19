//
//  NativeViewController.m
//  VideoSample
//
//  Created by ym on 16-8-10.
//  Copyright (c) 2016年 ym. All rights reserved.
//

#import "NativeSampleController.h"
#import "UMVideoAd.h"
#import "NativeViewController.h"
@interface NativeSampleController ()

@end

@implementation NativeSampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UMVideoAd preloadNative];//预加载原生视图，原生视图只存在一份，在同一个App生命周期中不能同时Add给两个父view
    
    
    
    // Do any additional setup after loading the view.
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    //    bg2.jpg
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    image.image = [UIImage imageNamed:@"bg.jpg"];
    [self.view addSubview:image];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, height * 0.4, width, 30)];
    label.text = @"有米视频";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:25];
    //    label.textColor = [UIColor colorWithRed:63/255.0 green:136/255.0 blue:216/255.0 alpha:1.0];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame)+5, width, 20)];
    label.text =[UMVideoAd sdkVersion];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    //    label.textColor = [UIColor colorWithRed:63/255.0 green:136/255.0 blue:216/255.0 alpha:1.0];
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    
//    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button1.frame = CGRectMake((width - 164)/2, CGRectGetMaxY(label.frame)+15, 164, 36);
//    [button1 setTitle:@"信息流" forState:UIControlStateNormal];
//    button1.titleLabel.font = [UIFont systemFontOfSize:14];
//    button1.backgroundColor = [UIColor colorWithRed:19/255.0 green:159/255.0 blue:231/255.0 alpha:1.0];
//    button1.layer.cornerRadius = 4;
//    button1.layer.masksToBounds = YES;
//    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button1 addTarget:self action:@selector(buttonPresentNativeVCButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button1];
    
    
    
//    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button2.frame = CGRectMake((width - 164)/2, CGRectGetMaxY(label.frame)+15, 164, 36);
//    [button2 setTitle:@"插页视频" forState:UIControlStateNormal];
//    button2.titleLabel.font = [UIFont systemFontOfSize:14];
//    button2.backgroundColor = [UIColor colorWithRed:224/255.0 green:58/255.0 blue:56/255.0 alpha:1.0];
//    button2.layer.cornerRadius = 4;
//    button2.layer.masksToBounds = YES;
//    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button2 addTarget:self action:@selector(playSpotVideo) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake((width - 164)/2, CGRectGetMaxY(label.frame)+15, 164, 36);
    [button3 setTitle:@"前贴片" forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:14];
    button3.backgroundColor =[UIColor colorWithRed:224/255.0 green:58/255.0 blue:56/255.0 alpha:1.0];
    button3.layer.cornerRadius = 4;
    button3.layer.masksToBounds = YES;
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(playVideoNotFullScreen:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIImage *closeImg = [UIImage imageNamed:@"btn_back.png"];
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 70, closeImg.size.width/2, closeImg.size.height/2)];
    [closeBtn setImage:closeImg forState:UIControlStateNormal];
    [closeBtn setTitle:@"原生案例" forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeSelf) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, height - 50, width, 40)];
    label.text = @"Powered by ym";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor grayColor];
    //    label.textColor = [UIColor colorWithRed:21/255.0 green:166/255.0 blue:114/255.0 alpha:1.0];
    [self.view addSubview:label];
}

- (IBAction)buttonPresentNativeVCButtonPressed:(id)sender {
    NativeViewController *nvv = [[NativeViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:nvv];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}
- (IBAction)playVideoNotFullScreen:(id)sender {
    UMBannerView *bannerView = [UMVideoAd videoBannerPlayerFrame:CGRectMake(0, self.view.frame.size.height - 55, self.view.frame.size.width, 50) videoBannerPlayCloseCallBackBlock:^(BOOL isLegal){
        NSLog(@"关闭banner");
    }];
    [self.view addSubview:bannerView];
    //
    [UMVideoAd videoPlay:self videoSuperView:self.view videoPlayerFrame:CGRectMake(0, 150, self.view.frame.size.width, (self.view.frame.size.width)*4/7) videoPlayFinishCallBackBlock:^(BOOL isFinishPlay){
        if (isFinishPlay) {
            NSLog(@"视频播放结束");
            
        }else{
            NSLog(@"中途退出");
            
        }
        
    } videoPlayConfigCallBackBlock:^(BOOL isLegal){
        NSString *message = @"";
        if (isLegal) {
            message = @"此次播放有效";
        }else{
            message = @"此次播放无效";
        }
        NSLog(@"是否有效：%@",message);
        
    }];
    
    
}
-(void)playSpotVideo{
    [UMVideoAd videoSpotPlay:self videoSuperView:self.view videoPlayFinishCallBackBlock:^(BOOL isFinishPlay){
        if (isFinishPlay) {
            NSLog(@"视频播放结束");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"视频播放结束" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }else{
            NSLog(@"中途退出");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"中途退出" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
        
    } videoPlayConfigCallBackBlock:^(BOOL isLegal){
        //注意：  isLegal在（app有联网，并且注册的appkey后台审核通过）的情况下才返回yes, 否则都是返回no.
        NSString *message = @"";
        if (isLegal) {
            message = @"此次播放有效";
        }else{
            message = @"此次播放无效";
        }
        //                UIImage *image = [MobiVideoAd oWVideoImage];
        NSLog(@"是否有效：%@",message);
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"是否有效：%@",message] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }];
    
}

-(void)closeSelf{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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

@end
