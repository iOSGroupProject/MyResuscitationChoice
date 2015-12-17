//
//  LoginPage.m
//  SignUpPage
//
//  Created by Soumya Kancharla on 11/10/15.
//  Copyright © 2015 Nakka, Abhilash. All rights reserved.
//

#import "LoginPage.h"

@interface LoginPage ()

@end

@implementation LoginPage

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



- (IBAction)LoginButon:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([_usernameTextField.text isEqualToString:[defaults objectForKey:@"username"]] && [_passwordTextField.text isEqualToString:[defaults objectForKey:@"password"]]) {
        [self performSegueWithIdentifier:@"login" sender:self];
        _usernameTextField.text = nil;
        _passwordTextField.text = nil;
        
    }
    
    else{
        UIAlertController * success = [UIAlertController alertControllerWithTitle:@"Ooops" message:@"Your username and password does not match. Plese try again." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
        [success addAction:defaultAction];
        [self presentViewController:success animated:YES completion:nil];
    }
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)CancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion: nil];
}

- (IBAction)backGroundTap:(id)sender {
    [self.view endEditing:YES];
}

@end
