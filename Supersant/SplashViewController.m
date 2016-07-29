//
//  ViewController.m
//  Supersant
//
//  Created by Panda2 on 7/7/16.
//  Copyright © 2016 share. All rights reserved.
//

#import "SplashViewController.h"
#import "StartViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = YES;
    
    [self SplashAnimation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) SplashAnimation {
    [_splashTextView setAlpha:0.0f];
    [_splashImage setAlpha:0.0f];
    
    //fade in
    [UIView animateWithDuration:3.0f animations:^{
        
        [_splashTextView setAlpha:1.0f];
        
    } completion:^(BOOL finished) {
        
        //fade out
        [UIView animateWithDuration:1.5f animations:^{
            
            [_splashTextView setAlpha:0.0f];
            
        } completion:nil];

        //fade in
        [UIView animateWithDuration:2.0f animations:^{
            
            [_splashImage setAlpha:1.0f];
            
        } completion:^(BOOL finished) {
            
            StartViewController *startViewController = (StartViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"StartViewControllerID"];
            [self.navigationController pushViewController:startViewController animated:YES];
            
        }];
    }];
}

@end
