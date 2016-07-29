//
//  ViewController.h
//  Supersant
//
//  Created by Panda2 on 7/7/16.
//  Copyright © 2016 share. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *splashTextView;
@property (weak, nonatomic) IBOutlet UIImageView *splashImage;

-(void) SplashAnimation;

@end

