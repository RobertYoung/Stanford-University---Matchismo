//
//  PlayingCard.m
//  Matchismo
//
//  Created by Robert Young on 09/01/2014.
//  Copyright (c) 2014 Robert Young. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit; // because we provide getter and setter

-(int)match:(NSArray *)otherCards{
    int score = 0;
    
    if ([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank){
            score = 4;
        }else if ([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    return score;
}

-(NSString*)contents{
    NSArray * rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits{
    return @[@"♥️", @"♦️", @"♠️", @"♣️"];
}

-(void)setSuit:(NSString*)suit{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(NSString*)suit{
    return _suit ? _suit : @"?";
}

+ (NSArray*)rankStrings{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank { return [[self rankStrings] count]-1; }

-(void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank])
        _rank = rank;
}
@end
