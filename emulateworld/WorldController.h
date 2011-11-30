//
//  WorldController.h
//  emulateworld
//
//  Created by kong yang on 11/25/11.
//  Copyright (c) 2011 Crosslife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyQuartzView.h"
#define WIDTH 1000
#define HEIGHT 800

@interface WorldController : NSObject {
    BOOL array[WIDTH][HEIGHT];
    NSTimer *timer;
}

@property (retain, nonatomic) NSTimer *timer;
@property (assign) IBOutlet MyQuartzView *myWorldShowing;


- (void) initArray;
- (IBAction)Redraw:(id)sender;
- (IBAction)animate:(id)sender;
- (IBAction)stopAnimation:(id)sender;
-(void) applyRules;

@end
