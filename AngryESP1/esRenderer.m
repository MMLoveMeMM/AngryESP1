//
//  esRenderer.m
//  AngryESP1
//
//  Created by liuzhibao on 12/11/17.
//  Copyright © 2017 AngryPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/ES2/gl.h>
#include "esRenderer.h"
#include "esShape.h"
#include "esView01.h"

@interface esRenderer()
@end

@implementation esRenderer

-(void)initEsView:(EAGLContext*)context withlayer:(CAEAGLLayer*) layer
{
    self.mContext=context;
    self.myEagLayer=layer;
    self.mShape=[[esShape alloc] init];
    [self.mShape initEsView:self.mContext withlayer:self.myEagLayer];
    
}

-(void)esRendererCreate
{
    /*
     * initial buffer be setup before using GL
     */
    [self.mShape setupBuffer];
    
}

-(void)esRendererChange:(GLuint)x withy:(GLuint) y withscale:(CGFloat) scale withwidth:(GLuint) width withheight:(GLuint) height
{
    glClearColor(0, 1.0, 0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    //CGFloat scale = [[UIScreen mainScreen] scale]; //获取视图放大倍数，可以把scale设置为1试试
    glViewport(x * scale, y * scale, width * scale, height * scale); //设置视口大小

}

-(void)esRendererFrame
{
    /*
     * not start to draw
     */
    [self.mShape draw];
}

@end
