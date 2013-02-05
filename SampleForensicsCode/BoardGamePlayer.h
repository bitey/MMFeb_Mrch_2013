//
//  BoardGamePlayer.h
//  SueVSWorld
//
//  Created by Don Bora on 1/16/12.
//  Copyright (c) 2012 Eight Bit Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCard.h"

@class ManagedObjectFactory;

@interface BoardGamePlayer : NSObject
{
    
    NSMutableArray*         mDeckCards;
    NSMutableArray*         mHandCards;
    NSMutableArray*         mDeck;
 
    ManagedObjectFactory*   mManagedObjectFactory;
    GameCard*               mPlayCard;
    Game*                   mGame;
    
    BOOL                    mPlayedFirstCard;

    int                     mPlayer;
}

@property(nonatomic, readonly)int player;
@property(nonatomic, retain)NSMutableArray* deckCards;
@property(nonatomic, retain)NSMutableArray* handCards;
@property(nonatomic, retain)NSMutableArray* deck;
@property(nonatomic, retain)GameCard* playCard;
@property(nonatomic, retain)Game* game;
@property(nonatomic, assign)BOOL playedFirstCard;

-(id)init:(int)player game:(Game*)game;

-(void)playCard:(GameCard*)gameCard;
-(void)discard:(GameCard*)gameCard;
-(void)moveCardToOnDeck:(GameCard*)gameCard forHandPosition:(int)handPosition;
-(void)swapPlayCardWithOnDeckCard:(GameCard*)gameCard;
-(void)reset:(Game*)game;

-(BOOL)hasBoosterCard;
-(BOOL)hasBackupCard;
-(BOOL)hasPlayCard;

-(NSArray*)cards;
-(NSArray*)drawCards;
@end


@interface BoardGamePlayer (Private)
-(void)__loadCardsIntoDeckWithPredicateString:(NSString*)predicateString andNumberOfCards:(int)numberOfCards;
-(void)swapPlayCardWithOnDeckCard:(GameCard*)gameCard;
-(void)__pullCharacterCardsToTopOfDeck;
-(void)__restoreCards;
-(BOOL)__loadCardsIntoDeck;
@end