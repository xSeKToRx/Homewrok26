//
//  ViewController.h
//  Homewrok26
//
//  Created by Dima Sektor on 24.07.16.
//  Copyright © 2016 Dima Sektor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UISwitch *translationSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *imageSegmentedControl;
@property (weak, nonatomic) IBOutlet UISwitch *rotationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;


- (IBAction)imageChanged:(UISegmentedControl *)sender;
- (IBAction)valueChanged:(UISlider *)sender;
- (IBAction)actionTranslationSwitch:(UISwitch *)sender;
- (IBAction)actionScaleSwitch:(UISwitch *)sender;
- (IBAction)actionRotationSwitch:(UISwitch *)sender;

@end

