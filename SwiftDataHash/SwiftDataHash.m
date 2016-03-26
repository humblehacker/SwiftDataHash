//
//  SwiftDataHash.m
//  SwiftDataHash
//
//  Created by William Kent on 1/6/15.
//  Copyright (c) 2015 William Kent. All rights reserved.
//

#import <CommonCrypto/CommonCrypto.h>
#import "SwiftDataHash.h"

NSInteger CCHashLengthOfDigest(CCHashAlgorithm algorithm) {
    switch (algorithm) {
        case CCHashAlgorithmMD5:
            return CC_MD5_DIGEST_LENGTH;
        case CCHashAlgorithmSHA1:
            return CC_SHA1_DIGEST_LENGTH;
        case CCHashAlgorithmSHA224:
            return CC_SHA224_DIGEST_LENGTH;
        case CCHashAlgorithmSHA256:
            return CC_SHA256_DIGEST_LENGTH;
        case CCHashAlgorithmSHA384:
            return CC_SHA384_DIGEST_LENGTH;
        case CCHashAlgorithmSHA512:
            return CC_SHA512_DIGEST_LENGTH;
        default:
            [NSException raise:NSInvalidArgumentException format:@"Invalid CCHashAlgorithm %ld", algorithm];
            // Not reached.
    }
}

NSData *CCHashPerform(CCHashAlgorithm algorithm, NSData *input) {
    NSInteger length = CCHashLengthOfDigest(algorithm);
    unsigned char buffer[length];
    
    switch (algorithm) {
        case CCHashAlgorithmMD5:
            CC_MD5(input.bytes, (CC_LONG) input.length, buffer);
            break;
        case CCHashAlgorithmSHA1:
            CC_SHA1(input.bytes, (CC_LONG) input.length, buffer);
            break;
        case CCHashAlgorithmSHA224:
            CC_SHA224(input.bytes, (CC_LONG) input.length, buffer);
            break;
        case CCHashAlgorithmSHA256:
            CC_SHA256(input.bytes, (CC_LONG) input.length, buffer);
            break;
        case CCHashAlgorithmSHA384:
            CC_SHA384(input.bytes, (CC_LONG) input.length, buffer);
            break;
        case CCHashAlgorithmSHA512:
            CC_SHA512(input.bytes, (CC_LONG) input.length, buffer);
            break;
        default:
            [NSException raise:NSInvalidArgumentException format:@"Invalid CCHashAlgorithm %ld", algorithm];
    }
    
    return [NSData dataWithBytes:buffer length:length];
}

NSData *CCHashPerformHMAC(CCHashAlgorithm algorithm, NSData *input, NSData *key) {
    NSInteger length = CCHashLengthOfDigest(algorithm);
    unsigned char buffer[length];
    
    switch (algorithm) {
        case CCHashAlgorithmMD5:
            CCHmac(kCCHmacAlgMD5, key.bytes, key.length, input.bytes, input.length, buffer);
            break;
        case CCHashAlgorithmSHA1:
            CCHmac(kCCHmacAlgSHA1, key.bytes, key.length, input.bytes, input.length, buffer);
            break;
        case CCHashAlgorithmSHA224:
            CCHmac(kCCHmacAlgSHA224, key.bytes, key.length, input.bytes, input.length, buffer);
            break;
        case CCHashAlgorithmSHA256:
            CCHmac(kCCHmacAlgSHA256, key.bytes, key.length, input.bytes, input.length, buffer);
            break;
        case CCHashAlgorithmSHA384:
            CCHmac(kCCHmacAlgSHA384, key.bytes, key.length, input.bytes, input.length, buffer);
            break;
        case CCHashAlgorithmSHA512:
            CCHmac(kCCHmacAlgSHA512, key.bytes, key.length, input.bytes, input.length, buffer);
            break;
        default:
            [NSException raise:NSInvalidArgumentException format:@"Invalid CCHashAlgorithm %ld", algorithm];
    }
    
    return [NSData dataWithBytes:buffer length:length];
}
