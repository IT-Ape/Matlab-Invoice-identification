function [Code_LABEL,Code_DATE,Code_MONEY] = DigitRec_main (Image)
%DigitRec_main����       ʵ�ֶ�һ��ͼƬ�ı�š����ںͽ���ʶ��ƥ��
%������� Image           �����jpgͼ��RGB����
%������� Code_LABEL,     ��Ʊ���    ������
%        Code_DATE,       ��Ʊ����   �ַ���
%        Code_MONEY       ��Ʊ���   �ַ���

%%  RGBͼԤ����
%%%%Image_GY = gyrate(Image);%%%��бͼ��
%%%figure,imshow(Image_GY);
%%%%title('��б�����ͼ��'); 
%%%%save Image_GY;


%%%%Image_GB=getbill(Image);  %��ͼƬ��ȡ����Ʊ���֣���λͼ��
%%%%figure;
%%%%imshow(Image_GB);
%%%title('���к�Ʊ'); 

%Image_gray = rgb2gray(Image_GB);  

%%   �ҵ����ںͱ������λ�ò�����

load Image_GB
Image_GB_S=imresize(Image_GB,[489 182],'nearest');
%Image_GB_S=Image_GB;
figure;
[Image_code_LABEL,Image_code_DATE,Image_code_MONEY] = get_code(Image_GB_S);

     %�Ҷ�ת��  %ͼ���ֵ��
[Image_code_LABEL_,Image_code_DATE_,Image_code_MONEY_] = rgb_to_gray (Image_code_LABEL,Image_code_DATE,Image_code_MONEY);      


%% Image_code_LABEL_ �и�������ַ�  �ַ���һ����СΪ 20*10 ����ƥ�䡢ʶ��  
Image_code_LABEL_=~Image_code_LABEL_;
MAX_NUM_LABEL=8;
Code_LABEL=region_pix_LABEL(MAX_NUM_LABEL,Image_code_LABEL_);
figure,imshow(Image_code_LABEL),title (['��Ʊ���:', Code_LABEL],'Color','b');
Code_LABEL=str2num(Code_LABEL);

%% Image_code_DATE_ �и�������ַ�  �ַ���һ����СΪ 20*10 ����ƥ�䡢ʶ��  
Image_code_DATE_=~Image_code_DATE_;
MAX_NUM_DATE=10;
Code_DATE=region_pix_DATE(MAX_NUM_DATE,Image_code_DATE_);
figure,imshow(Image_code_DATE),title (['��Ʊ����:', Code_DATE],'Color','b');


%% Image_code_MONEY_ �и�������ַ�  �ַ���һ����СΪ 20*10 ����ƥ�䡢ʶ��  ��߽��֧�֣�9999.99
Image_code_MONEY_=~Image_code_MONEY_;
MAX_NUM_MONEY=8;
Code_MONEY=region_pix_MONEY(MAX_NUM_MONEY,Image_code_MONEY_);
figure,imshow(Image_code_MONEY),title (['��Ʊ���:', Code_MONEY],'Color','b');














