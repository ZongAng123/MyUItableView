//
//  MyCellTableViewCell.h
//  MyUItableView
//
//  Created by 纵昂 on 2017/2/24.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCellTableViewCell : UITableViewCell
#define MCC_STYLE_NORMAL 0
#define MCC_STYLE_QUIT_BTN 100

@property(strong,nonatomic) UIImageView *icon;
//定义方法
-(void ) populate:(NSString*) iocn title:(NSString*) title height:(int) height style:(int) styles;
@end
