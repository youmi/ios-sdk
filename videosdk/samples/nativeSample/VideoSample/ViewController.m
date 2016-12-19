//
//  ViewController.m
//  umvideoVideoSample
//
//  Created by ym on 16-8-10.
//  Copyright (c) 2016年 ym. All rights reserved.
//

#import "ViewController.h"
#import "UMVideoAd.h"
@interface ViewController ()

@end

@implementation ViewController
//
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UMVideoAd initAppID:@"01072fdea5e00921" appKey:@"6cca02634eb9f18e" cacheVideo:YES];
    
    //开启非wifi预缓存视频文件
    [UMVideoAd videoDownloadOnUNWifi:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonFullScreenPressed:) name:VideoFullButtonPressNotification object:nil];
    
    
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    //    bg2.jpg
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    image.image = [UIImage imageNamed:@"bg.jpg"];
    [self.view addSubview:image];
//
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake((width - 270)/2, height/2, 270, 54);
    [button1 setTitle:@"Full Screen Video" forState:UIControlStateNormal];
    
    [button1 setTitle:@"全屏模式" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:20];
    button1.layer.borderColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    button1.layer.borderWidth = 2.5;
    button1.backgroundColor = [UIColor clearColor];
    button1.layer.cornerRadius = 4;
    button1.layer.masksToBounds = YES;
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonShowPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake((width - 270)/2, CGRectGetMaxY(button1.frame)+15, 270, 54);
    [button2 setTitle:@"Custom Video" forState:UIControlStateNormal];
    [button2 setTitle:@"原生模式" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:20];
    button2.layer.borderColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    button2.layer.borderWidth = 2.5;
    button2.backgroundColor = [UIColor clearColor];
    button2.layer.cornerRadius = 4;
    button2.layer.masksToBounds = YES;
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(playVideoNotFullScreen:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake((width - 270)/2, CGRectGetMaxY(button2.frame)+15, 270, 54);
    [button3 setTitle:@"Custom Video" forState:UIControlStateNormal];
    [button3 setTitle:@"插页模式" forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:20];
    button3.layer.borderColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    button3.layer.borderWidth = 2.5;
    button3.backgroundColor = [UIColor clearColor];
    button3.layer.cornerRadius = 4;
    button3.layer.masksToBounds = YES;
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(spotVide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = CGRectMake((width - 185)/2, CGRectGetMaxY(button3.frame)+25, 185, 18);
    [button4 setTitle:@"Check Video Source" forState:UIControlStateNormal];
    [button4 setTitle:@"检查是否有广告" forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont systemFontOfSize:16];
//
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(cBIsHaveVideo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(button3.frame), CGRectGetWidth(button3.frame), 1)];
    line.backgroundColor = [UIColor whiteColor];
    [button3 addSubview:line];
    
}
//
//-(void)nativeVC{
//    NativeSampleController *nativc = [[NativeSampleController alloc]init];
////    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:nativc];
//    
//    [self presentViewController:nativc animated:YES completion:^{
//        
//    }];
//}
-(void)spotVide{
    [UMVideoAd videoSpotPlay:[[[UIApplication sharedApplication]keyWindow] rootViewController] videoSuperView:[[[UIApplication sharedApplication]keyWindow] rootViewController].view videoPlayFinishCallBackBlock:^(BOOL isFinishPlay){
        if (isFinishPlay) {
            NSLog(@"视频播放结束");
            //            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"视频播放结束" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            //            [alert show];
            //            [alert release];
        }else{
            NSLog(@"中途退出");
            //            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"中途退出" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            //            [alert show];
            //            [alert release];
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
        //        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"是否有效：%@",message] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        //        [alert show];
        //        [alert release];
    }];
}

 - (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonFullScreenPressed:(id)sender{
    NSNotification *notification = (NSNotification *)sender;
    BOOL isForFullScreen = [[notification object] boolValue];
    if (isForFullScreen) {
        NSLog(@"全屏幕: 全屏观看的时候需要把顶部的状态栏隐藏");
        NSLog(@"Full screen: your should hide status bar for full screen");
        [UIApplication sharedApplication].statusBarHidden = YES;
        //
    }else{
        NSLog(@"非全屏");
        NSLog(@"not full screen");
    }
}

- (IBAction)buttonShowPressed:(id)sender {

    [UMVideoAd videoPlay:self videoPlayFinishCallBackBlock:^(BOOL isFinishPlay){
        NSLog(@"播放结束");
        NSLog(@"video exit");
    } videoPlayConfigCallBackBlock:^(BOOL isLegal){
        NSLog(@"is legal：%d",isLegal);
    }];
    
}

- (IBAction)cBIsHaveVideo:(id)sender {
    /*
     isHaveVideoStatue的值目前有两个
     0：有视频可以播放
     1：暂时没有可播放视频
     2：网络状态不好
     */
    /*
     isHaveVideoStatue
     0：there are videos for playing
     1：there are no videos for playing
     2：network error
     */
    [UMVideoAd videoHasCanPlayVideo:^(int isHaveVideoStatue){
        NSLog(@"是否有视频：%d",isHaveVideoStatue);
        NSLog(@"is have video to play：%d",isHaveVideoStatue);
    }];
}


- (IBAction)playVideoNotFullScreen:(id)sender {
    UMBannerView *bannerView = [UMVideoAd videoBannerPlayerFrame:CGRectMake(0, self.view.frame.size.height - 55, self.view.frame.size.width, 50) videoBannerPlayCloseCallBackBlock:^(BOOL isLegal){
        NSLog(@"关闭banner");
        NSLog(@"close banner");
    }];
    [self.view addSubview:bannerView];
//
    [UMVideoAd videoPlay:self videoSuperView:self.view videoPlayerFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, (self.view.frame.size.width)*4/7) videoPlayFinishCallBackBlock:^(BOOL isFinishPlay){
        if (isFinishPlay) {
            NSLog(@"视频播放结束");
            NSLog(@"finish video play");
            
        }else{
            NSLog(@"中途退出");
            NSLog(@"video drop out");
        }
        
    } videoPlayConfigCallBackBlock:^(BOOL isLegal){
        NSString *message = @"";
        if (isLegal) {
            message = @"此次播放有效 is valid";
        }else{
            message = @"此次播放无效 is invalid ";
        }
        NSLog(@"是否有效：%@",message);
        NSLog(@"is valid：%@",message);
    }];
    
   
}
@end
