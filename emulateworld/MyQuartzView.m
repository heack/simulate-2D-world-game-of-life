//
//  MyQuartzView.m
//  emulateworld
//
//  Created by kong yang on 11/25/11.
//  Copyright (c) 2011 Crosslife. All rights reserved.
//

#import "MyQuartzView.h"

@implementation MyQuartzView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)drawWorld: (BOOL [1000][800]) worldArray
{
    //return;
    NSGraphicsContext *currentContext = [NSGraphicsContext currentContext];
    //NSRect blackArray[1000*800];
    //NSRect whiteArray[1000*800];
//    long blackCount = 0;
//    long whiteCount = 0;
    
    [[NSColor whiteColor] set];
    for (int w=0; w<1000; w++) {
        for (int h=0; h<800; h++) {
             NSRect white = NSMakeRect(w, h, 1, 1);
            NSRectFill(white);
        }
    }
    
    [[NSColor blackColor] set];
    for (int w=0; w<1000; w++) {
        for (int h=0; h<800; h++) {
            if (worldArray[w][h]) {
                
                NSRect black = NSMakeRect(w, h, 1, 1);
                NSRectFill(black);
                //blackArray[blackCount] = NSMakeRect(w-0.5, h-0.5, 1, 1);
                //blackCount++;                
            }
        }
    }
    
//    NSRectFillList(blackArray, blackCount);
//    [[NSColor whiteColor] set];
//    NSRectFillList(whiteArray, whiteCount);
    [currentContext flushGraphics];
    //[currentContext restoreGraphicsState];
    
//    NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithFocusedViewRect:NSMakeRect(0, 0, 100, 200)]; 
//    [NSGraphicsContext saveGraphicsState];
//    [bitmap setColor:[NSColor redColor] atX:10 y:10];
//    [bitmap setColor:[NSColor redColor] atX:10 y:11];
//    [bitmap setColor:[NSColor redColor] atX:10 y:12];
//    [NSGraphicsContext setCurrentContext:[NSGraphicsContext graphicsContextWithBitmapImageRep:bitmap]];
//    [NSGraphicsContext restoreGraphicsState];
}
- (void)drawRect:(NSRect)dirtyRect
{
    
}

@end
