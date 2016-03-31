//
//  AYPageControlView.m
//  AYPageControl
//
//  Created by Andy on 16/3/28.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "AYPageControlView.h"
#import "AYCircleLayer.h"

@interface AYPageControlView ()

@property (nonatomic, strong) AYCircleLayer *circleLayer;

@end

@implementation AYPageControlView



- (void)setCurrentPage:(NSInteger)currentPage {
    
    if (_currentPage != currentPage) {
        _currentPage = currentPage;
        self.lineLayer.currentPage = _currentPage;
        self.circleLayer.currentPage = _currentPage;
    }
}

- (void)setContentOffset_x:(CGFloat)contentOffset_x {
    
    if (_contentOffset_x != contentOffset_x) {
        _contentOffset_x = contentOffset_x;
        self.circleLayer.contentOffset_x = self.contentOffset_x;
        [self calculateProgress];
    }
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    
    _numberOfPages = numberOfPages;
    self.lineLayer.numberOfPages = _numberOfPages;
    self.circleLayer.numberOfPages = _numberOfPages;
}

- (void)setLastContentOffset_x:(CGFloat)lastContentOffset_x {
    
    _lastContentOffset_x = lastContentOffset_x;
    self.circleLayer.lastContentOffset_x = _lastContentOffset_x;
}

- (void)calculateProgress {
    
    CGFloat pageWidth = self.bindingScrollView.frame.size.width;
    int currentPage = floor((self.contentOffset_x - pageWidth * .5) / pageWidth) + 2;
    self.currentPage = currentPage;
}

- (void)setBindingScrollView:(UIScrollView *)bindingScrollView {
    
    _bindingScrollView = bindingScrollView;
    self.circleLayer.bingdingScrollViewWidth = _bindingScrollView.frame.size.width;
    self.circleLayer.contentOffset_x = 0;

}

- (void)setSelectedColor:(UIColor *)selectedColor {
    
    _selectedColor = selectedColor;
    self.circleLayer.selectedColor = _selectedColor;
}

- (void)setUnSelectedColor:(UIColor *)unSelectedColor {
    
    _unSelectedColor = unSelectedColor;
    self.lineLayer.unSelectedColor = unSelectedColor;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self configCircleView:frame];
    }
    return self;
}

- (void)configCircleView:(CGRect)frame {
    
    self.lineLayer = [AYLineLayer layer];
    self.lineLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.lineLayer.contentsScale = [UIScreen mainScreen].scale;
    self.lineLayer.bindingScrollView = self.bindingScrollView;
    [self.layer addSublayer:self.lineLayer];

    self.circleLayer = [AYCircleLayer layer];
    self.circleLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.circleLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:self.circleLayer];
}

@end
