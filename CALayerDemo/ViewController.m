//
//  ViewController.m
//  CALayerDemo
//
//  Created by Marco on 6/12/15.
//  Copyright (c) 2015 LJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = self.view.layer;
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    CALayer *subLayer = [CALayer layer];
    subLayer.frame = CGRectMake(50, 50, 100, 100);
    subLayer.backgroundColor = [UIColor redColor].CGColor;
    [layer addSublayer:subLayer];
    
    // corner
    CALayer *cornerLayer = [CALayer layer];
    cornerLayer.frame = CGRectMake(160, 50, 100, 100);
    cornerLayer.backgroundColor = [UIColor blueColor].CGColor;
    cornerLayer.cornerRadius = 10;
    [layer addSublayer:cornerLayer];
    
    // shadow
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = CGRectMake(50, 160, 100, 100);
    shadowLayer.backgroundColor = [UIColor yellowColor].CGColor;
    shadowLayer.shadowOffset = CGSizeMake(0, 2);
    shadowLayer.shadowColor = [UIColor blackColor].CGColor;
    shadowLayer.shadowRadius = 5;
    shadowLayer.shadowOpacity = 1;
    [layer addSublayer:shadowLayer];
    
    // border
    CALayer *borderLayer = [CALayer layer];
    borderLayer.frame = CGRectMake(160, 160, 100, 100);
    borderLayer.backgroundColor = [UIColor orangeColor].CGColor;
    borderLayer.borderColor = [UIColor grayColor].CGColor;
    borderLayer.borderWidth = 4.f;
    [layer addSublayer:borderLayer];
    
    // image content
    CALayer *imageContentLayer = [CALayer layer];
    imageContentLayer.frame = CGRectMake(50, 270, 100, 100);
    imageContentLayer.contents = (id)[UIImage imageNamed:@"test.png"].CGImage;
    [layer addSublayer:imageContentLayer];
    
    // mask
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 270, 100, 100)];
    imageView.image = [UIImage imageNamed:@"test.png"];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = imageView.bounds;
    maskLayer.contents = (id)[UIImage imageNamed:@"weibo.png"].CGImage;
    
    imageView.layer.mask = maskLayer;
    [self.view addSubview:imageView];
    
    // custom drawing
    CALayer *customLayer = [CALayer layer];
    customLayer.frame = CGRectMake(50, 380, 100, 100);
    customLayer.backgroundColor = [UIColor whiteColor].CGColor;
    customLayer.delegate = self;
    [layer addSublayer:customLayer];
    [customLayer setNeedsDisplay];
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context {
    
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(context, layer.bounds);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
