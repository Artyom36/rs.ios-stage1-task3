#import <XCTest/XCTest.h>
#import "Combinator.h"

@interface T3_CombinatorTests : XCTestCase
@property (nonatomic, strong) Combinator* combinator;
@end

@implementation T3_CombinatorTests

- (void)setUp {
    self.combinator = [[Combinator alloc] init];
}

- (void)tearDown {
    self.combinator = nil;
}

- (void)testCheckChoose1 {
    NSNumber *result = [self.combinator chechChooseFromArray:@[@6, @4]];
    XCTAssertEqualObjects(result, @2);
}

- (void)testCheckChoose2 {
    NSNumber *result = [self.combinator chechChooseFromArray:@[@4, @4]];
    XCTAssertEqualObjects(result, @1);
}

- (void)testCheckChoose3 {
    NSNumber *result = [self.combinator chechChooseFromArray:@[@4, @2]];
    XCTAssertEqualObjects(result, nil);
}

- (void)testCheckChoose4 {
    NSNumber *result = [self.combinator chechChooseFromArray:@[@35, @7]];
    XCTAssertEqualObjects(result, @3);
}

- (void)testCheckChoose5 {
    NSNumber *result = [self.combinator chechChooseFromArray:@[@36, @7]];
    XCTAssertEqualObjects(result, nil);
}

- (void)testCheckChoose6 {
    NSNumber *result = [self.combinator chechChooseFromArray:@[@184756, @20]];
    XCTAssertEqualObjects(result, @10);
}
@end
