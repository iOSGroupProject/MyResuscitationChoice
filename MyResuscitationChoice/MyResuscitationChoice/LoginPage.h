//
//  LoginPage.h
//  SignUpPage
//
//  Created by Soumya Kancharla on 11/10/15.
//  Copyright © 2015 Nakka, Abhilash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginPage : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)LoginButon:(id)sender;
- (IBAction)CancelButton:(id)sender;
- (IBAction)backGroundTap:(id)sender;

@end
