# EasyMVVM
##控制器代码 最大化精简控制器 给控制器瘦身
```
-(void)setupViemModel {
    [super setupViemModel];
    self.viewModel = [[ViewControllerViewModel alloc] initWithVC:self];
}
-(void)setupUI {
    [super setupUI];
    self.title = @"MVVM custom view";
    self.customView = [[ViewControllerView alloc] initWithFrame:CGRectZero viewController:self tableView:self.tableView];
    [self.view addSubview:self.customView];
    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    [self addMJRefreshFooter];
    [self addMJRefreshHeader];
}
//调用viemModel获取数据 控制器只负责知道数据是否成功
-(void)setupData {
    [super setupData];
    [self.viewModel requestWithURL:^(BOOL isSucess) {
        if (isSucess) {
            [self.tableView reloadData];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}

```
# 使用方法
### 如果你需要tableView 你需要继承 LLBaseTableViewVC 不需要则继承 LLBaseVC即可
### viewModel 需要继承 LLBaseViewModel  内部实现了数据的解析  以及刷新分页索引记录
### viemModel 和 viem 以及contrller 属性都放置公有属性 可以相互调用
