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

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
- (void)testRecording {
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[app.otherElements containingType:XCUIElementTypeStaticText identifier:@"Join Today"].element tap];
    [app.buttons[@"Register"] tap];
    
    XCUIElement *recordButton = app.buttons[@"Record"];
    [recordButton tap];
    [recordButton tap];
    [app.buttons[@"VideoCapture"] tap];
    [app.buttons[@"VideoCapture"] tap];
    [app.buttons[@"Use Video"] tap];
    
    XCUIElement *saveButton = app.buttons[@"Save"];
    [saveButton tap];
    
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void)testSignature{
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Register"] tap];
    [app.buttons[@"Record"] tap];
    [app.buttons[@"Sign Your Video"] tap];
    [[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:2] childrenMatchingType:XCUIElementTypeOther].element tap];
    [app.buttons[@"Done"] tap];
    
    
    
}
-(void)testSaveBeforRecording{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Register"] tap];
    
    [app.buttons[@"Record"] tap];
    [app.buttons[@"Save"] tap];
    [app.alerts[@"Error"].collectionViews.buttons[@"OK"] tap];
    
}
-(void)testMoreThanOneTime{
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Register"] tap];
    
    XCUIElement *recordButton = app.buttons[@"Record"];
    [recordButton tap];
    [recordButton tap];
    [app.buttons[@"VideoCapture"] tap];
    [app.buttons[@"VideoCapture"] tap];
    
    
    [app.buttons[@"Use Video"] tap];
    
    XCUIElement *saveButton = app.buttons[@"Save"];
    [saveButton tap];
    [app.alerts.collectionViews.buttons[@"OK"] tap];
    [saveButton tap];
    [app.alerts[@"Error"].collectionViews.buttons[@"OK"] tap];
    
    
    
    
}

@end
