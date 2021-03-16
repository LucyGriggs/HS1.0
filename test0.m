function varargout = test0(varargin)
% TEST0 MATLAB code for test0.fig
%      TEST0, by itself, creates a new TEST0 or raises the existing
%      singleton*.
%
%      H = TEST0 returns the handle to a new TEST0 or the handle to
%      the existing singleton*.
%
%      TEST0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST0.M with the given input arguments.
%
%      TEST0('Property','Value',...) creates a new TEST0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test0

% Last Modified by GUIDE v2.5 03-Feb-2018 15:42:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test0_OpeningFcn, ...
                   'gui_OutputFcn',  @test0_OutputFcn, ...
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


% --- Executes just before test0 is made visible.
function test0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test0 (see VARARGIN)

% Choose default command line output for test0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test0_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadImageButton.
function loadImageButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadImageButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile( ...
    {'*.jpg', 'All jpg-Files (*.jpg)'; '*.bmp','All bmp-Files (*.bmp)' ; '*.png' , 'All png-Files (*.png)' ; '*.*' , 'All Files'}, 'Select Address Book');
% If "Cancel" is selected then return
if isequal([filename,pathname],[0,0])
    return
% Otherwise construct the fullfilename and Check and load the file
else
    File = fullfile(pathname,filename);
    I = imread(File) ;
    if(size(I,3) ~= 1)
        handles.metricdata.I = rgb2gray(I) ;
    else
        handles.metricdata.I = I ;
    end    
    axes(handles.axes1);
    cla;
    imshow(I)    
%     % if the MAT-file is not valid, do not save the name
%     if Check_And_Load(File,handles)
%         handles.LastFIle = File;
%         guidata(hObject, handles)
%     end
end
guidata(handles.figure1, handles);

% --- Executes on button press in pointsButton.
function pointsButton_Callback(hObject, eventdata, handles)
% hObject    handle to pointsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = handles.metricdata.I;
axes(handles.imagePlace);
cla;
imshow(I);
[handles.metricdata.yp, handles.metricdata.xp] = getpts;
guidata(hObject, handles);


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function contWeightText_Callback(hObject, eventdata, handles)
% hObject    handle to contWeightText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of contWeightText as text
%        str2double(get(hObject,'String')) returns contents of contWeightText as a double


% --- Executes during object creation, after setting all properties.
function contWeightText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to contWeightText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function curvWeightText_Callback(hObject, eventdata, handles)
% hObject    handle to curvWeightText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of curvWeightText as text
%        str2double(get(hObject,'String')) returns contents of curvWeightText as a double


% --- Executes during object creation, after setting all properties.
function curvWeightText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to curvWeightText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gradWeightText_Callback(hObject, eventdata, handles)
% hObject    handle to gradWeightText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gradWeightText as text
%        str2double(get(hObject,'String')) returns contents of gradWeightText as a double


% --- Executes during object creation, after setting all properties.
function gradWeightText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gradWeightText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function energySizeText_Callback(hObject, eventdata, handles)
% hObject    handle to energySizeText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of energySizeText as text
%        str2double(get(hObject,'String')) returns contents of energySizeText as a double


% --- Executes during object creation, after setting all properties.
function energySizeText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to energySizeText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function curvThreshText_Callback(hObject, eventdata, handles)
% hObject    handle to curvThreshText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of curvThreshText as text
%        str2double(get(hObject,'String')) returns contents of curvThreshText as a double


% --- Executes during object creation, after setting all properties.
function curvThreshText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to curvThreshText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stopCritText_Callback(hObject, eventdata, handles)
% hObject    handle to stopCritText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stopCritText as text
%        str2double(get(hObject,'String')) returns contents of stopCritText as a double


% --- Executes during object creation, after setting all properties.
function stopCritText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stopCritText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numbItsText_Callback(hObject, eventdata, handles)
% hObject    handle to numbItsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numbItsText as text
%        str2double(get(hObject,'String')) returns contents of numbItsText as a double


% --- Executes during object creation, after setting all properties.
function numbItsText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numbItsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
