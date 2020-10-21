% javaaddpath([matlabroot,'/java/jarext/mysql-connector-java-8.0.19.jar'])
% conn=database('berlindb','berlinuname','berlinpass','com.mysql.jdbc.Driver','jdbc:mysql://db4free.net:3306/berlindb');
% query=exec(conn,"select * from Register where username='123' and password='12345'");
% query=fetch(query);
% query.Data;
% display(query.Data);
user='beni';
pass='12345';
% javaaddpath([matlabroot,'/java/jarext/mysql-connector-java-8.0.19.jar'])
% conn=database('berlindb','berlinuname','berlinpass','com.mysql.jdbc.Driver','jdbc:mysql://db4free.net:3306/berlindb');
% query=exec(conn,"select * from Register where username='" + user + "' and password='" + pass + "'");
% % query=fetch(query);
% query.Data;
% display(query.Data);
javaaddpath([matlabroot,'/java/jarext/mysql-connector-java-8.0.19.jar'])
conn=database('berlindb','berlinuname','berlinpass','com.mysql.jdbc.Driver','jdbc:mysql://db4free.net:3306/berlindb');
query=exec(conn,'select * from Register');
query=fetch(query);
query.Data;
display(query.Data);
for i=1:
if strcmp

