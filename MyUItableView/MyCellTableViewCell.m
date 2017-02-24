//
//  MyCellTableViewCell.m
//  MyUItableView
//
//  Created by 纵昂 on 2017/2/24.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "MyCellTableViewCell.h"
@interface MyCellTableViewCell()

@property (retain,nonatomic) UILabel *title;
@property(retain,nonatomic) UILabel *back;

@end
@implementation MyCellTableViewCell
@synthesize title;
@synthesize back;
@synthesize icon;
static int iconsize = 24;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self  = [super  initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        icon  =[[UIImageView alloc] initWithFrame:CGRectMake(6 , (54-iconsize)/2, iconsize, iconsize)];
        [self.contentView addSubview:icon];
        title =[[UILabel alloc] initWithFrame:CGRectMake(6*2+iconsize, 22, 1000,44)];
        title.font =[UIFont systemFontOfSize:15];
        [self.contentView addSubview:title];
    }

    return self;
    
}

-(void)populate:(NSString *)iocn title:(NSString *)title height:(int)height style:(int)styles{
    
    self.icon.hidden = NO;
    self.title.hidden = NO;
    CGRect frame = self.title.frame;
    frame.origin.y = (height-40) / 2;
    self.title.frame = frame;
    self.title.text = title;
}

@end
