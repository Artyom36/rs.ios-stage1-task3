#import <XCTest/XCTest.h>
#import "PolynomialConverter.h"

@interface T3_PolynomialTests : XCTestCase
@property (nonatomic, strong) PolynomialConverter *converter;
@end

@implementation T3_PolynomialTests

- (void)setUp {
    self.converter = [[PolynomialConverter alloc] init];
}

- (void)tearDown {
    self.converter = nil;
}

- (void)testConvertToString1 {
    NSString *result = [self.converter convertToStringFrom:@[@2, @-1, @78]];
    XCTAssertEqualObjects(result, @"2x^2 - x + 78");
}

- (void)testConvertToString2 {
    NSString *result = [self.converter convertToStringFrom:@[@2, @8, @0, @78]];
    XCTAssertEqualObjects(result, @"2x^3 + 8x^2 + 78");
}


- (void)testConvertToString3 {
    NSString *result = [self.converter convertToStringFrom:@[@2, @0]];
    XCTAssertEqualObjects(result, @"2x");
}

- (void)testConvertToString4 {
    NSString *result = [self.converter convertToStringFrom:@[@2, @-6, @45, @5, @32, @0, @3, @5]];
    XCTAssertEqualObjects(result, @"2x^7 - 6x^6 + 45x^5 + 5x^4 + 32x^3 + 3x + 5");
}

- (void)testConvertToStringEmptyInputArray {
    NSString *result = [self.converter convertToStringFrom:@[]];
    XCTAssertEqualObjects(result, nil);
}


@end
