//
//  AYCircleLayer.h
//  AYAnimaPageController
//
//  Created by Andy on 16/3/25.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface AYCircleLayer : CALayer

/**
 *  当前progress
 */
@property (nonatomic, assign) CGFloat currentProgress;
/**
 *  外界矩形大小
 */
@property (nonatomic, assign) CGRect outsideRect;

@property (nonatomic, assign) CGFloat contentOffset_x;
@property (nonatomic, assign) CGFloat lastContentOffset_x;
/**
 *  页面的个数
 */
@property (nonatomic, assign) NSInteger numberOfPages;
/**
 *  当前页码
 */
@property (nonatomic, assign) NSInteger currentPage;
/**
 *  pageControl绑定scrollView的宽度
 */
@property (nonatomic, assign) CGFloat bingdingScrollViewWidth;
/**
 *  选中的颜色
 */
@property (nonatomic, strong) UIColor *selectedColor;
@end
