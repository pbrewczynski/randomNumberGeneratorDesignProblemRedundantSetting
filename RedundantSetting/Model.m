//
//  Model.m
//  RedundantSetting
//
//  Created by Paweł Brewczyński on 1/19/14.
//  Copyright (c) 2014 Paweł Brewczyński. All rights reserved.
//

#import "Model.h"

@interface Model()

@property (nonatomic, strong, readwrite) NSMutableArray *historyOfNumbers;

@end

@implementation Model


- (instancetype) init {
    self = [super init];
    
    if(self != nil) {
        self.historyOfNumbers = [[NSMutableArray alloc] initWithCapacity:10];
    }
    
    return self;
}


- (NSInteger)nextNumber {
    _nextNumber = rand();
    
    [self.historyOfNumbers addObject: @(_nextNumber)];
    
    return _nextNumber;
}

- (void) reset {
    [self.historyOfNumbers removeAllObjects];
    // no need to reset self.nextNumber since it is anway cleaned every tine is getted - look " - (NSInteger) nextNumber {...}
}

@end
