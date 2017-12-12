//
//  esRenderer.h
//  AngryESP1
//
//  Created by liuzhibao on 12/11/17.
//  Copyright © 2017 AngryPanda. All rights reserved.
//

#ifndef esRenderer_h
#define esRenderer_h
#import <OpenGLES/ES2/gl.h>
#include "esShape.h"
#include "esView01.h"

@interface esRenderer : NSObject

@property(nonatomic,strong) esShape* mShape;
@property(nonatomic,strong) EAGLContext* mContext;
@property (nonatomic , strong) CAEAGLLayer* myEagLayer;

-(void)initEsView:(EAGLContext*)context withlayer:(CAEAGLLayer*) myEagLayer;
-(void)esRendererCreate;
-(void)esRendererChange:(GLuint)x withy:(GLuint) y withscale:(CGFloat) scale withwidth:(GLuint) width withheight:(GLuint) height;
-(void)esRendererFrame;

@end

#endif /* esRenderer_h */
