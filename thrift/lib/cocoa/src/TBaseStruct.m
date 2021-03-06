/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#import <Foundation/Foundation.h>

#import "TBaseStruct.h"
#import "TException.h"

@implementation TBaseStruct {
  BOOL _troot_is_immutable;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _troot_is_immutable = NO;
  }
  return self;
}

/**
 convert this instance to be immutable
 */
- (BOOL)makeImmutable {
  if (!_troot_is_immutable) {
    _troot_is_immutable = YES;
  }
  return _troot_is_immutable;
}

/**
 check whether this instance is immutable
 */
- (BOOL)isImmutable {
  return _troot_is_immutable;
}

/**
 check whether this instance is mutable
 */
- (BOOL)isMutable {
  return !_troot_is_immutable;
}

/**
 throw an exception in case this instance is immutable (to be called before
 mutating the instance)
 */
- (void)throwExceptionIfImmutable {
  if (_troot_is_immutable) {
    @throw [TException
        exceptionWithName:@"TException"
                   reason:[NSString
                              stringWithFormat:@"can't mutate immutable: %@",
                                               [self description]]];
  }
}

/**
    must be implemented by all the children
 */
- (id)mutableCopyWithZone:(NSZone*)zone {
  @throw [TException
      exceptionWithName:@"TException"
                 reason:[NSString
                            stringWithFormat:
                                @"must implement mutableCopyWithZone for: %@",
                                [self class]]];
}

/**
    generic implementation based on mutableCopyWithZone
 */
- (id)copyWithZone:(NSZone*)zone {
  id immutableCopy = [self mutableCopy];
  [immutableCopy makeImmutable];
  return immutableCopy;
}

@end
