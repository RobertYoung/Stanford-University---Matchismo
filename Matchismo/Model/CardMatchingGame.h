//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Robert Young on 11/01/2014.
//  Copyright (c) 2014 Robert Young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) Card *chosenCard;
@property (nonatomic, readonly) Card * matchedCard;

@end
