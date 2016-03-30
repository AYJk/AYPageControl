//
//  AYPageControlView.h
//  AYPageControl
//
//  Created by Andy on 16/3/28.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYLineLayer.h"
@interface AYPageControlView : UIView
/**
 *  背景横线视图
 */
@property (nonatomic, strong) AYLineLayer *lineLayer;
/**
 *  页面的个数
 */
@property (nonatomic, assign) NSInteger numberOfPages;
/**
 *  当前页码
 */
@property (nonatomic, assign) NSInteger currentPage;
/**
 *  圆圈直径
 */
@property (nonatomic, assign) CGFloat ballDiameter;
/**
 *  选中的颜色
 */
@property (nonatomic, strong) UIColor *selectedColor;
/**
 *  未选中的颜色
 */
@property (nonatomic, strong) UIColor *unSelectedColor;
/**
 *  pageControl绑定的scrollview
 */
@property (nonatomic, strong) UIScrollView *bindingScrollView;
/**
 *  绑定的scrollView的cotentOffset.x
 */
@property (nonatomic, assign) CGFloat contentOffset_x;
/**
 *  绑定的scrollView的lastCotentOffset.x
 */
@property (nonatomic, assign) CGFloat lastContentOffset_x;
@end
