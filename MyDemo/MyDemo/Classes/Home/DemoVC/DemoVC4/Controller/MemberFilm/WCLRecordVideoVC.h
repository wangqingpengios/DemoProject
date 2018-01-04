//
//  WCLRecordVideoVC.h
//  Youqun
//
//  Created by 王崇磊 on 16/5/16.
//  Copyright © 2016年 W_C__L. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WCLRecordVideoVCDelegate <NSObject>
-(void)selectFile:(UIImage*)image fileUrl:(NSString*)fileUrl fileName:(NSString*)fileName;
@end
@interface WCLRecordVideoVC :UIViewController
@property(nonatomic,weak)id<WCLRecordVideoVCDelegate> delegate;
@end
