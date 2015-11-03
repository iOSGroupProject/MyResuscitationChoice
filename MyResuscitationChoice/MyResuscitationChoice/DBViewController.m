//
//  DBViewController.m
//  MyResuscitationChoice
//
//  Created by gizmo on 11/3/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//

#import "DBViewController.h"
#import "DBController.h"

@interface DBViewController ()
@property (nonatomic, strong) DBController *dbController;
@end

@implementation DBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
    // Make self the delegate of the textfields.
    self.txtUserName.delegate = self;
    self.txtPassword.delegate = self;
    self.txtFirstname.delegate = self;
    self.txtLastname.delegate = self;
    self.txtDateOfBirth.delegate = self;
    self.txtPhoneNumber.delegate = self;
    // Init Database
    self.dbController = [[DBController alloc] initWithDatabaseFilename:@"myresuscitationchoice.sqlite"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)saveInfo:(id)sender {
    // Prepare the query string.
    NSString *query = [NSString stringWithFormat:@"insert into peopleInfo values(null, '%@', '%@', '%@', '%@', '%@', '%@')", self.txtUserName.text, self.txtPassword.text, self.txtFirstname.text, self.txtLastname.text, self.txtDateOfBirth.text, self.txtPhoneNumber.text];
    
    // Execute the query.
    [self.dbController executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbController.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbController.affectedRows);
        
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
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
