//
//  UINavigationBar_Custom.h
//  
//
//  Created by Stephen Kyles on 4/22/14.
//
//


// Customize the tint color of the nav bar
// this includes all navigation items

[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

// Change nav bar title color and font

[[UINavigationBar appearance] setTitleTextAttributes:
  @{NSForegroundColorAttributeName : [UIColor whiteColor],
    NSFontAttributeName : [UIFont fontWithName:@"Helvetica-light" size:20.0f]}];

// Set status bar once the info.plist is altered

[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];