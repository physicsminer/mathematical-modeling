clc;clear
load changgui.txt %��ԭʼ���ݱ����ڴ��ı��ļ���
changgui(:,7)=[]; %ɾ�����ݾ���ĵ�7�У���ʹ�ñ���1,2,3,4,5,6
changgui=zscore(changgui); %���ݱ�׼��
y=pdist(changgui); %�������ŷ�Ͼ��룬ÿ����һ������
z=linkage(y,'average'); %������ȷ�����
dendrogram(z); %������ͼ
for k=3:5
    fprintf('���ֳ�%d��Ľ�����£�\n',k)
    T=cluster(z,'maxclust',k); %�������㻮�ֳ�k��
    for i=1:k;
        tm=find(T==i); %���i��Ķ���
        tm=reshape(tm,1,length(tm)); %���������
        fprintf('��%d�����%s\n',i,int2str(tm)); %��ʾ������
    end
    if k==5
        break
    end
    fprintf('*****************************\n');
end