i=1;
while i>=1
    s = serial('COM4');
    fopen(s)
    out = fscanf(s)
    f=fprintf('%s',out);
    fclose(s)
    delete(s)
    i=i+1;
    if ~isempty(f)
        break;
    end
end
if out~='0'&& nam=='a'
    msgbox('Authorized');
    javaaddpath([matlabroot,'/java/jarext/mysql-connector-java-8.0.19.jar'])
    conn=database('berlindb','berlinuname','berlinpass','com.mysql.jdbc.Driver','jdbc:mysql://db4free.net:3306/berlindb');
    query=exec(conn,'select * from identity');
    query=fetch(query);
    query.Data;
    display(query.Data);
else
    msgbox('Unauthorized');
end