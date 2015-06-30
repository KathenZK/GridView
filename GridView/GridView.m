//
//  GridView.m
//  GridView
//
//  Created by ZK on 15/6/30.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "GridView.h"
#define SINGLE_LINE_WIDTH               (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET       ((1 / [UIScreen mainScreen].scale) / 2)
@implementation GridView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _gridColor = [UIColor blueColor];
        _gridSpacing = 30;
        _gridLineWidth = SINGLE_LINE_WIDTH;
    }
    return self;
}

- (void)setGridColor:(UIColor *)gridColor {
    _gridColor = gridColor;
    [self setNeedsDisplay];
}

- (void)setGridSpacing:(CGFloat)gridSpacing {
    _gridSpacing = gridSpacing;
    [self setNeedsDisplay];
}

- (void)setGridLineWidth:(CGFloat)gridLineWidth {
    _gridLineWidth = gridLineWidth;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGFloat lineMargin = self.gridSpacing;
    
    //仅当要绘制的线宽为奇数像素时，绘制位置需要调整
    CGFloat pixelAdjustOffset = 0;
    if (((int)(self.gridLineWidth * [UIScreen mainScreen].scale) + 1) % 2 == 0) {
        pixelAdjustOffset = SINGLE_LINE_ADJUST_OFFSET;
    }
    
    CGFloat xPos = lineMargin - pixelAdjustOffset;
    CGFloat yPos = lineMargin - pixelAdjustOffset;
    while (xPos < self.bounds.size.width) {
        CGContextMoveToPoint(context, xPos, 0);
        CGContextAddLineToPoint(context, xPos, self.bounds.size.height);
        xPos += lineMargin;
    }
    
    while (yPos < self.bounds.size.height) {
        CGContextMoveToPoint(context, 0, yPos);
        CGContextAddLineToPoint(context, self.bounds.size.width, yPos);
        yPos += lineMargin;
    }
    
    CGContextSetLineWidth(context, self.gridLineWidth);
    CGContextSetStrokeColorWithColor(context, self.gridColor.CGColor);
    CGContextStrokePath(context);
}

@end
