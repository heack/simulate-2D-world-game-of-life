//
//  WorldController.m
//  emulateworld
//
//  Created by kong yang on 11/25/11.
//  Copyright (c) 2011 Crosslife. All rights reserved.
//

#import "WorldController.h"

@implementation WorldController
@synthesize myWorldShowing;
@synthesize timer;

- (IBAction)Redraw:(id)sender {
    [self.timer invalidate];
    [self initArray];
    [self.myWorldShowing drawWorld:array];
}

- (IBAction)animate:(id)sender {
    [self setTimer:[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(passOneTime) userInfo:nil repeats:YES]];
}

- (IBAction)stopAnimation:(id)sender {
    [self.timer invalidate];
}

-(void) passOneTime
{
    [self applyRules];
    //[self.myWorldShowing drawWorld:array];
}
-(void) applyRules
{
    NSGraphicsContext *currentContext = [NSGraphicsContext currentContext];
    BOOL newArray[WIDTH][HEIGHT];
    long blackCount = 0;
    for (int w=0; w<WIDTH; w++) {
        for (int h=0; h<HEIGHT; h++) {
            //count nearby numbers
            int count = 0;
            int left = w - 1;
            int right = w+1;
            int top = h+1;
            int bot = h-1;
            if (left<0) {
                left = WIDTH-1;
            }
            if (right >= WIDTH) {
                right = 0;
            }
            if (top>=HEIGHT) {
                top = 0;
            }
            if (bot<0) {
                bot = HEIGHT-1;
            }
            if (array[left][top]) {
                count++;
            }
            if (array[w][top]) {
                count++;
            }
            if (array[right][top]){
                count++;
            }
            if(array[left][h]){
                count++;
            }
            if (array[right][h]) {
                count++;
            }
            if (array[left][bot]) {
                count++;
            }
            if (array[w][bot]) {
                count++;
            }
            if(array[right][bot]) {
                count++;
            }
            newArray[w][h] = array[w][h];
//            int r = rand();
//            if (r%3000==0) {
//                newArray[w][h] = YES;
//            }
            if (newArray[w][h]) {
                if ( count<=1 || count>=4) {
                    newArray[w][h] = NO;
                    [[NSColor whiteColor] set];
                    NSRect white = NSMakeRect(w, h, 1, 1);
                    NSRectFill(white);
                } else {
                    blackCount++;
                }
            } else {
                if (count ==3) {
                    newArray[w][h] = YES;
                    [[NSColor blackColor] set];
                    NSRect black = NSMakeRect(w, h, 1, 1);
                    NSRectFill(black);
                    blackCount ++;
                }
            }
            
            
        }
    }
    [currentContext flushGraphics];
    for (int w=0; w<WIDTH; w++) {
        for (int h=0; h<HEIGHT; h++) {
            array[w][h] = newArray[w][h];
        }
    }
    NSLog(@"total blacknum:%ld",blackCount);
}

- (void) initArray
{
    srand(time(NULL));
    for (int w=0; w<WIDTH; w++) {
        for (int j=0; j<HEIGHT; j++) {
            array[w][j] = NO;
            int r = rand();
            if (r%20 == 0) {
                array[w][j] = YES;
            }
        }
    }
}
-(void)dealloc
{
    [super dealloc];
    [timer release];
}
@end
