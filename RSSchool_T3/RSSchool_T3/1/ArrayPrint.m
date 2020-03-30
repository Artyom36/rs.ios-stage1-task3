#import "ArrayPrint.h"


@protocol ConvertableToString <NSObject>
- (NSString *)toSrting;
@end

@interface NSNull (Convert) <ConvertableToString>
@end

@interface NSString (Convert) <ConvertableToString>
@end

@interface NSArray (Convert) <ConvertableToString>
@end

@interface NSNumber (Convert) <ConvertableToString>
@end

@implementation NSNumber (Convert)
- (NSString *)toSrting {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@", self];
    return descriptionString;
}
@end

@implementation NSNull (Convert)
- (NSString *)toSrting {
    NSString *descriptionString = @"null";
    return descriptionString;
}
@end

@implementation NSString (Convert)
- (NSString *)toSrting {
    NSString *stringToInsert = @"\"";
    NSMutableString *joinedString = [[NSMutableString alloc] initWithString:stringToInsert];
    [joinedString appendString:self];
    [joinedString appendString:stringToInsert];
    return joinedString;
}
@end

@implementation NSArray (Convert)
- (NSString *)toSrting {
    NSMutableString *joinedString = [[NSMutableString alloc] initWithString:@"["];
    for(NSInteger i = 0; i < self.count; i++) {
        if ([self[i] respondsToSelector:@selector(toSrting)]) {
            [joinedString appendString:[self[i] toSrting]];
        } else {
            [joinedString appendString:@"unsupported"];
        }
        [joinedString appendString:@","];
    }
    if (self.count) [joinedString deleteCharactersInRange:NSMakeRange(joinedString.length - 1, 1)];
    [joinedString appendString:@"]"];
    return joinedString;
}
@end

@implementation NSArray (RSSchool_Extension_Name)
- (NSString *)print {
    return [NSString stringWithString:[self toSrting]];
}
@end
