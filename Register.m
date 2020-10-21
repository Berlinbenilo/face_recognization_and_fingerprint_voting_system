function varargout = Register(varargin)
% REGISTER MATLAB code for Register.fig
%      REGISTER, by itself, creates a new REGISTER or raises the existing
%      singleton*.
%
%      H = REGISTER returns the handle to a new REGISTER or the handle to
%      the existing singleton*.
%
%      REGISTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGISTER.M with the given input arguments.
%
%      REGISTER('Property','Value',...) creates a new REGISTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Register_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Register_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Register

% Last Modified by GUIDE v2.5 19-Feb-2020 18:09:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Register_OpeningFcn, ...
                   'gui_OutputFcn',  @Register_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Register is made visible.
function Register_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Register (see VARARGIN)

% Choose default command line output for Register
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
ha = axes('unit','normalized','position',[0 0 1 1]);
ah =imread('vote 6.png');
imagesc(ah);
set(ha,'handlevisibility','off','visible','off');
uistack(ha,'top');
% UIWAIT makes Register wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Register_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=1;
while i>=1
    s = serial('COM7');
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
% out=input('enter finger');
if out=='1'
    b='Registered';
    set(handles.edit5,'string',b);
    elseif out=='2'
    b='Registered';
    set(handles.edit5,'string',b);
    elseif out=='3'
    b='Registered';
    set(handles.edit5,'string',b);
    elseif out=='4'
    b='Registered';
    set(handles.edit5,'string',b);
    elseif out=='5'
    b='Registered';
    set(handles.edit5,'string',b);
else
    b='Not registered';
    set(handles.edit5,'string',b);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
        set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1 1],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
        cla(handles.axes2)
        reset(handles.axes2)
        set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1 1],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
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
        r = size(z3,1);
        z3{r+1,1} = {n,qq};
        save('info.mat','z3')
    else
        z3{1,1} = {n,qq};
        save('info.mat','z3')
    end
close gcf
stoppreview(vid)
delete(vid)
handles = rmfield(handles,'vdx');
guidata(hObject,handles)
cla(handles.axes1)
reset(handles.axes1)
set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1 1],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
cla(handles.axes2)
reset(handles.axes2)
set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1 1],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)

msgbox('process completed');
set(handles.edit6,'string','Registered');

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Name Addar 
Name=get(handles.edit1,'String');
Addar=get(handles.edit2,'String');
ID=get(handles.edit5,'String');

    
%  javaaddpath([matlabroot,'/java/jarext/mysql-connector-java-8.0.19.jar'])
%  conn=database('berlindb','berlinuname','berlinpass','com.mysql.jdbc.Driver','jdbc:mysql://db4free.net:3306/berlindb');
%  query=exec(conn,"insert into Register(name,addar,username,password) values ('" +  Name + "','" + Addar + "','" + use + "','" + pword + "')");
%  disp(query);

run user.m



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n = 1;

 while true
        qq = inputdlg('WHAT IS UR password?','FILL');
        if isempty(qq)
            msgbox('YOU HAVE TO ENTER A PASSWORD')
            uiwait
        else
            break
        end
 end
    qq = qq{1};
    if exist('pass.mat','file') == 2
        load ('pass.mat')
        r = size(z2,1);
        z2{r+1,1} = {qq};
        save('pass.mat','z2')
    else
        z2{1,1} = {qq};
        save('pass.mat','z2')
    end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 u = 1;

 while true
        q = inputdlg('WHAT IS UR username?','FILL');
        if isempty(q)
            msgbox('YOU HAVE TO ENTER A username')
            uiwait
        else
            break
        end
 end
    q = q{1};
    if exist('user.mat','file') == 2
        load ('user.mat')
        r = size(z1,1);
        z1{r+1,1} = {q};
        save('user.mat','z1')
    else
        z1{1,1} = {q};
        save('user.mat','z1')
    end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ff = dir('database');
if length(ff) == 2
    h = waitbar(0,'Plz wait Matlab is scanning ur database...','name','SCANNING IS IN PROGRESS');
    for k = 1:100
        waitbar(k/100)
        pause(0.03)
    end
    close(h)
    msgbox({'NO IMAGE FOUND IN DATABASE';'FIRST LOAD YOUR DATABASE';...
        'USE ''ADD NEW IMAGE'' MENU'},'WARNING....!!!','WARN','MODAL')
    return
end
if exist('features.mat','file') == 2
    bx = questdlg({'TRAINING HAS ALREDY BEEN DONE';' ';...
        'WANT TO TRAIN DATABASE AGAIN?'},'SELECT','YES','NO','CC');
    if strcmpi(bx,'yes') == 1
        builddatabase
        msgbox('TRAINING DONE....PRESS OK TO CONTINUE','OK','modal')
        return
    else
        return
    end
else
    builddatabase
    msgbox('TRAINING DONE....PRESS OK TO CONTINUE','OK','modal')
    return
end
