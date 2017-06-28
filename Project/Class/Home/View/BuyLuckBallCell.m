//
//  BuyLuckBallCell.m
//  Project
//
//  Created by dym on 2017/6/28.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BuyLuckBallCell.h"
#import "HomeLuckBallEntity.h"

@interface BuyLuckBallCell ()
@property (nonatomic,strong)UIButton *selebtn;
@property (nonatomic,strong)UIView *backView;
@property (nonatomic,strong)UILabel *titleL;
@end

@implementation BuyLuckBallCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.mj_h = BuyLuckBallCellHeigth;
        
           }
    return self;
}

- (void)setEntity:(HomeLuckBallEntity *)entity{
    _entity = entity;
    
    [_backView removeFromSuperview];
    _backView = [[UIView alloc]initWithFrame:self.bounds];
    [self.contentView addSubview:_backView];
    
    self.titleL = [[UILabel alloc]initWithFrame:CGRectMake(0,8, 30, 15)];
    [_backView addSubview:self.titleL];
    _titleL.font = [UIFont systemFontOfSize:12];
//    _titleL.layer.masksToBounds = YES;
//    _titleL.layer.cornerRadius = 1;
    _titleL.backgroundColor = [UIColor grayColor];
    _titleL.textAlignment = NSTextAlignmentCenter;
    _titleL.textColor = [UIColor whiteColor];
    
    NSInteger count = 5;
    CGFloat btnWidth = 30;
    CGFloat spaceMargin = (SCREEN_WIDTH - count * btnWidth) / (count + 1);
    for (int i = 0; i < 10; i ++) {
        CGFloat row = i % count;
        CGFloat col = i / count;
        CGFloat X = spaceMargin + (spaceMargin + btnWidth) * row;
        CGFloat Y = 30 + (10 + btnWidth) * col;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(X, Y, btnWidth, btnWidth)];
        btn.layer.cornerRadius = btnWidth / 2;
        btn.layer.masksToBounds = YES;
        btn.layer.borderWidth = 2;
        btn.layer.borderColor = XBAPPBaseColor.CGColor;
        [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [btn setTitleColor:XBAPPBaseColor forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.tag = i;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_backView addSubview:btn];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
        
       
    }
    
    
}
- (void)setTitleText:(NSString*)text{
    _titleL.text = text;
}

- (CGFloat)cellheightWithInfo:(id)entity{
    return 10;
}


- (void)clickBtn:(UIButton*)btn{
    [self.delegate clickBtnText:btn];
    
    _selebtn.backgroundColor = [UIColor whiteColor];
    _selebtn.selected = NO;
    
    btn.selected = YES;
    btn.backgroundColor = XBAPPBaseColor;
    
    _selebtn = btn;
  
}

@end
