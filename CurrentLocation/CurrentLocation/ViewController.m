//
//  ViewController.m
//  CurrentLocation
//
//  Created by Stephen Kyles on 4/15/14.
//  Copyright (c) 2014 Blue Owl Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) UIToolbar *toolBar;
@property (nonatomic) UISegmentedControl *segmentedControl;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Current Location";
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
