//
//  ViewController.h
//  DigitalClock
//
//  Created by Krystian Grabowy on 20/03/2022.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
    NSMutableArray *segmentedItemsColors;
    NSMutableArray *segmentedItemsImages;
}

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *showSettingsButton;
@property (strong, nonatomic) UIView *myView;
@property (strong, nonatomic) UILabel *clockColorLabel;
@property (strong, nonatomic) UISegmentedControl *segmentedControlClock;
@property (strong, nonatomic) UILabel *backgroundColourLabel;
@property (strong, nonatomic) UISegmentedControl *segmentedControlBackgroundColour;
@property (strong, nonatomic) UILabel *backgroundImageLabel;
@property (strong, nonatomic) UISegmentedControl *segmentedControlBackgroundImage;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *defaultButton;

@end

