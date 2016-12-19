//
//  BookTableViewCell.m
//  epub
//
//  Created by ym on 16-8-10.
//  Copyright (c) 2016年 ym. All rights reserved.
//

#import "NativeTableViewCell.h"
#import "UMVideoAd.h"

@interface NativeTableViewCell()
@end
@implementation NativeTableViewCell
 


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
 
-(void)showInfo{
    self.i = 9;
    self.imageView.image = [UIImage imageNamed:@"icon.png"];
    CGRect rect = self.imageView.frame;
    rect.size.width = 80;
    rect.size.height = 80;
    self.imageView.frame = rect;
    self.imageView.hidden = NO;
    self.textLabel.text = @"我是一行数据行";
    if (self.nativeView) {
        [UMVideoAd closeNativeView];
        self.nativeView = nil;
    }
}

-(void)showNative{
    self.i = 7;
    self.textLabel.text = @"";
    self.imageView.hidden = YES;
    if (!self.nativeView) {
        self.nativeView =   (UIView*)[UMVideoAd getNativeMovieView];
        [self.contentView addSubview:self.nativeView];
    }
    
}


- (void)prepareForReuse{
    NSLog(@"xxxxxxxxxxxxxxxxxx");
}
- (void)awakeFromNib
{
    // Initialization code
}
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    NSLog(@"asdf%d",self.i);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
