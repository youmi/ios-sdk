//
//  BookTableViewCell.h
//  epub
//
//  Created by ym on 16-8-10.
//  Copyright (c) 2016年 ym. All rights reserved.
//

#import <UIKit/UIKit.h> 
@class BookData;
@interface NativeTableViewCell : UITableViewCell
@property (nonatomic,assign)UIView *nativeView;
@property (nonatomic,assign)int i;
-(void)showInfo; //显示内容
-(void)showNative; //显示原生广告
@end
