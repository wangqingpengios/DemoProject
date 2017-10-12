//
//  DemoVCModel.h
//  MyDemo
//
//  Created by home on 2017/9/6.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

/*
 {
 "entrances":{
 "ret":0,
 "list":[
 {
 "id":1,
 "entranceType":"live",
 "coverPath":"http://fdfs.xmcdn.com/group15/M0A/6E/58/wKgDaFXxN2qRMtjIAAAGQuZzM2Q045.png",
 "title":"热门直播"
 }
 ]
 },
 "ret":0,
 "discoveryColumns":Object{...},
 "editorRecommendAlbums":Object{...},
 "hotRecommends":Object{...},
 "focusImages":Object{...},
 "msg":"成功",
 "specialColumn":Object{...}
 }
 
 */

//@"http://mobile.ximalaya.com/mobile/discovery/v1/recommends?channel=and-d3&device=android&includeActivity=true&includeSpecial=true&scale=2&version=4.3.26.2"

#import "BaseModel.h"

@class Entrances,EntrancesList,Editor,EditorRecomm_List,DiscoveryC,DiscoveryC_List,HotRe,HotRe_List,HotRe_ArrayList;

@interface DemoVCModel : BaseModel

@property (nonatomic, strong) Entrances *entrances;

@property (nonatomic, copy) NSString *ret;

@property (nonatomic, strong) DiscoveryC *discoveryColumns;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) Editor *editorRecommendAlbums;

@property (nonatomic, strong) HotRe *hotRecommends;

@end



@interface Entrances : BaseModel

@property (nonatomic, strong) NSArray<EntrancesList*> *list;

@property (nonatomic, assign) NSInteger ret;

@end

@interface EntrancesList : BaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *entenceType;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *title;

@end

@interface DiscoveryC : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray <DiscoveryC_List*>*list;

@property (nonatomic, assign) NSInteger locationInHotRecommend;

@end

@interface DiscoveryC_List : BaseModel

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, assign) BOOL enableShare;

@property (nonatomic, assign) NSInteger orderNum;

@property (nonatomic, assign) NSInteger contentUpdatedAt;

@property (nonatomic, copy) NSString *sharePic;

@property (nonatomic, copy) NSString *url;

@end

@interface Editor : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, strong) NSArray<EditorRecomm_List *> *list;


@end

@interface EditorRecomm_List : BaseModel

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger playsCounts;

@end

@interface HotRe : BaseModel

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<HotRe_List*> *list;


@end

@interface HotRe_List : BaseModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, assign) BOOL isFinished;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, assign) NSInteger categoryType;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, strong) NSArray<HotRe_ArrayList*> *list;

@end

@interface HotRe_ArrayList : BaseModel

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger playsCounts;
@end
