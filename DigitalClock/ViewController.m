//
//  ViewController.m
//  DigitalClock
//
//  Created by Krystian Grabowy on 20/03/2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.blackColor;
    segmentedItemsColors = [NSMutableArray arrayWithObjects:@"White", @"Black",@"Green", @"Red", nil];
    segmentedItemsImages = [NSMutableArray arrayWithObjects:@"Image1", @"Image2", @"Image3", @"Image4", nil];
    
    _label = [[UILabel alloc]init];
    _showSettingsButton = [[UIButton alloc]init];
    _myView = [[UIView alloc]init];
    _clockColorLabel = [[UILabel alloc]init];
    _segmentedControlClock = [[UISegmentedControl alloc]init];
    _backgroundColourLabel = [[UILabel alloc]init];
    _backgroundImageLabel = [[UILabel alloc]init];
    _segmentedControlBackgroundColour = [[UISegmentedControl alloc]init];
    _segmentedControlBackgroundImage = [[UISegmentedControl alloc]init];
    _imageView = [[UIImageView alloc]init];
    _defaultButton = [[UIButton alloc]init];
    
    [self.view addSubview:_imageView];
    [self.view addSubview:_label];
    [self.view addSubview:_showSettingsButton];
    [self.view addSubview:_myView];
    [_myView addSubview:_clockColorLabel];
    [_myView addSubview:_segmentedControlClock];
    [_myView addSubview:_backgroundColourLabel];
    [_myView addSubview:_backgroundImageLabel];
    [_myView addSubview:_segmentedControlBackgroundColour];
    [_myView addSubview:_segmentedControlBackgroundImage];
    [_myView addSubview:_defaultButton];
    
    [self setupLabel];
    [self setupShowSettingsButton];
    [self setupMyView];
    [self setupClockColorLabel];
    [self setupSegmentedControlClock];
    [self setupBackgroundColorLabel];
    [self setupBackgroundImageLabel];
    [self setupSegmentedControlBackgroundColour];
    [self setupSegmentedControlBackgroundImage];
    [self setupImageView];
    [self setupDefaultButton];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    _myView.hidden = YES;
    _showSettingsButton.layer.cornerRadius = 10;
    _myView.layer.cornerRadius = 10;
}

-(void)updateTimer {
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc]init];
    [timeFormat setDateFormat:@"HH:mm:ss"];
    _label.text = [timeFormat stringFromDate:[NSDate date]];
}

