function varargout = verification(varargin)
% VERIFICATION MATLAB code for verification.fig
%      VERIFICATION, by itself, creates a new VERIFICATION or raises the existing
%      singleton*.
%
%      H = VERIFICATION returns the handle to a new VERIFICATION or the handle to
%      the existing singleton*.
%
%      VERIFICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VERIFICATION.M with the given input arguments.
%
%      VERIFICATION('Property','Value',...) creates a new VERIFICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before verification_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to verification_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help verification

% Last Modified by GUIDE v2.5 19-Feb-2020 21:10:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @verification_OpeningFcn, ...
                   'gui_OutputFcn',  @verification_OutputFcn, ...
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


% --- Executes just before verification is made visible.
function verification_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to verification (see VARARGIN)

% Choose default command line output for verification
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
ha = axes('unit','normalized','position',[0 0 1 1]);
ah =imread('vote 6.png');
imagesc(ah);
set(ha,'handlevisibility','off','visible','off');
uistack(ha,'top');
% UIWAIT makes verification wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = verification_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str
set(handles.edit1,'string','');

if exist('features.mat','file') == 0
    msgbox('FIRST TRAIN YOUR DATABASE','INFO...!!!','MODAL')
    return
end
ff = dir('database');
if length(ff) == 2
    h = waitbar(0,'Plz wait Matlab is scanning ur database...','name','SCANNING IS IN PROGRESS');
    for k = 1:100
        waitbar(k/100)
        pause(0.03)
    end
    close(h)
    msgbox({'NO IMAGE FOUND IN DATABASE';'FIRST LOAD YOUR DATABASE';'USE ''ADD NEW IMAGE'' MENU'},'WARNING....!!!','WARN','MODAL')
    return
end

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
info = imaqhwinfo('winvideo');
did = info.DeviceIDs;
if isempty(did)
    msgbox({'YOUR SYSTEM DO NOT HAVE A WEBCAM';' ';'CONNECT A ONE'},'WARNING....!!!!','warn','modal')
    return
end
fd = vision.CascadeObjectDetector();
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
        set(handles.axes1,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
        cla(handles.axes2)
        reset(handles.axes2)
        set(handles.axes2,'box','on','xtick',[],'ytick',[],'xcolor',[1 1 1],'ycolor',[1 1  1],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
        return
    end
    kx = kx + 1;
    if kx > 10 && ~isempty(bbox)
        break
    end
end
imc = imcrop(im,[bbox(1)+3    bbox(2)-35    bbox(3)-10      bbox(4)+70]);
imx  =   imresize(imc,[300  300]);
axes(handles.axes1)
image(imx)
text(20,20,'\bfUr Current image.','fontsize',12,'color','y','fontname','comic sans ms')
set(handles.axes1,'xtick',[],'ytick',[],'box','on')
 immxx = imx;
 zz = findsimilar(immxx);
 zz = strtrim(zz);
fxz = imread(['database/'  zz]);
q1= ehd(immxx,0.1);
q2 = ehd(fxz,0.1);
q3 = pdist([q1 ; q2]);
disp(q3)
if q3 < 0.5
    axes(handles.axes2)
    image(fxz)
    set(handles.axes1,'xtick',[],'ytick',[],'box','on')
    text(20,20,'\bfUr Database Entered Image.','fontsize',12,'color','y','fontname','comic sans ms')
    set(handles.axes2,'xtick',[],'ytick',[],'box','on')
    xs = load('info.mat');
    xs1 = xs.z3;
    for k = 1:length(xs1)
        st = xs1{k};
        stx = st{1};
        if strcmp(stx,zz) == 1
            str = st{2};
            break
        end
    end
    disp(str)
    set(handles.text3,'string',['Hello ' str ])
    set(handles.edit1,'string','verified');

    try
        s = serial('com1');
        fopen(s);
        fwrite(s,'A');
        pause(1)
        fclose(s);
        clear s
    catch
        msgbox({'PLZ CONNECT CABLE OR';'INVALID COM PORT SELECTED'},'WARNING','WARN','MODAL')
        uiwait 
        delete(s)
        clear s
    end
else
    msgbox('YOU ARE NOT A VALID PERSON', 'WARNING','WARN','MODAL')
    cla(handles.axes1)
    reset(handles.axes1)
    cla(handles.axes2)
    reset(handles.axes2)
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5);
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
end

        
        
        
        
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global out
set(handles.edit2,'string','');
i=1;
while i>=1
    s = serial('COM7');
    fopen(s);
    out = fscanf(s);
    f=fprintf('%s \n',out);
    fclose(s);
    delete(s)
    i=i+1;
    if ~isempty(f)
        break;
    end
end
% prompt = 'enter input = ';
% out = input(prompt,'s');
if strcmp(out,'1') || strcmp(out,'1') || strcmp(out,'1') || strcmp(out,'1') || strcmp(out,'1')
    b='verified';
    set(handles.edit2,'string',b);
else
    b='not-verified';
    set(handles.edit2,'string',b);

end

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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global out str
if strcmp(out,'1') && strcmp(str,'mugunth')
    msgbox('wait for few sec');
    run Nomini.m
    elseif strcmp(out,'2') && strcmp(str,'berlin')
           msgbox('wait for few sec');
           run Nomini.m
    
    elseif strcmp(out,'3') && strcmp(str,'mugunth')
           msgbox('wait for few sec');
           run Nomini.m

    elseif strcmp(out,'4') && strcmp(str,'mugunth')
           msgbox('wait for few sec');
           run Nomini.m
    elseif strcmp(out,'5') && strcmp(str,'mugunth')
           msgbox('wait for few sec');
           run Nomini.m
else

    msgbox('unauthorized');
end
