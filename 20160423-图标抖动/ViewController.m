//
//  ViewController.m
//  20160423-图标抖动
//
//  Created by devzkn on 4/23/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "ViewController.h"
#define angle2Radian(x) ((x)/180.0*M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self.imageView setUserInteractionEnabled:YES];
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    [self.imageView addGestureRecognizer:longPressGR];
}

- (void)longPress:(UILongPressGestureRecognizer*)longPressGR{
    if (longPressGR.state == UIGestureRecognizerStateBegan) {
        NSLog(@"%s",__func__);
        //进行Layer的抖动
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        //设置animation对象的属性
        [animation setKeyPath:@"transform.rotation"];
        [animation setValues:@[@angle2Radian(5),@angle2Radian(-5),@angle2Radian(5)]];
        
//        [animation setKeyPath:@"transform"];
//        //向左也要向右
//        NSValue *valueLeft = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 1, 0)];
//        NSValue *valueRifht = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-M_PI_4, 0, 1, 0)];
//        [animation setValues:@[valueLeft,valueRifht]];
        [animation setRemovedOnCompletion:NO];
        [animation setFillMode:kCAFillModeBoth];
        [animation setRepeatCount:MAXFLOAT];
        [animation setDuration:0.5];
        [self.imageView.layer addAnimation:animation forKey:@"animation"];
        
    }
}



@end