-(void)setupLabel {
    _label.translatesAutoresizingMaskIntoConstraints = false;
    [_label.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = true;
    [_label.bottomAnchor constraintEqualToAnchor:_myView.topAnchor].active = true;
    [_label.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = true;
    [_label.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = true;
    
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont fontWithName:@"digital-7" size:100];
    _label.adjustsFontSizeToFitWidth = YES;
    _label.textColor = UIColor.whiteColor;
}

-(void)setupShowSettingsButton {
    _showSettingsButton.translatesAutoresizingMaskIntoConstraints = false;
    [_showSettingsButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = true;
    [_showSettingsButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = true;
    [_showSettingsButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-10].active = true;
    
    _showSettingsButton.backgroundColor = UIColor.whiteColor;
    [_showSettingsButton setTitle:@"Show Settings" forState:UIControlStateNormal];
    [_showSettingsButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [_showSettingsButton setAlpha:0.15];
    [_showSettingsButton addTarget:self action:@selector(showSettingsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)showSettingsButtonPressed: (id)sender {
    if (_myView.hidden == YES) {
        _myView.hidden = NO;
        [_showSettingsButton setAlpha:1.0];
        [_showSettingsButton setTitle:@"Hide Settings" forState:UIControlStateNormal];
    } else {
        _myView.hidden = YES;
        [_showSettingsButton setAlpha:0.15];
        [_showSettingsButton setTitle:@"Show Settings" forState:UIControlStateNormal];
    }
}

-(void)setupMyView {
    _myView.translatesAutoresizingMaskIntoConstraints = false;
    [_myView.leadingAnchor constraintEqualToAnchor:_showSettingsButton.leadingAnchor].active = true;
    [_myView.trailingAnchor constraintEqualToAnchor:_showSettingsButton.trailingAnchor].active = true;
    [_myView.bottomAnchor constraintEqualToAnchor:_showSettingsButton.topAnchor constant:-10].active = true;
    [_myView.heightAnchor constraintEqualToConstant:self.view.frame.size.height / 3].active = true;

    [_myView setBackgroundColor:UIColor.whiteColor];
}

-(void)setupClockColorLabel {
    _clockColorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_clockColorLabel.topAnchor constraintEqualToAnchor:_myView.topAnchor constant:10].active = YES;
    [_clockColorLabel.leadingAnchor constraintEqualToAnchor:_myView.leadingAnchor].active = YES;
    [_clockColorLabel.trailingAnchor constraintEqualToAnchor:_myView.trailingAnchor].active = YES;
    
    [_clockColorLabel setText:@"Clock Colour"];
    _clockColorLabel.textAlignment = NSTextAlignmentCenter;
}

-(void)setupSegmentedControlClock {
    _segmentedControlClock.translatesAutoresizingMaskIntoConstraints = false;
    [_segmentedControlClock.topAnchor constraintEqualToAnchor:_clockColorLabel.bottomAnchor].active = true;
    [_segmentedControlClock.leadingAnchor constraintEqualToAnchor:_myView.leadingAnchor].active = true;
    [_segmentedControlClock.trailingAnchor constraintEqualToAnchor:_myView.trailingAnchor].active = true;
    
    [_segmentedControlClock initWithItems:segmentedItemsColors];
    _segmentedControlClock.selectedSegmentTintColor = UIColor.systemBlueColor;
    
    [_segmentedControlClock addTarget:self action:@selector(segmentedControlClockPressed:) forControlEvents:UIControlEventValueChanged];
}

-(void)segmentedControlClockPressed: (id)sender {
    if (_segmentedControlClock.selectedSegmentIndex == 0) {
        _label.textColor = UIColor.whiteColor;
    } else if (_segmentedControlClock.selectedSegmentIndex == 1) {
        _label.textColor = UIColor.blackColor;
    } else if (_segmentedControlClock.selectedSegmentIndex == 2) {
        _label.textColor = UIColor.greenColor;
    } else {
        _label.textColor = UIColor.redColor;
    }
}

-(void)setupBackgroundColorLabel {
    _backgroundColourLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_backgroundColourLabel.topAnchor constraintEqualToAnchor:_segmentedControlClock.bottomAnchor constant:10].active = YES;
    [_backgroundColourLabel.leadingAnchor constraintEqualToAnchor:_myView.leadingAnchor].active = YES;
    [_backgroundColourLabel.trailingAnchor constraintEqualToAnchor:_myView.trailingAnchor].active = YES;
    
    [_backgroundColourLabel setText:@"Background Colour"];
    _backgroundColourLabel.textAlignment = NSTextAlignmentCenter;
}

-(void)setupSegmentedControlBackgroundColour {
    _segmentedControlBackgroundColour.translatesAutoresizingMaskIntoConstraints = false;
    [_segmentedControlBackgroundColour.topAnchor constraintEqualToAnchor:_backgroundColourLabel.bottomAnchor].active = true;
    [_segmentedControlBackgroundColour.leadingAnchor constraintEqualToAnchor:_myView.leadingAnchor].active = true;
    [_segmentedControlBackgroundColour.trailingAnchor constraintEqualToAnchor:_myView.trailingAnchor].active = true;
    
    [_segmentedControlBackgroundColour initWithItems:segmentedItemsColors];
    _segmentedControlBackgroundColour.selectedSegmentTintColor = UIColor.systemBlueColor;
    [_segmentedControlBackgroundColour addTarget:self action:@selector(segmentedControlBackgroundColourPressed:) forControlEvents:UIControlEventValueChanged];
}

-(void)segmentedControlBackgroundColourPressed: (id)sender {
    if (_segmentedControlBackgroundColour.selectedSegmentIndex == 0) {
        [self.view setBackgroundColor:UIColor.whiteColor];
    } else if (_segmentedControlBackgroundColour.selectedSegmentIndex == 1) {
        [self.view setBackgroundColor:UIColor.blackColor];
    } else if (_segmentedControlBackgroundColour.selectedSegmentIndex == 2) {
        [self.view setBackgroundColor:UIColor.greenColor];
    } else {
        [self.view setBackgroundColor:UIColor.redColor];
    }
}

-(void)setupBackgroundImageLabel {
    _backgroundImageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_backgroundImageLabel.topAnchor constraintEqualToAnchor:_segmentedControlBackgroundColour.bottomAnchor constant:10].active = YES;
    [_backgroundImageLabel.leadingAnchor constraintEqualToAnchor:_myView.leadingAnchor].active = YES;
    [_backgroundImageLabel.trailingAnchor constraintEqualToAnchor:_myView.trailingAnchor].active = YES;
    
    [_backgroundImageLabel setText:@"Background Image"];
    _backgroundImageLabel.textAlignment = NSTextAlignmentCenter;
}

-(void)setupSegmentedControlBackgroundImage {
    _segmentedControlBackgroundImage.translatesAutoresizingMaskIntoConstraints = false;
    [_segmentedControlBackgroundImage.topAnchor constraintEqualToAnchor:_backgroundImageLabel.bottomAnchor].active = true;
    [_segmentedControlBackgroundImage.leadingAnchor constraintEqualToAnchor:_myView.leadingAnchor].active = true;
    [_segmentedControlBackgroundImage.trailingAnchor constraintEqualToAnchor:_myView.trailingAnchor].active = true;
    
    [_segmentedControlBackgroundImage initWithItems:segmentedItemsImages];
    _segmentedControlBackgroundImage.selectedSegmentTintColor = UIColor.systemBlueColor;
    [_segmentedControlBackgroundImage addTarget:self action:@selector(segmentedControlBackgroundImagePressed:) forControlEvents:UIControlEventValueChanged];
}

-(void)segmentedControlBackgroundImagePressed: (id)sender {
    if (_segmentedControlBackgroundImage.selectedSegmentIndex == 0) {
        _imageView.image = [UIImage imageNamed:@"Background1"];
    } else if (_segmentedControlBackgroundImage.selectedSegmentIndex == 1) {
        _imageView.image = [UIImage imageNamed:@"Background2"];
    } else if (_segmentedControlBackgroundImage.selectedSegmentIndex == 2) {
        _imageView.image = [UIImage imageNamed:@"Background3"];
    } else {
        _imageView.image = [UIImage imageNamed:@"Background4"];
    }
}

-(void)setupImageView {
    _imageView.translatesAutoresizingMaskIntoConstraints = false;
    [_imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [_imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [_imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

-(void)setupDefaultButton {
    _defaultButton.translatesAutoresizingMaskIntoConstraints = false;
    [_defaultButton.topAnchor constraintEqualToAnchor:_segmentedControlBackgroundImage.bottomAnchor].active = true;
    [_defaultButton.bottomAnchor constraintEqualToAnchor:_myView.bottomAnchor].active = true;
    [_defaultButton.leadingAnchor constraintEqualToAnchor:_myView.leadingAnchor].active = true;
    [_defaultButton.trailingAnchor constraintEqualToAnchor:_myView.trailingAnchor].active = true;
    
    [_defaultButton setTitle:@"Default" forState:UIControlStateNormal];
    [_defaultButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [_defaultButton addTarget:self action:@selector(defaultButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)defaultButtonPressed: (id)sender {
    [_label setTextColor:UIColor.whiteColor];
    _imageView.image = nil;
    [self.view setBackgroundColor:UIColor.blackColor];
}

@end
