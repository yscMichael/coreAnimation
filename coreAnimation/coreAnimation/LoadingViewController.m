//
//  LoadingViewController.m
//  coreAnimation
//
//  Created by 杨世川 on 2020/2/28.
//  Copyright © 2020 杨世川. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    //声明加载view的动画路径
    UIBezierPath *pacmanOpenPath;
    CGFloat radius = 40.0f;
    CGPoint arcCenter = CGPointMake(radius, radius);
    //定制一段圆弧
    pacmanOpenPath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:radius startAngle:M_PI / 2.0 endAngle:4 * M_PI / 2.0 clockwise:YES];
    //生成color数组
    NSMutableArray *colors = nil;
    if (colors == nil) {
        colors = [[NSMutableArray alloc] initWithCapacity:3];
        UIColor *color = nil;
        color = [UIColor blueColor];
        [colors addObject:(id)[color CGColor]];
        color = [UIColor whiteColor];
        [colors addObject:(id)[color CGColor]];
    }
    //CAGradientLayer 通过指定颜色，一个开始的点，一个结束的点和梯度类型使你能够简单的在层上绘制一个梯度，效果就是颜色渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    //在指定的color中绘制渐变层
    [gradientLayer setColors:colors];
    gradientLayer.frame = CGRectMake(20, 20, 100, 100);
    //在 (20, 20, 100, 100) 位置绘制一个颜色渐变的层
    [self.view.layer addSublayer:gradientLayer];
    //CAShapeLayer 通过创建一个核心图像路径，并且分配给CAShaperLayer的path属性，从而为需要的形状指定路径。 可以指定填充路径之外的颜色，路径内的颜色，绘制路径，线宽，是否圆角等等
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.fillMode = kCAFillRuleEvenOdd;
    shapeLayer.path = pacmanOpenPath.CGPath;
    shapeLayer.strokeColor = [UIColor yellowColor].CGColor;
    shapeLayer.lineWidth = 10.0f;
    shapeLayer.lineJoin = kCALineJoinRound;
    //当你使用时，奇数的值被绘制，然后偶数的值不被绘制。例如，如果你指定5，10，15，20，笔画将会有5个单元被绘制，接下来10不被绘制，15被绘制，20不被绘制。这种模式可以使用你喜欢的间隙来指定。请记住：奇数等于绘制而偶数不绘制。这些单元是被放在了一个放置NSNumber对象的NSArray的数组中，如果你在NSSArray中放置其他东西，会带来一些异常的效果。
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.frame = CGRectMake(10, 10, 80, 80);
    //所有继承于CALayer的核心动画层都有一个属性叫做mask.这个属性能够使你给层的所有内容做遮罩，除了层面罩中已经有的部分，它允许仅仅形状层绘制的部分显示那部分的图像。 我们将shapeLayer作为这个遮罩，显示出来的效果就是一个有着渐变填充色的圆弧
    gradientLayer.mask = shapeLayer;
    //最重要的显示内容已经有了，接下来就是让图层动起来，所以加一个旋转动画
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    spinAnimation.fromValue = [NSNumber numberWithInt:0];
    spinAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    spinAnimation.duration = 2;
    spinAnimation.repeatCount = HUGE_VALF;
//    [shapeLayer addAnimation:spinAnimation forKey:@"shapeRotateAnimation"];
    //现在圆弧就能够旋转了，但是我们发现渐变色是固定的位置，感觉就像是固定的背景色，为了达到一种动态的渐变，所以给gradientLayer也加上旋转动画效果，这样就是一段旋转的有着渐变效果的圆弧
//    [gradientLayer addAnimation:spinAnimation forKey:@"GradientRotateAniamtion"];
    //通过修改一些属性值，我们可以达到更为绚丽的动画效果
    
//    关于加载view动画核心代码已经完成，封装一下即可投入使用了。
//    实际上，所有的动画都存在一个问题，那就是在动画过程中，如果程序切换到后台，在进入前台，动画就会停住，这是iOS机制决定。对此提供一个解决方法：
//    注册
//    UIApplicationDidEnterBackgroundNotification
//    UIApplicationWillEnterForegroundNotification
//    系统通知消息
//    在进入后台时，移除掉当前动画，进入前台时，重新启动动画
}

@end
