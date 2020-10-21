global co
if isfield(handles,'vdx')
    vid = handles.vdx;
    stoppreview(vid)
    delete(vid)
    handles = rmfield(handles,'vdx');
    guidata(hObject,handles)
    cla(handles.axes1)
    reset(handles.axes1)
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
    cla(handles.axes2)
    reset(handles.axes2)
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
end
fd = vision.CascadeObjectDetector();
info = imaqhwinfo('winvideo');
did = info.DeviceIDs;
if isempty(did)
    msgbox({'YOUR SYSTEM DO NOT HAVE A WEBCAM';' ';'CONNECT A ONE'},'WARNING....!!!!','warn','modal')
    return
end
did = cell2mat(did);
for k = 1:length(did)
    devinfo = imaqhwinfo('winvideo',k);
    na(1,k) = {devinfo.DeviceName};
    sr(1,k) = {devinfo.SupportedFormats};
end
[a,b] = listdlg('promptstring','SELECT A WEB CAM DEVICE','liststring',na,'ListSize', [125, 75],'SelectionMode','single');
if b == 0
    return
end
if b ~= 0
    frmt = sr{1,a};
    [a1,b1] = listdlg('promptstring','SELECT RESOLUTION','liststring',frmt,'ListSize', [150, 100],'SelectionMode','single');
    if b1 == 0
        return
    end
end
frmt = frmt{a1};
l = find(frmt == '_');
res = frmt(l+1 : end);
l = find(res == 'x');
res1 = str2double(res(1: l-1));
res2 = str2double(res(l+1 : end));
axes(handles.axes1)
vid = videoinput('winvideo', a);
vr  =  [res1    res2];
nbands  =  get(vid,'NumberofBands');
h2im  = image(zeros([vr(2)  vr(1)  nbands] , 'uint8'));
preview(vid,h2im);
handles.vdx = vid;
guidata(hObject,handles)
tx = msgbox('PLZ STAND IN FRONT OF CAMERA STILL','INFO......!!!');
pause(1)
delete(tx)
kx  =  0;
while 1
    im = getframe(handles.axes1);
    im =  im.cdata;
    bbox = step(fd, im);
    vo = insertObjectAnnotation(im,'rectangle',bbox,'FACE');
    axes(handles.axes2)
    imshow(vo)
    if size(bbox,1) > 1
        msgbox({'TOO MANY FACES IN FRAME';' ';'ONLY ONE FACE IS ACCEPTED'},'WARNING.....!!!','warn','modal')
        uiwait
        stoppreview(vid)
        delete(vid)
        handles = rmfield(handles,'vdx');
        guidata(hObject,handles)
        cla(handles.axes1)
        reset(handles.axes1)
        set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
        cla(handles.axes2)
        reset(handles.axes2)
        set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
        return
    end
    kx = kx + 1;
    if kx > 10 && ~isempty(bbox)
        break
    end
end
imc = imcrop(im,[bbox(1)+3    bbox(2)-35    bbox(3)-10      bbox(4)+70]);
imx  =   imresize(imc,[300  300]);
fhx = figure(2);
set(fhx,'menubar','none','numbertitle','off','name','PREVIEW')
imshow(imx)
cd ('database');
l = length(dir(pwd));
n = [int2str(l-1)    '.jpg'];
imwrite(imx,n);
cd ..
    while 1
        qq = inputdlg('WHAT IS UR NAME?','FILL');
        if isempty(qq)
            msgbox({'YOU HAVE TO ENTER A NAME';' ';'YOU CANT CLICK CANCEL'},'INFO','HELP','MODAL')
            uiwait
        else
            break
        end
    end
    qq = qq{1};
    if exist('info.mat','file') == 2
        load ('info.mat')
        r = size(z2,1);
        z2{r+1,1} = {n , qq};
        save('info.mat','z2')
    else
        z2{1,1} = {n,qq};
        save('info.mat','z2')
    end
close gcf
stoppreview(vid)
delete(vid)
handles = rmfield(handles,'vdx');
guidata(hObject,handles)
cla(handles.axes1)
reset(handles.axes1)
set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)
cla(handles.axes2)
reset(handles.axes2)
set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',co,'linewidth',1.5)


