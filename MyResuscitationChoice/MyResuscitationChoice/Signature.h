//
//  Signature.h
//  MyResuscitationChoice
//
//  Created by Ahmed Alanazi on 12/2/15.
//  Copyright © 2015 Gannon University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Signature : UIViewController {
    CGPoint lastPoint;
    CGPoint moveBackTo;
    CGPoint currentPoint;
    CGPoint location;
    NSData * lastClick;
    BOOL mouseSwiped;
    UIImageView *drawImage;
    UIImageView *frontImage;
    
}

@end
