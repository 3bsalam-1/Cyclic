function varargout = cyclic(varargin)
% CYCLIC MATLAB code for cyclic.fig
%      CYCLIC, by itself, creates a new CYCLIC or raises the existing
%      singleton*.
%
%      H = CYCLIC returns the handle to a new CYCLIC or the handle to
%      the existing singleton*.
%
%      CYCLIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CYCLIC.M with the given input arguments.
%
%      CYCLIC('Property','Value',...) creates a new CYCLIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cyclic_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cyclic_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cyclic

% Last Modified by GUIDE v2.5 19-May-2022 13:25:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cyclic_OpeningFcn, ...
                   'gui_OutputFcn',  @cyclic_OutputFcn, ...
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


% --- Executes just before cyclic is made visible.
function cyclic_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cyclic (see VARARGIN)

% Choose default command line output for cyclic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cyclic wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cyclic_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m as text
%        str2double(get(hObject,'String')) returns contents of m as a double


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g_Callback(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g as text
%        str2double(get(hObject,'String')) returns contents of g as a double


% --- Executes during object creation, after setting all properties.
function g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r as text
%        str2double(get(hObject,'String')) returns contents of r as a double


% --- Executes during object creation, after setting all properties.
function r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

m=str2num(get(handles.m,'string'))
g=str2num(get(handles.g,'string'))
gx=poly2sym(g)
ux=poly2sym(m)
v=fliplr(mod(sym2poly(gx*ux),2))
set(handles.r,'string',num2str(v))
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

m=str2num(get(handles.m,'string'))
g=str2num(get(handles.g,'string'))
if mod(m,2)==m
    k=length(m)
    
    gx=poly2sym(g)
    ux=poly2sym(m)
    
    polyPowers = find(g) - 1
    paritybits=max(polyPowers)
    n=k+paritybits
    
    syms x
    power=x^paritybits
    delta_ux=expand(ux*power)
    delta_uxb=sym2poly(delta_ux)
  
    [Result,b]=deconv(delta_uxb,g)
    rx=poly2sym(mod(Result,2))
    bx=poly2sym(mod(b,2))
    v=fliplr(sym2poly(bx+delta_ux))
     
    if length(v)< n
        v(n)=0; 
    end
   

end

set(handles.r,'string',num2str(v))
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

m=str2num(get(handles.m,'string'))
g=str2num(get(handles.g,'string'))
if mod(m,2)==m
    k=length(m)
    gx=poly2sym(g)
    polyPowers = find(g) - 1;
    paritybits=max(polyPowers);
    n=k+paritybits;
    
    v=zeros([1,paritybits])
    v=[v m] 
    
    syms x
    zx=x^n+1
    

    
    zxb=sym2poly(zx)
    [h,r]=deconv(zxb,g)
    h=mod(h,2)
    hx=poly2sym(h)
    hcoeff=fliplr(h)
    

    mm=hcoeff(1:paritybits+1)
    x=length(v)
    y=length(m)
    for j=0:paritybits-1
        v(paritybits-j)=sum(mm.*v(x:-1:y));
        v(paritybits-j)=mod(v(paritybits-j),2)
        x=x-1;
        y=y-1;
    end 
end
set(handles.r,'string',num2str(v))
