//
//  RootViewController.m
//  RongYun
//
//  Created by mac on 2018/7/26.
//  Copyright © 2018年 Zhou. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置当前用户信息
    // 设置需要显示列表显示那些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION),                               @(ConversationType_CHATROOM),                     @(ConversationType_GROUP),         @(ConversationType_APPSERVICE),        @(ConversationType_SYSTEM)]];
    // 设置需要将哪些类型的会话在会话列表中聚合显示
//    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
//                                          @(ConversationType_GROUP)]];
    self .navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"联系买家" style:UIBarButtonItemStylePlain target:self action:@selector(connect)];

}
-(void)connect{
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = ConversationType_PRIVATE;
    conversationVC.targetId = @"001";
    conversationVC.title = @"联系买家";
    conversationVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:conversationVC animated:YES];
}
// 点击回话时跳转到回话页面
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
    // 会话页面:直接使用或者继承RCConversationViewController
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = model.conversationTitle;
    conversationVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:conversationVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
