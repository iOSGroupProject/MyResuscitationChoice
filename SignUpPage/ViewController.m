//
//  ViewController.m
//  SignUpPage
//
//  Created by Nakka, Abhilash on 11/8/15.
//  Copyright © 2015 Nakka, Abhilash. All rights reserved.12
//

#import "ViewController.h"
#import "LoggedIn.h"
#import "LoginPage.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if(![defaults boolForKey:@"registered"]) {
        NSLog(@"No User Registered");
    }
    else {
        NSLog(@"User is already Registered");
        _reEnterPwd.hidden = YES;
        _registerBtn.hidden = YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerUser:(id)sender {
    if([_usernameField.text isEqualToString:@""] || [_passwordFiled.text isEqualToString:@""] || [_reEnterPwd.text isEqualToString:@""] || [_primaryLastName.text isEqualToString:@""] || [_primaryFirstName.text isEqualToString:@""] || [_phoneNumber.text isEqualToString:@""]|| [_emailID.text isEqualToString:@""] || [_dateOfBirth.text isEqualToString:@""]){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ooops!" message:@"you must enter all the fields" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    else if ([_passwordFiled.text isEqualToString:_reEnterPwd.text]) {
        NSLog(@"Password Match");
        [self registerNewUser];
    }
    else {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Ooops !" message:@"Password does not match" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void) registerNewUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_usernameField.text forKey:@"username"];
    [defaults setObject:_passwordFiled.text forKey:@"password"];
    [defaults setObject:_primaryFirstName.text forKey:@"firstname"];
    [defaults setObject:_primaryLastName.text forKey:@"lastname"];
    [defaults setObject:_emailID.text forKey:@"emailid"];
    [defaults setObject:_phoneNumber.text forKey:@"Phone Number"];
    [defaults setObject:_dateOfBirth.text forKey:@"Date of Birth"];
    
    [defaults setBool:YES forKey:@"Registered"];
    
    [defaults synchronize];
    
    UIAlertController * success = [UIAlertController alertControllerWithTitle:@"Success" message:@"You have successfully registered" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [success addAction:defaultAction];
    [self presentViewController:success animated:YES completion:nil];
    [self navRef];
}

-(void) navRef {
    [self performSegueWithIdentifier:@"Register" sender:nil];
}

- (IBAction)login:(id)sender{
    [self loginView];
    
}
-(void)loginView {
    [self performSegueWithIdentifier:@"login" sender:nil];
}










































@end
