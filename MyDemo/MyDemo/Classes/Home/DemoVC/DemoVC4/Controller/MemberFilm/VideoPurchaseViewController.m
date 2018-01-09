//
//  VideoPurchaseViewController.m
//  commendTest
//
//  Created by Alan on 2017/12/26.
//  Copyright © 2017年 . All rights reserved.
//

#import "VideoPurchaseViewController.h"
#import "MembersFilmViewController.h"
@interface VideoPurchaseViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, assign) NSInteger numberRange;
@end

@implementation VideoPurchaseViewController

#pragma mark - View life circle ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.view endEditing:YES];
//
//    for (UIViewController *controller in self.navigationController.viewControllers) {
//        if ([controller isKindOfClass:[MembersFilmViewController class]]) {
//            MembersFilmViewController *revise =(MembersFilmViewController *)controller;
//            [self.navigationController popToViewController:revise animated:YES];
//        }
//    }
//
//    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Custom Methods
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    //NavTtemleft 取消
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(clickCancel)];
    [cancelItem setTintColor: [UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = cancelItem;
    
    //NavTtemRight 发表
    UIBarButtonItem *posted = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(post)];
    [posted setTintColor: UIColorFromRGB(0x56d176)];
    self.navigationItem.rightBarButtonItem = posted;
    
    UIView *backgroundView = [UIView new];
    [self.view addSubview:backgroundView];
    backgroundView.backgroundColor = [UIColor whiteColor];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SafeAreaTopHeight);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(211);
    }];
    
    self.textView = [[UITextView alloc] init];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backgroundView).offset(15);
        make.top.equalTo(backgroundView);
        make.right.equalTo(backgroundView).offset(-15);
        make.height.mas_equalTo(90);
    }];
    self.textView.delegate = self;
    self.textView.text =@"发表您此刻的心情，最多100个字";
    self.textView.font = [UIFont systemFontOfSize:14];
    self.textView.textColor = UIColorFromRGB(0x999999);
    
    
    [backgroundView  addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backgroundView).offset(15);
        make.bottom.equalTo(backgroundView).offset(-15);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    
    self.numberLabel = [UILabel qp_labelWithText:@"100" color:UIColorFromRGB(0x999999) fontSize:14];
    [self.view addSubview:self.numberLabel];
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroundView.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];
    
    UILabel *descLabel = [UILabel qp_labelWithText:@"*视频仅限于风景、古建筑、活动；" color:UIColorFromRGB(0xff6c00) fontSize:14];
    [self.view addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroundView.mas_bottom).offset(8);
        make.left.equalTo(self.view).offset(15);
    }];
    
}
- (void)clickCancel {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)post {
    
}

#pragma mark - Sources & Delegates
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"发表您此刻的心情，最多100个字"]) {
        textView.text = @"";
        textView.textColor = UIColorFromRGB(0x333333);

    }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"发表您此刻的心情，最多100个字";
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (text.length == 0) {
        return YES;
    }
    NSString * lang = textView.textInputMode.primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange * range = [textView markedTextRange];
        UITextPosition * position = [textView positionFromPosition:range.start offset:0];
        if (!position) {
            //中文输入完成 在这里判断长度是否大于100
            if (textView.text.length > 99) {
                return NO;
            }
            else {
                return YES;
            }
        }
        else {
            //拼音
            return YES;
        }
    }
    else {
        //英文或者特殊符号等输入
        if (textView.text.length > 99) {
            return NO;
        }
        else {
            return YES;
        }
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    NSString * lang = textView.textInputMode.primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange * range = [textView markedTextRange];
        UITextPosition * position = [textView positionFromPosition:range.start offset:0];
        if (!position) {
            //中文输入完成 在这里判断长度是否大于100
            if (textView.text.length > 100) {
                textView.text = [textView.text substringToIndex:100];
            }
        }
    }
    else {
        //英文或者特殊符号等输入
        if (textView.text.length > 100) {
            textView.text = [textView.text substringToIndex:100];
        }
    }
    
    self.numberLabel.text = [NSString stringWithFormat:@"%zd",textView.text.length];
}
#pragma mark - getter & setter

- (void)setIamge:(UIImage *)iamge {
    _iamge = iamge;
    if (_imageV) {
        _imageV.image = iamge;

    }
}
- (UIImageView *)imageV {
    if (!_imageV) {
        _imageV = [[UIImageView alloc] init];
        _imageV.backgroundColor = [UIColor whiteColor];
        _imageV.image = _iamge;
    }
    return _imageV;
}
@end
