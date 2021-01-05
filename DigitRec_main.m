function [Code_LABEL,Code_DATE,Code_MONEY] = DigitRec_main (Image)
%DigitRec_main函数       实现对一幅图片的编号、日期和金额的识别匹配
%输入变量 Image           读入的jpg图像RGB矩阵
%输出变量 Code_LABEL,     发票编号    数字型
%        Code_DATE,       发票日期   字符型
%        Code_MONEY       发票金额   字符型

%%  RGB图预处理
%%%%Image_GY = gyrate(Image);%%%倾斜图像
%%%figure,imshow(Image_GY);
%%%%title('倾斜处理后图像'); 
%%%%save Image_GY;


%%%%Image_GB=getbill(Image);  %从图片中取出发票部分，定位图像；
%%%%figure;
%%%%imshow(Image_GB);
%%%title('剪切后发票'); 

%Image_gray = rgb2gray(Image_GB);  

%%   找到日期和编号所在位置并剪切

load Image_GB
Image_GB_S=imresize(Image_GB,[489 182],'nearest');
%Image_GB_S=Image_GB;
figure;
[Image_code_LABEL,Image_code_DATE,Image_code_MONEY] = get_code(Image_GB_S);

     %灰度转化  %图像二值化
[Image_code_LABEL_,Image_code_DATE_,Image_code_MONEY_] = rgb_to_gray (Image_code_LABEL,Image_code_DATE,Image_code_MONEY);      


%% Image_code_LABEL_ 切割成数字字符  字符归一化大小为 20*10 数字匹配、识别  
Image_code_LABEL_=~Image_code_LABEL_;
MAX_NUM_LABEL=8;
Code_LABEL=region_pix_LABEL(MAX_NUM_LABEL,Image_code_LABEL_);
figure,imshow(Image_code_LABEL),title (['发票编号:', Code_LABEL],'Color','b');
Code_LABEL=str2num(Code_LABEL);

%% Image_code_DATE_ 切割成数字字符  字符归一化大小为 20*10 数字匹配、识别  
Image_code_DATE_=~Image_code_DATE_;
MAX_NUM_DATE=10;
Code_DATE=region_pix_DATE(MAX_NUM_DATE,Image_code_DATE_);
figure,imshow(Image_code_DATE),title (['发票日期:', Code_DATE],'Color','b');


%% Image_code_MONEY_ 切割成数字字符  字符归一化大小为 20*10 数字匹配、识别  最高金额支持￥9999.99
Image_code_MONEY_=~Image_code_MONEY_;
MAX_NUM_MONEY=8;
Code_MONEY=region_pix_MONEY(MAX_NUM_MONEY,Image_code_MONEY_);
figure,imshow(Image_code_MONEY),title (['发票金额:', Code_MONEY],'Color','b');














