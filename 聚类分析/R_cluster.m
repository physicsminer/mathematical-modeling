%R型聚类
X=load('changgui.txt');%导入数据
r=corrcoef(X)%计算相关系数矩阵
d=1-r;%进行数据变换，把相关系数转化为距离
d=tril(d);%取出矩阵d的下三角元素
d=nonzeros(d);%取出非零元素
d=d';%化为行向量
z=linkage(d,'average');%按类平均法聚类
dendrogram(z);%画聚类图
num=input('请输入划分成几类')
T=cluster(z,'maxclust',num)%把变量划分成6类
for i=1:num
    tm=find(T==i);%求第i类的对象
    tm=reshape(tm,1,length(tm));%变成行向量
    fprintf('第%d类的有%s\n',i,int2str(tm));%先是分类结果
end