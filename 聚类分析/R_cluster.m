%R�;���
X=load('changgui.txt');%��������
r=corrcoef(X)%�������ϵ������
d=1-r;%�������ݱ任�������ϵ��ת��Ϊ����
d=tril(d);%ȡ������d��������Ԫ��
d=nonzeros(d);%ȡ������Ԫ��
d=d';%��Ϊ������
z=linkage(d,'average');%����ƽ��������
dendrogram(z);%������ͼ
num=input('�����뻮�ֳɼ���')
T=cluster(z,'maxclust',num)%�ѱ������ֳ�6��
for i=1:num
    tm=find(T==i);%���i��Ķ���
    tm=reshape(tm,1,length(tm));%���������
    fprintf('��%d�����%s\n',i,int2str(tm));%���Ƿ�����
end