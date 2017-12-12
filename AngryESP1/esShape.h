//
//  esShape.h
//  AngryESP1
//
//  Created by liuzhibao on 12/11/17.
//  Copyright © 2017 AngryPanda. All rights reserved.
//

#ifndef esShape_h
#define esShape_h
#import <OpenGLES/ES2/gl.h>
#import <Foundation/Foundation.h>
#include "esView01.h"

@interface esShape : NSObject

@property (nonatomic , strong) EAGLContext* myContext;
@property (nonatomic , strong) CAEAGLLayer* myEagLayer;
@property (nonatomic , assign) GLuint       myProgram;

@property (nonatomic , assign) GLuint myColorRenderBuffer;
@property (nonatomic , assign) GLuint myColorFrameBuffer;

@property (nonatomic,assign) GLuint mPositionHanle;
@property (nonatomic,assign) GLuint mCoordTextureHandle;

-(void)initEsView:(EAGLContext*)context withlayer:(CAEAGLLayer*) myEagLayer;
-(void)initVertices;
-(void)initShader;
-(void)initTexture:(NSString*)imagename;
-(void)setupBuffer;
-(void)destoryRenderAndFrameBuffer;
-(void)setupRenderBuffer;
-(void)setupFrameBuffer;
-(void)draw;

@end
#endif /* esShape_h */
