//
//  MembersFilmViewController.m
//  commendTest
//
//  Created by Alan on 2017/12/26.
//  Copyright © 2017年 景彦铭. All rights reserved.
//

#import "MembersFilmViewController.h"
#import "Additions.h"
#import <Masonry.h>
#import "UIScrollView+EmptyDataSet.h"
#import "EmptyView.h"
#import "BAAlert_OC.h"
#import "WCLRecordVideoVC.h"
#import "VideoPurchaseViewController.h"
#import <AVFoundation/AVFoundation.h>
#define SafeAreaTopHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 88 : 64)

#define SafeAreaBottomHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 34 : 0)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface MembersFilmViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate,WCLRecordVideoVCDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) BAActionSheet  *actionSheet;
@end

@implementation MembersFilmViewController

#pragma mark - View life circle ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Custom Methods
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.hidden = NO;
}

#pragma mark - DZNEmptyDataSetSource & Delegates
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    
    EmptyView * v = [[EmptyView alloc] init];
    [scrollView addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(scrollView);
    }];
    v.backgroundColor = [UIColor whiteColor];
    [v addTarget:self action:@selector(clickAddBtn) forControlEvents:UIControlEventValueChanged];
    return v;
}
//点击添加视频事件
- (void)clickAddBtn {
    NSMutableArray *dataArray = [NSMutableArray array];
    NSArray *contentArray = @[@"拍摄", @"从手机相册选择视频"];
    for (NSInteger i = 0; i < contentArray.count; i++)
    {
        BAActionSheetModel *model = [BAActionSheetModel new];
        model.content = contentArray[i];
        [dataArray addObject:model];
    }
    BAKit_WeakSelf
    [BAActionSheet ba_actionSheetShowWithConfiguration:^(BAActionSheet *tempView) {
        
        BAKit_StrongSelf
        tempView.dataArray = dataArray;
        tempView.actionSheetType = BAActionSheetTypeCustom;
        tempView.isTouchEdgeHide = YES;
        tempView.showAnimate = YES;
        tempView.animatingStyle = 3;
        self.actionSheet = tempView;
    } actionBlock:^(NSIndexPath *indexPath, BAActionSheetModel *model) {
        switch (indexPath.row) {
            case 0:
                NSLog(@"拍摄");
            {
                UIStoryboard* story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                WCLRecordVideoVC* ctrl = [story instantiateViewControllerWithIdentifier:@"WCLRecord"];
                ctrl.delegate = self;
                [self.navigationController presentViewController:ctrl animated:NO completion:nil];

                break;
            }
            case 1:
                NSLog(@"从相册中选择视频");
            {
                UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
                imagePicker.editing = YES;
                imagePicker.delegate = self;
                imagePicker.allowsEditing = YES;
                //选择相册时，设置UIImagePickerController对象相关属性
                //设置只能选取视频
                imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];;
                //跳转到UIImagePickerController控制器弹出相册
                [self presentViewController:imagePicker animated:YES completion:nil];
            }
                break;

        }
    }];
}
#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{
        NSURL *url = info[UIImagePickerControllerMediaURL];
        if (url) {
            
            VideoPurchaseViewController *vc = [VideoPurchaseViewController new];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [self centerFrameImageWithVideoURL:url completion:^(UIImage *image) {
                vc.iamge = image;
            }];
            [self.navigationController presentViewController:nav animated:NO completion:nil];
        }
    }];

}
//通过URL获取视频的第一帧图片
//异步获取中间帧，可传多个时间节点参数，计算出实际的取帧时间并返回对应的图片。
//是否取到图片，通过判断AVAssetImageGeneratorSucceeded是否成功：：
- (void)centerFrameImageWithVideoURL:(NSURL *)videoURL completion:(void(^)(UIImage *image))completion {
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    imageGenerator.appliesPreferredTrackTransform = YES;
    imageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGFloat duration = CMTimeGetSeconds([asset duration]);
    CMTime midPoint = CMTimeMake(duration/2.0, 600);
    
    NSValue *midtime = [NSValue valueWithCMTime:midPoint];
    [imageGenerator generateCGImagesAsynchronouslyForTimes:@[midtime] completionHandler:^(CMTime requestedTime, CGImageRef  _Nullable image, CMTime actualTime, AVAssetImageGeneratorResult result, NSError * _Nullable error) {
        if (result == AVAssetImageGeneratorSucceeded && image != nil) {
            UIImage *centerFrameImage = [[UIImage alloc] initWithCGImage:image];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(centerFrameImage);
                }
            });
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(nil);
                }
            });
        }
    }];
    
}
//获取视频的长度
- (CGFloat) getVideoLength:(NSURL *)URL {
    AVURLAsset *avUrl = [AVURLAsset assetWithURL:URL];
    CMTime time = [avUrl duration];
    int second = ceil(time.value/time.timescale);
    return second;
}

//从视频控制器回调的fileUrl
-(void)selectFile:(UIImage*)image fileUrl:(NSString*)fileUrl fileName:(NSString*)fileName {
    if (fileUrl && image) {
        VideoPurchaseViewController *vc = [VideoPurchaseViewController new];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.iamge = image;
        [self.navigationController presentViewController:nav animated:YES completion:nil];    }
}
#pragma mark - Sources & Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd-%zd",indexPath.section,indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0f;
}

#pragma mark - getter & setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView initWithFrame:CGRectZero style:UITableViewStyleGrouped cellSeparatorStyle:UITableViewCellSeparatorStyleSingleLine separatorInset:UIEdgeInsetsMake(0, 0, 0, 0) dataSource:self delegate:self];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        _tableView.estimatedRowHeight = 400;
        _tableView.estimatedSectionFooterHeight = 10;
        _tableView.estimatedSectionHeaderHeight = 0;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
    }
    return _tableView;
}

@end
