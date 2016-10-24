//
//  RCTTweetManager.m
//  FabricTwitterKit
//
//  Created by Adam Ivancza on 24/10/16.
//  Copyright © 2016 Trevor Porter. All rights reserved.
//

#import "RCTTweetManager.h"
#import <TwitterKit/TwitterKit.h>


@implementation RCTTweetManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    TWTRTweetView *tweetView = [[TWTRTweetView alloc] init];
    return tweetView;
}

RCT_CUSTOM_VIEW_PROPERTY(tweetId, NSString, TWTRTweetView)
{
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    [client loadTweetWithID:json completion:^(TWTRTweet *tweet, NSError *error) {
        if (tweet) {
            [view configureWithTweet:tweet];
        } else {
            NSLog(@"Failed to load tweet: %@", [error localizedDescription]);
        }
    }];
}

@end
