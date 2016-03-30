//
//  AYCircleLayer.m
//  AYAnimaPageController
//
//  Created by Andy on 16/3/25.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "AYCircleLayer.h"
#import <UIKit/UIKit.h>
#define AnimaBallDistance self.frame.size.width / (self.numberOfPages + 1)
/**
    动画向左或右移动
 */
typedef enum : NSUInteger {
    Move_Left,
    Move_Right,
} Move_Direction;

@interface AYCircleLayer ()
/**
 *  移动方向
 */
@property (nonatomic, assign) Move_Direction moveDirection;
@property (nonatomic, assign) CGFloat outsideRectSize;
@property (nonatomic, assign) CGFloat lastOrigin_x;
/**
 *  查询，设置是否要切换当前的currentPage
 */
//@property (nonatomic, assign, getter=isNeedChangepage) BOOL needChangePage;
@end

@implementation AYCircleLayer

- (instancetype)init {
    
    if (self = [super init]) {
        self.outsideRectSize = 10;
        self.currentProgress = 0;
        self.currentPage = 1;
    }
    return self;
}

- (instancetype)initWithLayer:(AYCircleLayer *)layer {
    
    if (self = [super initWithLayer:layer]) {
        self.currentProgress = layer.currentProgress;
        self.outsideRect = layer.outsideRect;
        self.outsideRectSize = layer.outsideRectSize;
        self.currentPage = layer.currentPage;
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)currentPage {
    
    _currentPage = currentPage;
}

- (void)setContentOffset_x:(CGFloat)contentOffset_x {
    
    _contentOffset_x = contentOffset_x;
    if (_contentOffset_x - _lastContentOffset_x > 0) {
        self.moveDirection = Move_Right;
    } else if (_contentOffset_x - _lastContentOffset_x <= 0) {
        self.moveDirection = Move_Left;
    }
    _currentProgress = (int)((self.contentOffset_x / _bingdingScrollViewWidth) * 1000) % 1000 * .001;
    CGFloat origin_y = self.position.y - self.outsideRectSize * .5;
    CGFloat origin_x = 0;
    if ((int)contentOffset_x % (int)_bingdingScrollViewWidth == 0) {
        _lastOrigin_x = AnimaBallDistance * self.currentPage  + _currentProgress * AnimaBallDistance - self.outsideRectSize * .5  ;
        self.outsideRect = CGRectMake(_lastOrigin_x, origin_y, self.outsideRectSize, self.outsideRectSize);
        self.lastContentOffset_x = self.contentOffset_x;
    } else if ((int)contentOffset_x % (int)_bingdingScrollViewWidth > 0){
        
        if (self.moveDirection == Move_Right) {
            origin_x = _lastOrigin_x + _currentProgress * AnimaBallDistance ;
        } else {
            origin_x = _lastOrigin_x - (1 - _currentProgress)* AnimaBallDistance;
        }
        self.outsideRect = CGRectMake(origin_x, origin_y, self.outsideRectSize, self.outsideRectSize);
    } else if ((int)contentOffset_x % (int)_bingdingScrollViewWidth < 0) {
        if (self.moveDirection == Move_Right) {
            origin_x = _lastOrigin_x + (_currentProgress)*(AnimaBallDistance);
        } else {
            origin_x = _lastOrigin_x - (ABS(_currentProgress))*(AnimaBallDistance);
        }
        self.outsideRect = CGRectMake(origin_x, origin_y, self.outsideRectSize, self.outsideRectSize);
    }
    [self setNeedsDisplay];
}

- (void)drawInContext:(CGContextRef)ctx {
    
//    计算出偏移值
    CGFloat offset = self.outsideRect.size.width / 3.6;
//    计算出移动距离
    CGFloat moveDistance = 0;
    if (self.moveDirection == Move_Right && self.currentProgress != 0) {
        if (_contentOffset_x > (_numberOfPages - 1) * _bingdingScrollViewWidth) {
            moveDistance = (self.outsideRect.size.width / 6) * fabs(self.currentProgress) * 2;
        }else {
            moveDistance = (self.outsideRect.size.width / 6) * fabs(1 - self.currentProgress) * 2;
        }
    } else {
        moveDistance = (self.outsideRect.size.width / 6) * fabs(self.currentProgress) * 2;
    }
//    计算出中心点坐标
    CGPoint rectCenter = CGPointMake(self.outsideRect.origin.x + self.outsideRect.size.width * .5, self.outsideRect.origin.y + self.outsideRect.size.height * .5);
//    计算各个辅助点坐标
    CGPoint point_A = CGPointMake(rectCenter.x,self.outsideRect.origin.y + moveDistance);
    CGPoint point_B = CGPointMake(self.moveDirection == Move_Right ? rectCenter.x + self.outsideRect.size.width * .5:self.outsideRect.size.width * .5 + rectCenter.x + moveDistance * 2, rectCenter.y);
    CGPoint point_C = CGPointMake(rectCenter.x, rectCenter.y + self.outsideRect.size.width * .5 - moveDistance);
    CGPoint point_D = CGPointMake(self.moveDirection == Move_Right ? self.outsideRect.origin.x - moveDistance * 2:self.outsideRect.origin.x, rectCenter.y);
    CGPoint point_c1 = CGPointMake(point_A.x + offset, point_A.y);
    CGPoint point_c2 = CGPointMake(point_B.x,self.moveDirection == Move_Right ? point_B.y - offset:point_B.y - offset + moveDistance);
    CGPoint point_c3 = CGPointMake(point_B.x, self.moveDirection == Move_Right ? point_B.y + offset:point_B.y + offset - moveDistance);
    CGPoint point_c4 = CGPointMake(point_C.x + offset, point_C.y);
    CGPoint point_c5 = CGPointMake(point_C.x - offset, point_C.y);
    CGPoint point_c6 = CGPointMake(point_D.x, self.moveDirection == Move_Right ? point_D.y + offset - moveDistance:point_D.y + offset);
    CGPoint point_c7 = CGPointMake(point_D.x, self.moveDirection == Move_Right ? point_D.y - offset + moveDistance:point_D.y - offset);
    CGPoint point_c8 = CGPointMake(point_A.x - offset,point_A.y);
//    圆的边界
    UIBezierPath *ovalPath = [UIBezierPath bezierPath];
    [ovalPath moveToPoint:point_A];
    [ovalPath addCurveToPoint:point_B controlPoint1:point_c1 controlPoint2:point_c2];
    [ovalPath addCurveToPoint:point_C controlPoint1:point_c3 controlPoint2:point_c4];
    [ovalPath addCurveToPoint:point_D controlPoint1:point_c5 controlPoint2:point_c6];
    [ovalPath addCurveToPoint:point_A controlPoint1:point_c7 controlPoint2:point_c8];
    [ovalPath closePath];
    
    CGContextAddPath(ctx, ovalPath.CGPath);
//    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextFillPath(ctx);
}

@end
