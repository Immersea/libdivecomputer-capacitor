// LibDiveComputerWrapper.h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Objective-C wrapper around libdc C API for use in Swift
@interface LibDiveComputerWrapper : NSObject

/// Creates a new dc_context and returns its pointer as an NSNumber
- (NSNumber *)createContext;

@end

NS_ASSUME_NONNULL_END