//
//  ViewController.m
//  Homewrok26
//
//  Created by Dima Sektor on 24.07.16.
//  Copyright © 2016 Dima Sektor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setImage];
  }

#pragma mark - Actions
- (IBAction)valueChanged:(UISlider *)sender {
    self.sliderLabel.text=[NSString stringWithFormat:@"Moving speed : %1.1f ",self.speedSlider.value];
}

- (IBAction)actionTranslationSwitch:(UISwitch *)sender {
  [self makeAnimations];

}

- (IBAction)actionScaleSwitch:(UISwitch *)sender {
    [self makeAnimations];

}

- (IBAction)actionRotationSwitch:(UISwitch *)sender {
    [self makeAnimations];

   
}
- (IBAction)imageChanged:(UISegmentedControl *)sender {
    self.imageView.backgroundColor=[UIColor clearColor];
    [self setImage];
}
#pragma mark - Methods

-(void)setImage{
    self.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d",self.imageSegmentedControl.selectedSegmentIndex]];
}

-(void)makeAnimations{
    CGRect rect = self.view2.bounds;
    
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect)+ CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    CGFloat s = (float)(arc4random() % 151) / 100.f + 0.5f;
    
    CGFloat r = (float)(arc4random() % (int)(M_PI * 2*10000)) / 10000 - M_PI;
    
    CGFloat d = 1/self.speedSlider.value;
    CGPoint center=self.imageView.center;
    CGAffineTransform scale;
    CGAffineTransform rotation;
    
    if (self.translationSwitch.isOn==YES) {
        center = CGPointMake(x, y);
    }
    if (self.scaleSwitch.isOn==YES) {
        scale = CGAffineTransformMakeScale(s, s);
    }
    if (self.rotationSwitch.isOn==YES) {
        rotation = CGAffineTransformMakeRotation(r);
    }

    [UIImageView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.imageView.center=center;
                         if (self.scaleSwitch.isOn==YES) {
                             self.imageView.transform = CGAffineTransformMakeScale(s, s);
                         }
                         if (self.rotationSwitch.isOn==YES) {
                             self.imageView.transform = CGAffineTransformMakeRotation(r);
                         }
                          if (self.scaleSwitch.isOn==YES &&self.rotationSwitch.isOn==YES) {
                              self.imageView.transform=CGAffineTransformConcat(scale, rotation);
                          }
                     }
                     completion:^(BOOL finished) {
                         [self makeAnimations];
                         
                     }];
}




@end
