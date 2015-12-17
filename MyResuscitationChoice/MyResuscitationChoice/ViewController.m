//
//  ViewController.m
//  MyResuscitationChoice
//
//  Created by gizmo on 11/3/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//ahmedalanazi

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    


    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Play:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=ccqQ_BRGsAU";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video loadRequest:request];
    
}

- (IBAction)play2:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=AdtsXcZC0_w";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video2 loadRequest:request];
}

- (IBAction)Play3:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=7eabz4V-tvU";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video3 loadRequest:request];
}

- (IBAction)Play4:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=m7dNfre2IWA";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video4 loadRequest:request];
}

- (IBAction)Play5:(id)sender {
    NSString *strem = @"https://www.youtube.com/watch?v=x0O43ugg8zU";
    NSURL *url = [NSURL URLWithString:strem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_video5 loadRequest:request];
}

- (IBAction)Logout:(id)sender {
        [self dismissViewControllerAnimated:YES completion:nil];
}







@end
