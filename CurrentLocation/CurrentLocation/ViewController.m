//
//  ViewController.m
//  CurrentLocation
//
//  Created by Stephen Kyles on 4/15/14.
//  Copyright (c) 2014 Blue Owl Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL zoomAndHoldUserLocaton;
}
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *currentLocation;
@property (nonatomic) UIToolbar *toolBar;
@property (nonatomic) UISegmentedControl *segmentedControl;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Current Location";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MapType"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(showMapTypePicker:)];
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.mapView];
    
    zoomAndHoldUserLocaton = YES;
    [self getCurrentLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMapTypePicker:(id)sender
{
    
}

- (void)setRegion
{
    MKCoordinateSpan span = MKCoordinateSpanMake(0.02, 0.02);
    MKCoordinateRegion region = MKCoordinateRegionMake(self.currentLocation.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    self.mapView.showsUserLocation = YES;
    zoomAndHoldUserLocaton = NO;
}

- (void)getCurrentLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
}

# pragma mark - CLLocation Delegate

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    self.currentLocation = newLocation;
    if (zoomAndHoldUserLocaton) {
        [self setRegion];
    }
}

@end
