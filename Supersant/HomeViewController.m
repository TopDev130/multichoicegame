//
//  HomeViewController.m
//  Supersant
//
//  Created by Panda2 on 7/8/16.
//  Copyright © 2016 share. All rights reserved.
//

#import "HomeViewController.h"
#import <MessageUI/MFMessageComposeViewController.h>
#import <StoreKit/StoreKit.h>

#define APP_STORE_ID 420897930

@interface HomeViewController () <MFMessageComposeViewControllerDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat heigh = [UIScreen mainScreen].bounds.size.height;
    
    NSLog(@"width=%f, height=%f", width,heigh);
    
    CGFloat btnFont = heigh * 0.03;
    _btnNewGame.titleLabel.font = [UIFont systemFontOfSize:btnFont];
    _btnGameStats.titleLabel.font = [UIFont systemFontOfSize:btnFont];
    _btnChallengeFriend.titleLabel.font = [UIFont systemFontOfSize:btnFont];
    _btnGameRules.titleLabel.font = [UIFont systemFontOfSize:btnFont];
    _btnAboutUs.titleLabel.font = [UIFont systemFontOfSize:btnFont];
    _btnRatingApp.titleLabel.font = [UIFont systemFontOfSize:btnFont];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ratingAppButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=420897930&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"]];
    
}

- (IBAction)challengeButtonClicked:(id)sender {
    
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Your device doesn't support SMS!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            
        }];
        
        [alert addAction:defaultAction];
        
        [self presentViewController:alert animated:YES completion:nil];

        return;
    }
    
    NSArray *recipents = [[NSArray alloc]init];
    NSString *message = [NSString stringWithFormat:@"Download SuperSant from the app store, I bet you can't beat my top score!"];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];

}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Failed to send SMS!" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                
            }];
            
            [alert addAction:defaultAction];
            
            [self presentViewController:alert animated:YES completion:nil];

            break;
        }
            
        case MessageComposeResultSent:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sent email success!" message:@"Thanks!" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                
            }];
            
            [alert addAction:defaultAction];
            
            [self presentViewController:alert animated:YES completion:nil];

        }
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
