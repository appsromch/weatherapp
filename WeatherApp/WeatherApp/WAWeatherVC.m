//
//  WAWeatherController.m
//  WeatherApp
//
//  Created by Mitchell Cooper on 10/28/13.
//  Copyright (c) 2013 Really Good. All rights reserved.
//

#import "WAWeatherVC.h"
#import "WALocation.h"
#import "WAAppDelegate.h"

@interface WAWeatherVC ()

@end

@implementation WAWeatherVC

#pragma mark - View controller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = TABLE_COLOR;

}

- (void)viewWillAppear:(BOOL)animated {
    //self.navigationController.navigationBar.tintColor    = BLUE_COLOR;
    //self.navigationController.navigationBar.barTintColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Updates from WALocation

// update the current location (city) title.
- (void)updateLocationTitle:(NSString *)title {
    self.navigationItem.title =
    self.locationTitle.text = title;
}

// update the region; the state or country (outside of US).
- (void)updateRegionTitle:(NSString *)title {
    self.fullLocationLabel.text = FMT(@"%@, %@", self.locationTitle.text, title);
}

// update the current temperature.
- (void)updateTemperature:(float)metric fahrenheit:(float)fahrenheit {
    // TODO: make an option for displaying temperatures in centigrade.
    self.temperature.text = [NSString stringWithFormat:@"%.f", fahrenheit];
}

- (void)updateFullTitle:(NSString *)title {
    self.fullLocationLabel.text = title;
}

- (void)updateLatitude:(float)latitude longitude:(float)longitude {
    self.coordinateLabel.text = FMT(@"%f,%f", latitude, longitude);
}

- (void)updateConditions:(NSString *)conditions {
    self.conditionsLabel.text = conditions;
}
@end
