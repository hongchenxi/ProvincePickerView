//
//  ViewController.m
//  29 - picker省份生日
//
//  Created by 董 尚先 on 14-5-20.
//  Copyright (c) 2014年 shangxianDante. All rights reserved.
//

#import "ViewController.h"
#import "SXCitys.h"
#import "NSObject+array.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textBirth;
@property (weak, nonatomic) IBOutlet UITextField *textCity;
@property(nonatomic,strong) UIDatePicker *dp;
@property(nonatomic,strong) UIPickerView *pick;

@property(nonatomic,strong) NSArray *privince;
/**
 *  存放选中的下标 用于二级联动
 */
@property (nonatomic,assign) NSInteger didIndex;


@end

@implementation ViewController

- (NSArray *)privince
{
    if (_privince == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
        NSArray *temCity = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tem = [NSMutableArray array];
        for (NSDictionary *dict in temCity) {
            SXCitys *city = [SXCitys modelWithDict:dict];
            [tem addObject:city];
        }
        _privince = tem;
    }
    return _privince;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textBirth.delegate = self;
    self.textCity.delegate = self;
    
    UIDatePicker *dp = [[UIDatePicker alloc]init];
    dp.datePickerMode = UIDatePickerModeDate;
    // 设置范围
//    @property (nonatomic, retain) NSDate *maximumDate; 
    dp.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    [dp addTarget:self action:@selector(DateChanged:) forControlEvents:UIControlEventValueChanged];
    self.dp = dp;
    self.textBirth.inputView = dp;
    
    UIPickerView *pick = [[UIPickerView alloc]init];
    self.pick = pick;
    pick.delegate = self;
    pick.dataSource = self;
    self.textCity.inputView = pick;
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
    NSArray *temCity = [NSArray arrayWithContentsOfFile:path];
    _privince = [SXCitys objectArrWithDictArr:temCity];
    
    int q = (int)self.privince.count;
    NSLog(@"%d",q);
}

#pragma mark - /************************* 获取日期 ***************************/
- (void)DateChanged:(UIDatePicker *)datepicker
{
    NSDateFormatter *f = [[NSDateFormatter alloc]init];
    f.dateFormat = @"yyyy年MM月dd日啊";
    self.textBirth.text = [f stringFromDate:self.dp.date];
}
#pragma mark - /************************* 生日点击就加载下 ***************************/
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 5) {
        [self DateChanged:self.dp];
    }else{
    [self pickerView:self.pick didSelectRow:_didIndex inComponent:0];
    }
}



#pragma mark - /************************* pick数据源方法 ***************************/
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return  self.privince.count;
    }else{
        int index = (int)[self.pick selectedRowInComponent:0];
        SXCitys *p = self.privince[index];  // $$$$$
        return p.cities.count;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.privince[row] name];
    }else{
//        int index = (int)[self.pick selectedRowInComponent:0];
        SXCitys *p = self.privince[_didIndex];
        return p.cities[row];
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _didIndex = row;
        [_pick reloadComponent:1];
    }
//    NSInteger x = [_pick selectedRowInComponent:0];
    SXCitys *p = self.privince[_didIndex]; // $$$$$
    
    NSInteger cityx = [_pick selectedRowInComponent:1];
    NSString *s  = p.cities[cityx];
    
    self.textCity.text = [NSString stringWithFormat:@"%@ %@",p.name,s];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
