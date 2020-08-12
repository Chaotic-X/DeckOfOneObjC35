//
//  AXLCardController.m
//  DeckOfOneObjC35
//
//  Created by Alex Lundquist on 8/11/20.
//

#import "AXLCardController.h"
#import "AXLCard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/?count=1";

@implementation AXLCardController

+ (instancetype)SharedInstance;
{
    static AXLCardController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [AXLCardController new];
    });
    return sharedInstance;
}

- (void)fetchNewCard:(void (^)(NSArray<AXLCard * > *))completion
{
    NSURL * finalURL = [NSURL URLWithString:baseURLString];
    [[[NSURLSession sharedSession]dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching a Card from the Deck %@", error);
            completion(nil); return;
        }
        
        if (!data) {
            NSLog(@"Error fetching card DATA from API %@", error);
            completion(nil); return;
        }
        
        NSDictionary * JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!JSONDictionary || ![JSONDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Error fetching and Decoding the JSON Dictoinary");
            completion(nil); return;
        }
        
        NSArray * cardDictionaryArray = JSONDictionary[@"cards"];
        NSMutableArray * cardsPlaceHolder = [NSMutableArray new];
        
        for (NSDictionary * cardDictionary in cardDictionaryArray) {
            AXLCard * newCard = [[AXLCard alloc] initWithDictionary:cardDictionary];
            [cardsPlaceHolder addObject:newCard];
        }
        completion(cardsPlaceHolder);
        
}]resume];
}
- (void)fetchCardImage:(AXLCard *)card completion:(void (^)(UIImage * Nullable))completion
{
    NSURL * imageURL = [NSURL URLWithString:card.imageURL];
    [[[NSURLSession sharedSession]dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetcing image for Card: %@", error);
            completion(nil);
            return;
        }
        if (!data) {
            NSLog(@"Error fetching card Data from Deck: %@", error);
            completion(nil);
            return;
        }
        UIImage * cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }]resume];
} //End of FetchImage
@end
