//
//  esShader.h
//  AngryESP1
//
//  Created by liuzhibao on 12/11/17.
//  Copyright © 2017 AngryPanda. All rights reserved.
//

#ifndef esShader_h
#define esShader_h

#import <Foundation/Foundation.h>
#include<OpenGLES/ES2/gl.h>

@interface esShader : NSObject

+(GLuint)loadShader:(GLenum)type withString:(NSString *)shaderString;
+(GLuint)loadShaderPath:(GLenum)type withFilepath:(NSString*)shaderFilepath;

+(GLuint)loadProgram:(NSString*)vertexShaderFilepath withFragmentShaderFilepath:(NSString *)fragmentShaderFilepath;

@end


#endif /* esShader_h */
