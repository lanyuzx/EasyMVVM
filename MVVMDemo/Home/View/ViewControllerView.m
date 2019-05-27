//
//  ViewControllerView.m
//  MVVMDemo
//
//  Created by lanlan on 2019/5/25.
//  Copyright © 2019 lanlan. All rights reserved.
//

#import "ViewControllerView.h"
#import "ViewController.h"
@interface  ViewControllerView()
@property(nonatomic,strong) UISearchBar *searchBar;
@end

@implementation ViewControllerView

- (void)setupUI {
    [super setupUI];
    [self addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.right.equalTo(self).offset(-12);
        make.top.equalTo(self).offset(12);
        make.height.mas_equalTo(45);
    }];
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.searchBar.mas_bottom).offset(12);
        make.bottom.equalTo(self);
    }];
    
    [self addMJRefreshFooter];
    [self addMJRefreshHeader];
    
}

-(void)tableViewRegistClassView {
    [super tableViewRegistClassView];
    [self.tableView registerClass:[ViewControllerCellView class] forCellReuseIdentifier:@"ViewControllerCellView"];
    [self.tableView registerClass:[ViewControllerTableHeaderView class] forHeaderFooterViewReuseIdentifier:@"ViewControllerTableHeaderView"];
}

/// MARK: ----懒加载
-(UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = UISearchBar.new;
        _searchBar.placeholder = @"请输入关键字搜索";
    }
    return _searchBar;
}

@end

#import "ViewControllerModel.h"
@interface ViewControllerTableHeaderView()
@property(nonatomic,strong) UILabel *titleLable;
@end
@implementation ViewControllerTableHeaderView
-(void)setModel:(ViewControllerModel *)model {
    _model = model;
    self.titleLable.text = model.version;
}
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI {
    [self.contentView addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.centerY.equalTo(self.contentView);
    }];
}
-(UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = UILabel.new;
        _titleLable.textColor = UIColor.orangeColor;
        _titleLable.font = [UIFont systemFontOfSize:16];
    }
    return _titleLable;
}

@end

@interface ViewControllerCellView()
@property(nonatomic,strong) UILabel *titleLable;
@property(nonatomic,strong) UIImageView *iconView;
@end

@implementation ViewControllerCellView
-(void)setModel:(ViewControllerItemModel *)model {
    _model = model;
    self.titleLable.text = model.book_name;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    [self.contentView addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(12);
        make.centerX.equalTo(self.contentView);
    }];
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLable.mas_bottom).offset(12);
        make.centerX.equalTo(self.contentView);
        make.width.height.mas_equalTo(200);
    }];
}

-(UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = UILabel.new;
        _titleLable.textColor = UIColor.redColor;
    }
    return _titleLable;
}
-(UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.new;
    }
    return _iconView;
}
@end
