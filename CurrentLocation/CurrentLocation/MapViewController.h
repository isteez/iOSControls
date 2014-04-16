//
//  ViewController.h
//  CurrentLocation
//
//  Created by Stephen Kyles on 4/15/14.
//  Copyright (c) 2014 Blue Owl Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate, UIActionSheetDelegate, MKMapViewDelegate>

@property (nonatomic) MKMapView *mapView;

@end
