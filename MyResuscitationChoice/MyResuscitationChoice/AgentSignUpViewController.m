//
//  SignUpViewController.m
//  SignUpPage
//
//  Created by Nakka, Abhilash on 11/8/15.
//  Copyright © 2015 Nakka, Abhilash. All rights reserved.12
//

#import "AgentSignUpViewController.h"
#import "LoggedIn.h"
#import "LoginPage.h"
#import "DBManager.h"

@interface AgentSignUpViewController ()
@property (nonatomic, strong) DBManager *dbManager;
@end


@implementation AgentSignUpViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // For Database
    self.agentFirstName.delegate = self;
    self.agentLastName.delegate = self;
    self.agentusernameField.delegate = self;
    self.agentpasswordFiled.delegate = self;
    self.agentdateOfBirth.delegate = self;
    self.agentemailID.delegate = self;
    self.agentphoneNumber.delegate = self;
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"database.sql"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if(![defaults boolForKey:@"registered"]) {
        NSLog(@"No User Registered");
    }
    else {
        NSLog(@"User is already Registered");
        _agentreEnterPwd.hidden = YES;
        _agentregisterBtn.hidden = YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)agentregisterUser:(id)sender {
    if([_agentusernameField.text isEqualToString:@""] || [_agentpasswordFiled.text isEqualToString:@""] || [_agentreEnterPwd.text isEqualToString:@""] || [_agentLastName.text isEqualToString:@""] || [_agentFirstName.text isEqualToString:@""] || [_agentphoneNumber.text isEqualToString:@""]|| [_agentemailID.text isEqualToString:@""] || [_agentdateOfBirth.text isEqualToString:@""]){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ooops!" message:@"you must enter all the fields" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    else if ([_agentpasswordFiled.text isEqualToString:_agentreEnterPwd.text]) {
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
    [defaults setObject:_agentusernameField.text forKey:@"username"];
    [defaults setObject:_agentpasswordFiled.text forKey:@"password"];
    [defaults setObject:_agentFirstName.text forKey:@"firstname"];
    [defaults setObject:_agentLastName.text forKey:@"lastname"];
    [defaults setObject:_agentemailID.text forKey:@"emailid"];
    [defaults setObject:_agentphoneNumber.text forKey:@"Phone Number"];
    [defaults setObject:_agentdateOfBirth.text forKey:@"Date of Birth"];
    
    [defaults setBool:YES forKey:@"Registered"];
    
    [defaults synchronize];
    
    UIAlertController * success = [UIAlertController alertControllerWithTitle:@"Success" message:@"You have successfully registered" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [success addAction:defaultAction];
    //[self presentViewController:success animated:YES completion:nil];
    [self navRef];
}

-(void) navRef {
    [self performSegueWithIdentifier:@"agentRegister" sender:nil];
}

- (IBAction)login:(id)sender{
    [self loginView];
    
}
-(void)loginView {
    [self performSegueWithIdentifier:@"agentlogin" sender:nil];
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
    NSString *query = [NSString stringWithFormat:@"INSERT INTO userInfo (agentFirstName, agentLastName, agentUsername, agentPassword, agentDateOfBirth, agentEmail, AgentPhoneNumber) VALUES ('%@', '%@', '%@', '%@', '%@', '%@', '%@')", self.agentFirstName, self.agentLastName, self.agentusernameField, self.agentpasswordFiled, self.agentdateOfBirth, self.agentemailID, self.agentphoneNumber];
    
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
