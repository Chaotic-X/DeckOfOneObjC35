//
//  AXLCardController.h
//  DeckOfOneObjC35
//
//  Created by Alex Lundquist on 8/11/20.
//

#import <UIKit/UIKit.h>
#import "AXLCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface AXLCardController : NSObject

+ (instancetype)SharedInstance;

- (void)fetchNewCard:(void(^) (NSArray<AXLCard * > * cards))completion;
- (void)fetchCardImage:(AXLCard * )card
            completion:(void(^) (UIImage * image))completion;


@end

NS_ASSUME_NONNULL_END
