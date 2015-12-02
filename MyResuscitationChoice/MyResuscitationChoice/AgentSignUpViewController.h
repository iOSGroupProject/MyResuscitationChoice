//
//  AgentSignUpViewController.h
//  MyResuscitationChoice
//
//  Created by gizmo on 12/1/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgentSignUpViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *agentregisterBtn;
@property (weak, nonatomic) IBOutlet UIButton *agentloginBtn;
@property (weak, nonatomic) IBOutlet UITextField *agentusernameField;
@property (weak, nonatomic) IBOutlet UITextField *agentpasswordFiled;
@property (weak, nonatomic) IBOutlet UITextField *agentreEnterPwd;
@property (weak, nonatomic) IBOutlet UITextField *agentFirstName;
@property (weak, nonatomic) IBOutlet UITextField *agentLastName;
@property (weak, nonatomic) IBOutlet UITextField *agentemailID;
@property (weak, nonatomic) IBOutlet UITextField *agentphoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *agentdateOfBirth;


- (IBAction)agentregisterUser:(id)sender;
- (IBAction)agentlogin:(id)sender;
- (IBAction)backgroundTapA:(id)sender;

// For Database
- (IBAction)saveInfo:(id)sender;

@end


