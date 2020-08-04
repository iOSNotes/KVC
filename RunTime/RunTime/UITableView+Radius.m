//
//  UITableView+Radius.m
//  RunTime
//
//  Created by 秦传龙 on 2020/7/22.
//  Copyright © 2020 秦传龙. All rights reserved.
//

#import "UITableView+Radius.h"
#import <objc/message.h>

@implementation UITableView (Radius)

#pragma mark - load
//
//+ (void)load
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        // 获取实例方法
//        Method oldMethod = class_getInstanceMethod([self class], @selector(setDelegate:));
//        Method newMethod = class_getInstanceMethod([self class], @selector(hook_setDelegate:));
//        method_exchangeImplementations(oldMethod, newMethod);
//    });
//}
//
//#pragma mark - 交换代理方法
//
//- (void)hook_setDelegate:(id<UITableViewDelegate>)delegate
//{
//    SEL oldSelector = @selector(tableView:willDisplayCell:forRowAtIndexPath:);
//    SEL newSelector = @selector(hooktableView:willDisplayCell:forRowAtIndexPath:);
//    [self swizzingMethodWithDelegate:delegate oldSelector:oldSelector newSelector:newSelector];
//    [self hook_setDelegate:delegate];
//}
//
//- (void)swizzingMethodWithDelegate:(id<UITableViewDelegate>)delegate oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
//    Method oldMethod_del = class_getInstanceMethod([delegate class], oldSelector);
//    Method oldMethod_self = class_getInstanceMethod([self class], oldSelector);
//    Method newMethod = class_getInstanceMethod([self class], newSelector);
//
//    // 若未实现代理方法，则先添加代理方法
//    BOOL isSuccess = class_addMethod([delegate class], oldSelector, class_getMethodImplementation([self class], newSelector), method_getTypeEncoding(newMethod));
//    if (isSuccess) {
//        class_replaceMethod([delegate class], newSelector, class_getMethodImplementation([self class], oldSelector), method_getTypeEncoding(oldMethod_self));
//    } else {
//        // 若已实现代理方法，则添加 hook 方法并进行交换
//        BOOL isVictory = class_addMethod([delegate class], newSelector, class_getMethodImplementation([delegate class], oldSelector), method_getTypeEncoding(oldMethod_del));
//        if (isVictory) {
//            class_replaceMethod([delegate class], oldSelector, class_getMethodImplementation([self class], newSelector), method_getTypeEncoding(newMethod));
//        }
//    }
//}
//
//#pragma mark - 交换的方法
//
//// hook后的方法
//- (void)hooktableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//   CGFloat radius = 15;
//    CGFloat width = 0;
//    // 圆角弧度半径
//    CGFloat cornerRadius = 0.f;
//    if (radius != 0) {
//        cornerRadius = 10.f;
//    } else {
//        cornerRadius = radius;
//    }
//
//    // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
//    cell.backgroundColor = UIColor.clearColor;
//
//    // 创建一个shapeLayer
//    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init];    //显示选中
//    // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
//    CGMutablePathRef pathRef = CGPathCreateMutable();
//    // 获取cell的size
//    // 第一个参数,是整个 cell 的 bounds, 第二个参数是距左右两端的距离,第三个参数是距上下两端的距离
//    CGRect bounds;
//    if (width != 0) {
//        bounds = CGRectInset(cell.bounds, 10, 0);
//    } else {
//        bounds = CGRectInset(cell.bounds, width, 0);
//    }
//    // CGRectGetMinY：返回对象顶点坐标
//    // CGRectGetMaxY：返回对象底点坐标
//    // CGRectGetMinX：返回对象左边缘坐标
//    // CGRectGetMaxX：返回对象右边缘坐标
//    // CGRectGetMidX: 返回对象中心点的X坐标
//    // CGRectGetMidY: 返回对象中心点的Y坐标
//    // 这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行
//    // CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius)
//    if ([tableView numberOfRowsInSection:indexPath.section] - 1 == 0 ) {
//        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
//        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
//        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
//        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
//        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMinX(bounds), CGRectGetMidY(bounds), cornerRadius);
//        CGPathAddLineToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
//    } else if (indexPath.row == 0) {
//        // 初始起点为cell的左下角坐标
//        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
//        // 起始坐标为左下角，设为p，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
//        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
//        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
//        // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
//        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
//    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1 ) {
//        // 初始起点为cell的左上角坐标
//        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
//        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
//        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
//        // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
//        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
//    } else {
//        // 添加cell的rectangle信息到path中（不包括圆角）
//        CGPathAddRect(pathRef, nil, bounds);
//    }
//    // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
//    layer.path = pathRef;
//    backgroundLayer.path = pathRef;
//    // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
//    CFRelease(pathRef);
//    // 按照shape layer的path填充颜色，类似于渲染render
//    // layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
//    layer.fillColor = [UIColor whiteColor].CGColor;
//
//    // view大小与cell一致
//    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
//    // 添加自定义圆角后的图层到roundView中
//    [roundView.layer insertSublayer:layer atIndex:0];
//    roundView.backgroundColor = UIColor.clearColor;
//    // cell的背景view
//    cell.backgroundView = roundView;
//    
//     [self hooktableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
//}
//
//

@end
