//
//  ViewController.m
//  CurrentLocation
//
//  Created by Stephen Kyles on 4/15/14.
//  Copyright (c) 2014 Blue Owl Labs. All rights reserved.
//

#import "ViewController.h"

static const int toolBarHeight = 50;

@interface ViewController ()
{
    BOOL zoomAndHoldUserLocaton;
    BOOL mapTypeToolBarDidShow;
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
    mapTypeToolBarDidShow = NO;
    [self getCurrentLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMapTypePicker:(id)sender
{
    if (!mapTypeToolBarDidShow) {
        mapTypeToolBarDidShow = YES;
        self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,
                                                                   self.view.frame.size.height - toolBarHeight,
                                                                   self.view.frame.size.width,
                                                                   toolBarHeight)];
        self.segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects: @"Standard", @"Satellite", @"Hybrid", nil]];
        self.segmentedControl.frame = CGRectMake(0, 0, self.toolBar.frame.size.width - 20, 30);
        self.segmentedControl.selectedSegmentIndex = 0;
        self.segmentedControl.tintColor = [UIColor whiteColor];
        [self.segmentedControl addTarget:self action:@selector(segmentedValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        UIBarButtonItem *segmentedControlButtonItem = [[UIBarButtonItem alloc] initWithCustomView:(UIView *)self.segmentedControl];
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        self.toolBar.items = [NSArray arrayWithObjects: flexibleSpace, segmentedControlButtonItem, flexibleSpace, nil];
        self.toolBar.barStyle = UIBarStyleBlackTranslucent;
        [self.view addSubview:self.toolBar];
    }
    else {
        [self.toolBar removeFromSuperview];
        mapTypeToolBarDidShow = NO;
    }
}

- (void)segmentedValueChanged:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    if (selectedSegment == 0) {
        self.mapView.mapType = MKMapTypeStandard;
    }
    else if (selectedSegment == 1) {
        self.mapView.mapType = MKMapTypeSatellite;
    }
    else {
        self.mapView.mapType = MKMapTypeHybrid;
    }
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
