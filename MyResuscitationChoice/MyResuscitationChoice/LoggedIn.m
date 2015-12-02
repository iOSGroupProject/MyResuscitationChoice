//
//  LoggedIn.m
//  SignUpPage
//
//  Created by Soumya Kancharla on 11/10/15.
//  Copyright © 2015 Nakka, Abhilash. All rights reserved.
//

#import "LoggedIn.h"

@interface LoggedIn ()

@end

@implementation LoggedIn

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Loggedout:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
