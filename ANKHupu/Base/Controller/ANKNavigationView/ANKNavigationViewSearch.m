//
//  ANKNavigationViewSearch.m
//  ANKHupu
//
//  Created by Animenzzz on 2019/5/14.
//  Copyright © 2019 Animenzzz. All rights reserved.
//

#import "ANKNavigationViewSearch.h"

@interface ANKNavigationViewSearch()

@property (weak, nonatomic) IBOutlet UIView *searchView;

@end

@implementation ANKNavigationViewSearch

- (void)awakeFromNib{
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchViewTap)];
    self.searchView.userInteractionEnabled = YES;
    [self.searchView addGestureRecognizer:tap];
    self.cwHotSearchLab.animateDuration = 1.0;

}


+ (instancetype)shareInstance {
    static ANKNavigationViewSearch *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[[UINib nibWithNibName:@"ANKNavigationViewSearch" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
    });
    return shareInstance;
}


- (void)searchViewTap{
    
    if ([self.delegate respondsToSelector:@selector(hotSearchViewClick)]) {
        [self.delegate hotSearchViewClick];
    }
}

- (IBAction)commentClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(commentClick)]) {
        [self.delegate commentClick];
    }
}

@end
