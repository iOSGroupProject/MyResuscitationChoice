//
//  SignUpViewController.m
//  SignUpPage
//
//  Created by Nakka, Abhilash on 11/8/15.
//  Copyright © 2015 Nakka, Abhilash. All rights reserved.12
//

#import "SignUpViewController.h"
#import "LoggedIn.h"
#import "LoginPage.h"
#import "DBManager.h"

@interface SignUpViewController ()
@property (nonatomic, strong) DBManager *dbManager;
@end


@implementation SignUpViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /*self.primaryFirstName.delegate = self;
    self.primaryLastName.delegate = self;
    self.usernameField.delegate = self;
    self.passwordFiled.delegate = self;
    self.dateOfBirth.delegate = self;
    self.emailID.delegate = self;*/
    self.phoneNumber.delegate = self;
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"database.sql"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    datePicker=[[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    //UIDatePicker.date=UIDatePickerModeDate;
    [_dateOfBirth setInputView:datePicker];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [_dateOfBirth setInputAccessoryView:toolBar];
    
 
    
    if(![defaults boolForKey:@"registered"]) {
        NSLog(@"No User Registered");
    }
    else {
        NSLog(@"User is already Registered");
        _reEnterPwd.hidden = YES;
        _registerBtn.hidden = YES;
    }
    
}
-(void) ShowSelectedDate
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    _dateOfBirth.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    [_dateOfBirth resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *resultingString = [textField.text stringByReplacingCharactersInRange: range withString: string];
    
    // This allows backspace
    if ([resultingString length] == 0) {
        return true;
    }
    
    double holder;
    NSScanner *scan = [NSScanner scannerWithString: resultingString];
    
    return [scan scanDouble: &holder] && [scan isAtEnd];
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
    _usernameField.text = nil;
    _passwordFiled.text = nil;
    _reEnterPwd.text =nil;
    _dateOfBirth.text = nil;
    _emailID.text = nil;
    _phoneNumber.text = nil;
    _primaryFirstName.text =nil;
    _primaryLastName.text =nil;
    
    //[self presentViewController:success animated:YES completion:nil];
    [self navRef];
}

-(void) navRef {
    [self performSegueWithIdentifier:@"Register" sender:nil];
}

- (IBAction)login:(id)sender{
    [self loginView];
    
}

- (IBAction)BackgroudTap:(id)sender {
     [self.view endEditing:YES];
}
-(void)loginView {
    [self performSegueWithIdentifier:@"login" sender:nil];
}


- (IBAction)addNewRecord:(id)sender {
 //   [self performSegueWithIdentifier:@"idSegueEditInfo" sender:self]; Segue to loged in screne
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)saveInfo:(id)sender {
    // Prepare the query string.
    NSString *query = [NSString stringWithFormat:@"INSERT INTO userInfo (PrimaryFirstName, PrimaryLastName, Username, Password, PrimaryDateOfBirth, PrimaryEmail, AgentPhoneNumber) VALUES ('%@', '%@', '%@', '%@', '%@', '%@', '%@')", self.primaryFirstName, self.primaryLastName, self.usernameField, self.passwordFiled, self.dateOfBirth, self.emailID, self.phoneNumber];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
}

// peopleInfo(UID integer primary key, PrimaryFirstName text, PrimaryLastName text, PrimaryPhoneNumber text, PrimaryEmail text, PrimaryDateOfBirth text, AdvancedDirectiveLocation text, AgentFirstName text, AgentLastName text, AgentPhoneNumber text, AgentDateOfBirth text, UserChoice text, Username text, Password text)
@end
