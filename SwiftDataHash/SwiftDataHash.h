//
//  SwiftDataHash.h
//  SwiftDataHash
//
//  Created by William Kent on 1/6/15.
//  Copyright (c) 2015 William Kent. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CCHashAlgorithm) {
    CCHashAlgorithmMD5,
    CCHashAlgorithmSHA1,
    CCHashAlgorithmSHA224,
    CCHashAlgorithmSHA256,
    CCHashAlgorithmSHA384,
    CCHashAlgorithmSHA512
};

NS_ASSUME_NONNULL_BEGIN

extern NSInteger CCHashLengthOfDigest(CCHashAlgorithm algorithm);
extern NSData *CCHashPerform(CCHashAlgorithm algorithm, NSData *input);
extern NSData *CCHashPerformHMAC(CCHashAlgorithm algorithm, NSData *input, NSData *key);

// The rest of this file is boilerplate stuff that has to be here.
FOUNDATION_EXPORT double SwiftDataHashVersionNumber;
FOUNDATION_EXPORT const unsigned char SwiftDataHashVersionString[];

NS_ASSUME_NONNULL_END
