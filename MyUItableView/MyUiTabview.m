//
//  MyUiTabview.m
//  MyUItableView
//
//  Created by 纵昂 on 2017/2/24.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "MyUiTabview.h"
#import "MyCellTableViewCell.h"

@interface MyUiTabview ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView*my;
    UIImageView*head;
    UILabel*name;
    int TB_SECTION_COLLECT;
    int TB_SECTION_UPDATA;
    int TB_SECTION_SETTING;
    int TB_SECTION_QUIT;
    
    int totalSectionCount;
}
@property(retain,nonatomic) NSArray*titles;
@property(retain,nonatomic) NSArray*pic;

@end

@implementation MyUiTabview
@synthesize titles;
@synthesize pic;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加navigationController 不透明
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor =[UIColor redColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    UILabel *title =[[UILabel alloc] initWithFrame:CGRectZero];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.backgroundColor =[UIColor clearColor];
    self.navigationItem.titleView = title;
    title.text=@"个人中心";
    [title sizeToFit];
    [self iniview];
    my = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    my.backgroundColor =[UIColor whiteColor];
    my.separatorStyle = UITableViewCellEditingStyleNone;
    [self.view addSubview:my];
    my.delegate = self;
    my.dataSource =self;
    [self populateTableHeader];
    
}
//初始化数据
-(void)iniview{
    
    totalSectionCount = 4;
    
    TB_SECTION_COLLECT = 0;
    TB_SECTION_UPDATA = 1;
    TB_SECTION_SETTING = 2;
    TB_SECTION_QUIT = 3;
    [self setTitles:@[@[@"摇一摇",@"朋友圈",@"设置"],@[@"个人中心"],@[@"微信"]]];
    [self setPic:@[@[@"",@"",@""],@[@""],@[@""]]];
    
    
}
//加头

-(void)populateTableHeader {
    my.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 120.0f)] ;
        head =[[UIImageView alloc]init];
        head.image=[UIImage imageNamed:@"default_avatar_shadow.9.png"];
        
        head.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        head.frame = CGRectMake(0, 10, 80, 80);
        head.layer.masksToBounds = YES;
        head.layer.cornerRadius = 40.0;
        head.layer.borderColor = [UIColor whiteColor].CGColor;
        head.layer.borderWidth = 3.0f;
        head.layer.rasterizationScale = [UIScreen mainScreen].scale;
        head.layer.shouldRasterize = YES;
        head.clipsToBounds = YES;
        [view addSubview:head];
        
        head.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onUserFaceIvClick)];
        [singleTap setNumberOfTapsRequired:1];
        [head addGestureRecognizer:singleTap];
        
        int ypos = 120;
        int screenWidth = self.view.frame.size.width - 2 * 6;
        UILabel * nameLb = [[UILabel alloc] initWithFrame:CGRectMake(85, 30, 200, 200)];
        nameLb.text = @"逗比";
        nameLb.font = [UIFont systemFontOfSize:15];
        nameLb.textAlignment = NSTextAlignmentCenter;
        [view addSubview:nameLb];
        nameLb.userInteractionEnabled = YES;
        singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onUserNameClick)];
        [singleTap setNumberOfTapsRequired:1];
        [nameLb addGestureRecognizer:singleTap];
        ypos += 6 + 10;
        ypos += 40;
        CGRect frame = view.frame;
        frame.size.height = ypos;
        view.frame = frame;
        view;
    });
}


//加分割线
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 520, 30)];
    view.backgroundColor = [UIColor grayColor];
    return view;
    
}

//分割线宽度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 12;
}

//每个分组有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(TB_SECTION_COLLECT == section) {
        return titles.count;
    }
    else {
        return 1;
    }
    
}
//相当于getview
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    MyCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[MyCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if(indexPath.section < TB_SECTION_QUIT) {
        [cell populate:[[self.pic objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] title:[self.titles[indexPath.section] objectAtIndex:indexPath.row] height:44 style:MCC_STYLE_NORMAL];
        if (indexPath.section == TB_SECTION_COLLECT) {
            UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0,44, 400, 1)];
            footView.backgroundColor =[UIColor grayColor];
            [cell addSubview:footView];
        }
        
    }

    return cell;
}
//一共有多少行
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return totalSectionCount;
    
}

@end
