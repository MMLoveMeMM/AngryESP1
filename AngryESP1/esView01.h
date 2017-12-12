//
//  esView01.h
//  AngryESP1
//
//  Created by liuzhibao on 12/11/17.
//  Copyright © 2017 AngryPanda. All rights reserved.
//

#ifndef esView01_h
#define esView01_h
#include <UIKit/UIKit.h>
#import "esRenderer.h"

@interface esView01 : UIView

@property (nonatomic , strong) EAGLContext* myContexts;
@property (nonatomic , assign) GLuint myColorRenderBuffer;
@property (nonatomic , assign) GLuint myColorFrameBuffer;

- (void)setupLayer;
-(void)setupContext;
-(void)viewCreate;
-(void)viewChange;
-(void)viewFrame;

@end

#endif /* esView01_h */
