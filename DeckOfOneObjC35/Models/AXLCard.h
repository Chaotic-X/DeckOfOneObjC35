//
//  AXLCard.h
//  DeckOfOneObjC35
//
//  Created by Alex Lundquist on 8/11/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AXLCard : NSObject

//MARK: -Properties
@property (nonatomic, copy, readonly)NSString * value;
@property (nonatomic, copy, readonly)NSString * suit;
@property (nonatomic, copy, readonly)NSString * imageURL;

//MARK: -Initializers
- (instancetype) initWithValue:(NSString *)value
                          suit:(NSString *)suit
                      imageURL:(NSString *)imageURL
NS_DESIGNATED_INITIALIZER;

@end

@interface AXLCard (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)cardDictionary;

@end

NS_ASSUME_NONNULL_END
