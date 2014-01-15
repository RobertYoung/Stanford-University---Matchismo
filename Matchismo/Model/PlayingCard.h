//
//  PlayingCard.h
//  Matchismo
//
//  Created by Robert Young on 09/01/2014.
//  Copyright (c) 2014 Robert Young. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray*)validSuits;
+(NSUInteger)maxRank;

@end
