//
//  MyQuartzView.h
//  emulateworld
//
//  Created by kong yang on 11/25/11.
//  Copyright (c) 2011 Crosslife. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyQuartzView : NSView {
    int i;
}


- (void)drawWorld: (BOOL [1000][800]) worldArray;
@end
