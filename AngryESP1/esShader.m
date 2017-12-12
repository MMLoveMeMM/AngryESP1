//
//  esShader.m
//  AngryESP1
//
//  Created by liuzhibao on 12/11/17.
//  Copyright © 2017 AngryPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "esShader.h"

@implementation esShader

+(GLuint)loadShader:(GLenum)type withString:(NSString *)shaderString
{
    GLuint shader=glCreateShader(type);
    if(shader==0)
    {
        NSLog(@"error:failed to create shader.");
        return 0;
    }
    
    const char* shaderStringUTF8 =[shaderString UTF8String];
    glShaderSource(shader, 1, &shaderStringUTF8, NULL);
    
    glCompileShader(shader);
    
    GLint compiled=0;
    glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
    
    if(!compiled)
    {
        GLint infolen=0;
        
        glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &infolen);
        if(infolen>1)
        {
            char* infoLog=malloc(sizeof(char)* infolen);
            glGetShaderInfoLog(shader, infolen, NULL, infoLog);
            NSLog(@"Error compiling shader : \n%s\n",infoLog);
            
            free(infoLog);
        }
        
        glDeleteShader(shader);
        
        return 0;
        
    }
    
    return shader;
    
}

+(GLuint)loadShaderPath:(GLenum)type withFilepath:(NSString*)shaderFilepath
{

    NSError* error;
    NSString* shaderString = [NSString stringWithContentsOfFile:shaderFilepath encoding:NSUTF8StringEncoding error:nil];
    
    if(!shaderString)
    {
        NSLog(@"Error : loading shader file : %@ %@",shaderFilepath,error.localizedDescription);
        return 0;
    }
    
    return [self loadShader:type withString:shaderString];
    
}

+(GLuint)loadProgram:(NSString*)vertexShaderFilepath withFragmentShaderFilepath:(NSString *)fragmentShaderFilepath
{

    GLuint vertexShader=[self loadShaderPath:GL_VERTEX_SHADER withFilepath:vertexShaderFilepath];
    
    if(vertexShader==0)
    {
        NSLog(@"Error load shader error : \n");
        return 0;
    }
    
    GLuint fragmentShader=[self loadShaderPath:GL_FRAGMENT_SHADER withFilepath:fragmentShaderFilepath];
    
    if(fragmentShader==0)
    {
        glDeleteShader(vertexShader);
        NSLog(@"Error load shader error : \n");
        return 0;
    }
    
    GLuint programHandle=glCreateProgram();
    if(programHandle==0)
    {
        NSLog(@"Error create shader error : \n");
        return 0;
    }
    
    glAttachShader(programHandle, vertexShader);
    glAttachShader(programHandle, fragmentShader);
    
    glLinkProgram(programHandle);
    
    GLint linked;
    glGetProgramiv(programHandle, GL_LINK_STATUS, &linked);
    if(!linked)
    {
        GLint infoLen=0;
        glGetProgramiv(programHandle, GL_INFO_LOG_LENGTH, &infoLen);
        
        if(infoLen>1)
        {
            char* infoLog=malloc(sizeof(char)* infoLen);
            glGetShaderInfoLog(programHandle, infoLen, NULL, infoLog);
            
            NSLog(@"Error linking program : \n%s\n",infoLog);
            
            free(infoLog);
        }
        
        glDeleteProgram(programHandle);
        return 0;
        
    }
    
    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);
    
    return programHandle;
    
    
}

+(void)compileShader:(GLuint*)shader type:(GLenum)type file:(NSString*)file
{

}

@end
