//
//  MyResuscitationChoiceUITests.m
//  MyResuscitationChoiceUITests
//
//  Created by gizmo on 11/3/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SignUpViewController.h"

@interface MyResuscitationChoiceUITests : XCTestCase

@end

@implementation MyResuscitationChoiceUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testLogin{
    SignUpViewController *signup = [[SignUpViewController alloc]init];
    signup.primaryFirstName = (UITextField *)@"jenny";
    signup.primaryLastName = (UITextField *)@"root";
    signup.usernameField = (UITextField *)@"jroot";
    signup.passwordFiled = (UITextField *)@"jenny";
    signup.reEnterPwd = (UITextField *)@"root";
    signup.emailID = (UITextField *)@"jroot@djkfd.com";
    signup.phoneNumber = (UITextField *)@"542544254";
    signup.dateOfBirth = (UITextField *)@"2007-12-15";
    
    XCTAssertTrue([signup.primaryFirstName isEqual:@"jenny"]);
    XCTAssertTrue([signup.primaryLastName isEqual:@"root"]);
    XCTAssertTrue([signup.usernameField isEqual:@"jroot"]);
    XCTAssertTrue([signup.passwordFiled isEqual:@"root"]);
    XCTAssertTrue([signup.reEnterPwd isEqual:@"jenny"]);
    XCTAssertTrue([signup.emailID isEqual:@"jroot@djkfd.com"]);
    XCTAssertTrue([signup.phoneNumber isEqual:@"542544254"]);
    XCTAssertTrue([signup.dateOfBirth isEqual:@"2007-12-15"]);

    
}
- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
