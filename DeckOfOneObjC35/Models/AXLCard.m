//
//  AXLCard.m
//  DeckOfOneObjC35
//
//  Created by Alex Lundquist on 8/11/20.
//

#import "AXLCard.h"

@implementation AXLCard

// String values to avoid magic strings
static NSString * const valueKey = @"value";
static NSString * const suitKey = @"suit";
static NSString * const imageKey = @"image";

- (instancetype)initWithValue:(NSString *)value suit:(NSString *)suit imageURL:(NSString *)imageURL
{
    self = [super init];
    if (self){
        _value = value;
        _suit = suit;
        _imageURL = imageURL;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithValue:@"" suit:@"" imageURL:@""];
}

@end

@implementation AXLCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)cardDictionary
{
    NSString * value = cardDictionary[valueKey];
    NSString * suit = cardDictionary[suitKey];
    NSString * imageURLString = cardDictionary[imageKey];
    return [self initWithValue:value suit:suit imageURL:imageURLString];
}

@end
