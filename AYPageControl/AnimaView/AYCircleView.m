//
//  AYCircleView.m
//  AYAnimaPageController
//
//  Created by Andy on 16/3/25.
//  Copyright © 2016年 Andy. All rights reserved.
//

#import "AYCircleView.h"

@implementation AYCircleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.circleLayer = [AYCircleLayer layer];
        self.circleLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.circleLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:self.circleLayer];
    }
    return self;
}

@end
