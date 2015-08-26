//
//  CollectionViewController.m
//  GallaryTest
//
//  Created by yibinpan on 8/25/15.
//  Copyright (c) 2015 yibinpan. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewController ()
{
    UIButton *mLoadMore;
    NSInteger mCellNumber;
    
    BOOL mIsLoadingMoreData;
}

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseIdentifierLoading = @"LoadingCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mLoadMore = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    [mLoadMore setTitle:@"Load more" forState:UIControlStateNormal];
    
    [mLoadMore addTarget:self action:@selector(clickLoadMore:) forControlEvents:UIControlEventTouchUpInside];

    
    mCellNumber = 50;
    
    mIsLoadingMoreData = NO;
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickLoadMore:(id)sender
{
    NSLog(@"click load more");
    mCellNumber += 20;
    
    [self.collectionView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (section == 0) {
        return mCellNumber;
    }
    else if(section == 1)
    {
        return 1;
    }
    else
    {
        return 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell;
    
    // Configure the cell
    if (indexPath.section == 0) {
        
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    }
    else if (indexPath.section == 1)
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierLoading forIndexPath:indexPath];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.text = @"";

        [cell.contentView addSubview:mLoadMore];
        
        return cell;
    }
    else
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
        
        return cell;
    }
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size;
    if (indexPath.section == 1) {
        
        size = CGSizeMake(200, 100);
    }
    else
    {
        size = CGSizeMake(100, 100);
    }
    
    return size;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
    {
        if (!mIsLoadingMoreData)
        {
            mIsLoadingMoreData = YES;
            
            // proceed with the loading of more data
            mCellNumber += 20;
            
            [self.collectionView reloadData];
            
            mIsLoadingMoreData = NO;
        }
    }
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
