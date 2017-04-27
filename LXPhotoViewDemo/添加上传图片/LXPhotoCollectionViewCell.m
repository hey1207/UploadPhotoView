//
//  LXPhotoCollectionViewCell.m
//  LXPhotoViewDemo
//
//  Created by xxf on 2017/4/27.
//  Copyright © 2017年 suokeer. All rights reserved.
//

#import "LXPhotoCollectionViewCell.h"

#import "Masonry.h"

static CGFloat const kPhotoCellCellPadding = 0;

@interface LXPhotoCollectionViewCell () {
    UIView *bgView;
}

@end

@implementation LXPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        bgView = [[UIView alloc]init];
        bgView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview: bgView];
        
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        self.photoIV = [[UIImageView alloc]init];
        self.photoIV.contentMode = UIViewContentModeScaleAspectFill;
        self.photoIV.clipsToBounds = YES;
        [bgView addSubview:self.photoIV];
        
        [self.photoIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(bgView).insets(UIEdgeInsetsMake(kPhotoCellCellPadding, kPhotoCellCellPadding, kPhotoCellCellPadding, kPhotoCellCellPadding));
        }];
        
        _deleteButton = [UIButton new];
        _deleteButton.backgroundColor = [UIColor clearColor];
        //        [_deleteButton setImage:[UIImage imageNamed:@"delete_publsh_btn"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(didTouchDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:_deleteButton];
        
        [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(0);
            make.trailing.equalTo(self.contentView.mas_trailing).offset(0);
        }];
    }
    return self;
}


- (void)didTouchDeleteButton:(UIButton *)btn {
    if ([_delegate respondsToSelector:@selector(clickCellDeleteButton:)]) {
        [_delegate clickCellDeleteButton:self];
    }
}

@end
