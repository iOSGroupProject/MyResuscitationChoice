//
//  SignUpViewController.h
//  SignUpPage
//
//  Created by Nakka, Abhilash on 11/8/15.
//  Copyright © 2015 Nakka, Abhilash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordFiled;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPwd;
@property (weak, nonatomic) IBOutlet UITextField *primaryFirstName;
@property (weak, nonatomic) IBOutlet UITextField *primaryLastName;
@property (weak, nonatomic) IBOutlet UITextField *emailID;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *dateOfBirth;


- (IBAction)registerUser:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)backgroundTap:(id)sender;

// For Database
- (IBAction)saveInfo:(id)sender;

@end


