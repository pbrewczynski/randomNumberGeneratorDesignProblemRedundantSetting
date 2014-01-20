//
//  Model.h
//  RedundantSetting
//
//  Created by Paweł Brewczyński on 1/19/14.
//  Copyright (c) 2014 Paweł Brewczyński. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

    @property (nonatomic) NSInteger nextNumber;

    @property (nonatomic, strong, readonly) NSMutableArray *historyOfNumbers;

    - (void) reset;
@end
