// LibDiveComputerWrapper.m

#import "LibDiveComputerWrapper.h"
#include <libdivecomputer/context.h>

@implementation LibDiveComputerWrapper
- (NSNumber *)createContext {
  struct dc_context *ctx = dc_context_free(NULL);
  return @( (uintptr_t)ctx );
}

@end