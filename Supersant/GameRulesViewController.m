//
//  GameRulesViewController.m
//  Supersant
//
//  Created by Panda2 on 7/8/16.
//  Copyright © 2016 share. All rights reserved.
//

#import "GameRulesViewController.h"

@interface GameRulesViewController ()

@end

@implementation GameRulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView.layer.cornerRadius = 20;
    _scrollView.layer.borderWidth = 1;
    _scrollView.layer.borderColor = [[UIColor grayColor] CGColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonClicked:(id)sender {
    [[self navigationController] popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
