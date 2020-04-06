#import <XCTest/XCTest.h>

#define fequal(a,b) (fabs((a) - (b)) < FLT_EPSILON)

@interface RS_Task3_UICheckerUITests : XCTestCase

@property (nonatomic) XCUIApplication *app;

@end

@implementation RS_Task3_UICheckerUITests

- (void)setUp {
    self.continueAfterFailure = NO;

    _app = [[XCUIApplication alloc] init];
    [_app launch];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testElementPositions {
    
    // Views
    XCUIElement *mainView = [_app.otherElements elementMatchingType:XCUIElementTypeAny identifier:@"mainView"];
    CGRect frameMainView = [mainView frame];
    
    XCUIElement *viewResultColor = [_app.otherElements elementMatchingType:XCUIElementTypeAny identifier:@"viewResultColor"];
    CGRect frameViewResultColor = [viewResultColor frame];
        
    // Labels
    XCUIElement *labelRed = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelRed"];
    CGRect frameLabelRed = [labelRed frame];
    
    XCUIElement *labelGreen = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelGreen"];
    CGRect frameLabelGreen = [labelGreen frame];

    XCUIElement *labelBlue = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelBlue"];
    CGRect frameLabelBlue = [labelBlue frame];
    
    XCUIElement *labelResultColor = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelResultColor"];
    CGRect frameLabelResultColor = [labelResultColor frame];
    
    // TextFields
    XCUIElement *textFieldRed = _app.textFields[@"textFieldRed"];
    CGRect frameTextFieldRed  = [textFieldRed  frame];

    XCUIElement *textFieldGreen = _app.textFields[@"textFieldGreen"];
    CGRect frameTextFieldGreen = [textFieldGreen frame];
    
    XCUIElement *textFieldBlue = _app.textFields[@"textFieldBlue"];
    CGRect frameTextFieldBlue = [textFieldBlue frame];
    
    // Buttons
    XCUIElement *buttonProcess = _app.buttons[@"buttonProcess"];
    CGRect frameButtonProcess = [buttonProcess frame];
    
    // Tests
    XCTAssertTrue(frameLabelRed.origin.x > 0);
    
    XCTAssertTrue(fequal(frameLabelRed.origin.x, frameLabelGreen.origin.x));
    XCTAssertTrue(fequal(frameLabelRed.origin.x, frameLabelBlue.origin.x));
    XCTAssertTrue(fequal(frameLabelRed.origin.x, frameLabelResultColor.origin.x));
    
    XCTAssertTrue(fequal(frameTextFieldRed.origin.x, frameTextFieldGreen.origin.x));
    XCTAssertTrue(fequal(frameTextFieldRed.origin.x, frameTextFieldBlue.origin.x));
    XCTAssertTrue(frameTextFieldRed.origin.x < frameViewResultColor.origin.x);

    XCTAssertTrue(fequal(frameLabelRed.origin.y + frameLabelRed.size.height / 2, frameTextFieldRed.origin.y + frameTextFieldRed.size.height / 2));
    XCTAssertTrue(fequal(frameLabelGreen.origin.y + frameLabelGreen.size.height / 2, frameTextFieldGreen.origin.y + frameTextFieldGreen.size.height / 2));
    XCTAssertTrue(fequal(frameLabelBlue.origin.y + frameLabelBlue.size.height / 2, frameTextFieldBlue.origin.y + frameTextFieldBlue.size.height / 2));
    XCTAssertTrue(fequal(frameLabelResultColor.origin.y + frameLabelResultColor.size.height / 2, frameViewResultColor.origin.y + frameViewResultColor.size.height / 2));

    XCTAssertTrue(fequal(frameMainView.size.width - frameTextFieldRed.origin.x - frameTextFieldRed.size.width, frameMainView.size.width - frameViewResultColor.origin.x - frameViewResultColor.size.width));

    XCTAssertTrue(fequal(frameButtonProcess.origin.x, frameMainView.size.width - frameButtonProcess.origin.x - frameButtonProcess.size.width));
    
    XCTAssertTrue(frameLabelResultColor.origin.y < frameLabelRed.origin.y);
    XCTAssertTrue(frameLabelRed.origin.y < frameLabelGreen.origin.y);
    XCTAssertTrue(frameLabelGreen.origin.y < frameLabelBlue.origin.y);
    XCTAssertTrue(frameLabelBlue.origin.y < frameButtonProcess.origin.y);
    
}

- (void)testState {
    // Labels
    XCUIElement *labelRed = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelRed"];
    XCTAssertTrue([labelRed.label isEqualToString:@"RED"]);
    
    XCUIElement *labelGreen = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelGreen"];
    XCTAssertTrue([labelGreen.label isEqualToString:@"GREEN"]);

    XCUIElement *labelBlue = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelBlue"];
    XCTAssertTrue([labelBlue.label isEqualToString:@"BLUE"]);
    
    XCUIElement *labelResultColor = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelResultColor"];
    XCTAssertTrue([labelResultColor.label isEqualToString:@"Color"]);

    // TextFields
    XCUIElement *textFieldRed = _app.textFields[@"textFieldRed"];
    XCTAssertTrue([textFieldRed.placeholderValue isEqualToString:@"0..255"]);
    
    XCUIElement *textFieldGreen = _app.textFields[@"textFieldGreen"];
    XCTAssertTrue([textFieldGreen.placeholderValue isEqualToString:@"0..255"]);
    
    XCUIElement *textFieldBlue = _app.textFields[@"textFieldBlue"];
    XCTAssertTrue([textFieldBlue.placeholderValue isEqualToString:@"0..255"]);

    // Buttons
    XCUIElement *buttonProcess = _app.buttons[@"buttonProcess"];
    XCTAssertTrue([buttonProcess.label isEqualToString:@"Process"]);    
}


- (void)testNormal1 {
    XCUIElement *textFieldRed = _app.textFields[@"textFieldRed"];
    [textFieldRed tap];
    [textFieldRed typeText:@"50"];
    
    XCUIElement *textFieldGreen = _app.textFields[@"textFieldGreen"];
    [textFieldGreen tap];
    [textFieldGreen typeText:@"100"];

    XCUIElement *textFieldBlue = _app.textFields[@"textFieldBlue"];
    [textFieldBlue tap];
    [textFieldBlue typeText:@"150"];
    
    XCUIElement *buttonProcess = _app.buttons[@"buttonProcess"];
    [buttonProcess tap];
    
    XCUIElement *labelResultColor = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelResultColor"];
    XCTAssertTrue([labelResultColor.label isEqualToString:@"0x326496"]);
}

- (void)testNormal2 {
    XCUIElement *textFieldRed = _app.textFields[@"textFieldRed"];
    [textFieldRed tap];
    [textFieldRed typeText:@"200"];
    
    XCUIElement *textFieldGreen = _app.textFields[@"textFieldGreen"];
    [textFieldGreen tap];
    [textFieldGreen typeText:@"50"];

    XCUIElement *textFieldBlue = _app.textFields[@"textFieldBlue"];
    [textFieldBlue tap];
    [textFieldBlue typeText:@"50"];
    
    XCUIElement *buttonProcess = _app.buttons[@"buttonProcess"];
    [buttonProcess tap];
    
    XCUIElement *labelResultColor = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelResultColor"];
    XCTAssertTrue([labelResultColor.label isEqualToString:@"0xC83232"]);
    
    [textFieldRed tap];
    [textFieldRed typeText:@"13"];
    
    XCTAssertTrue([labelResultColor.label isEqualToString:@"Color"]);
    
    [textFieldBlue tap];
    [textFieldBlue typeText:@"173"];

    [textFieldGreen tap];
    [textFieldGreen typeText:@"220"];
    
    [buttonProcess tap];
    
    XCTAssertTrue([labelResultColor.label isEqualToString:@"0x0DDCAD"]);
}

- (void)testError1 {
    XCUIElement *textFieldRed = _app.textFields[@"textFieldRed"];
    [textFieldRed tap];
    [textFieldRed typeText:@"260"];
    
    XCUIElement *textFieldGreen = _app.textFields[@"textFieldGreen"];
    [textFieldGreen tap];
    [textFieldGreen typeText:@"50"];

    XCUIElement *textFieldBlue = _app.textFields[@"textFieldBlue"];
    [textFieldBlue tap];
    [textFieldBlue typeText:@"50"];
    
    XCUIElement *buttonProcess = _app.buttons[@"buttonProcess"];
    [buttonProcess tap];
    
    XCUIElement *labelResultColor = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelResultColor"];
    XCTAssertTrue([labelResultColor.label isEqualToString:@"Error"]);
}

- (void)testError2 {
    XCUIElement *buttonProcess = _app.buttons[@"buttonProcess"];
    [buttonProcess tap];
    
    XCUIElement *labelResultColor = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelResultColor"];
    XCTAssertTrue([labelResultColor.label isEqualToString:@"Error"]);
}

- (void)testError3 {
    XCUIElement *textFieldRed = _app.textFields[@"textFieldRed"];
    [textFieldRed tap];
    [textFieldRed typeText:@"150"];

    XCUIElement *buttonProcess = _app.buttons[@"buttonProcess"];
    [buttonProcess tap];
    
    XCUIElement *labelResultColor = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelResultColor"];
    XCTAssertTrue([labelResultColor.label isEqualToString:@"Error"]);
    
    [textFieldRed tap];
    XCTAssertTrue([labelResultColor.label isEqualToString:@"Color"]);
}

- (void)testError4 {
    XCUIElement *textFieldRed = _app.textFields[@"textFieldRed"];
    [textFieldRed tap];
    [textFieldRed typeText:@"2a0"];
    
    XCUIElement *textFieldGreen = _app.textFields[@"textFieldGreen"];
    [textFieldGreen tap];
    [textFieldGreen typeText:@"5"];

    XCUIElement *textFieldBlue = _app.textFields[@"textFieldBlue"];
    [textFieldBlue tap];
    [textFieldBlue typeText:@"5"];
    
    XCUIElement *buttonProcess = _app.buttons[@"buttonProcess"];
    [buttonProcess tap];
    
    XCUIElement *labelResultColor = [_app.staticTexts elementMatchingType:XCUIElementTypeAny identifier:@"labelResultColor"];
    XCTAssertTrue([labelResultColor.label isEqualToString:@"Error"]);
}


@end
