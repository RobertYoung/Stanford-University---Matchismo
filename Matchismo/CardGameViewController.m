//
//  ViewController.m
//  Matchismo
//
//  Created by Robert Young on 09/01/2014.
//  Copyright (c) 2014 Robert Young. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
- (IBAction)onOffSwitch:(id)sender;
@end

@implementation ViewController

-(CardMatchingGame *)game{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(void)updateUI{
    for (UIButton *cardButton in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
    
    NSString * info = [[NSString alloc] init];
    
    if (self.game.matchedCard == nil){
        info = [NSString stringWithFormat:@"Chosen: %@", self.game.chosenCard.contents];
    }else{
        info = [NSString stringWithFormat:@"Matched: %@ %@", self.game.chosenCard.contents, self.game.matchedCard.contents];
    }
    
    self.infoLabel.text = info;
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage*)backgroundImageForCard:(Card*)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (IBAction)resetGameButton:(id)sender {
    _game = nil;
    [self updateUI];
}

- (IBAction)onOffSwitch:(id)sender {
    if (self.onOffSwitch.on){
        self.scoreLabel.text = @"ON";
    }else{
        self.scoreLabel.text = @"OFF";
    }
}
@end
