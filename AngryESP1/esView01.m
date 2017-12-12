//
//  esView01.m
//  AngryESP1
//
//  Created by liuzhibao on 12/11/17.
//  Copyright © 2017 AngryPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "esView01.h"
#import "esRenderer.h"

@interface esView01()

@property (nonatomic , strong) esRenderer* mRenderer;
@property (nonatomic , strong) CAEAGLLayer* myEagLayer;

@end

@implementation esView01

+ (Class)layerClass {
    return [CAEAGLLayer class];
}

-(void)layoutSubviews
{
    [self setupLayer];
    
    [self setupContext];
    
    [self viewCreate];
    
    [self viewChange];
    
    [self viewFrame];
}
- (void)setupLayer
{
    self.myEagLayer = (CAEAGLLayer*) self.layer;
    //设置放大倍数
    [self setContentScaleFactor:[[UIScreen mainScreen] scale]];
    
    // CALayer 默认是透明的，必须将它设为不透明才能让其可见
    self.myEagLayer.opaque = YES;
    
    // 设置描绘属性，在这里设置不维持渲染内容以及颜色格式为 RGBA8
    self.myEagLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [NSNumber numberWithBool:NO], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
}

-(void)setupContext
{
    // 指定 OpenGL 渲染 API 的版本，在这里我们使用 OpenGL ES 2.0
    EAGLRenderingAPI api = kEAGLRenderingAPIOpenGLES2;
    EAGLContext* context = [[EAGLContext alloc] initWithAPI:api];
    if (!context) {
        NSLog(@"Failed to initialize OpenGLES 2.0 context");
        exit(1);
    }
    
    // 设置为当前上下文
    if (![EAGLContext setCurrentContext:context]) {
        NSLog(@"Failed to set current OpenGL context");
        exit(1);
    }
    self.myContexts = context;
}

-(void)viewCreate
{
    self.mRenderer=[[esRenderer alloc] init];
    [self.mRenderer initEsView:self.myContexts withlayer:self.myEagLayer];
    
    /*[self destoryRenderAndFrameBuffer];
    [self setupRenderBuffer];
    [self setupFrameBuffer];*/
    
    [self.mRenderer esRendererCreate];
}

-(void)viewChange
{
    CGFloat scale = [[UIScreen mainScreen] scale]; //获取视图放大倍数，可以把scale设置为1试试
    [self.mRenderer esRendererChange:self.frame.origin.x withy:self.frame.origin.y withscale:scale withwidth:self.frame.size.width withheight:self.frame.size.height];
    
}

-(void)viewFrame
{
    [self.mRenderer esRendererFrame];
}

@end
