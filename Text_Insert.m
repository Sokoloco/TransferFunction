function varargout = Text_Insert(varargin)
% TEXT_INSERT MATLAB code for Text_Insert.fig
%      TEXT_INSERT, by itself, creates a new TEXT_INSERT or raises the existing
%      singleton*.
%
%      H = TEXT_INSERT returns the handle to a new TEXT_INSERT or the handle to
%      the existing singleton*.
%
%      TEXT_INSERT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEXT_INSERT.M with the given input arguments.
%
%      TEXT_INSERT('Property','Value',...) creates a new TEXT_INSERT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Text_Insert_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Text_Insert_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Text_Insert

% Last Modified by GUIDE v2.5 20-Oct-2018 23:59:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Text_Insert_OpeningFcn, ...
                   'gui_OutputFcn',  @Text_Insert_OutputFcn, ...
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


% --- Executes just before Text_Insert is made visible.
function Text_Insert_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Text_Insert (see VARARGIN)

% Choose default command line output for Text_Insert
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Text_Insert wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Text_Insert_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Bode_Formula_Callback(hObject, eventdata, handles)
% hObject    handle to Bode_Formula (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bode_Formula as text
%        str2double(get(hObject,'String')) returns contents of Bode_Formula as a double


% --- Executes during object creation, after setting all properties.
function Bode_Formula_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bode_Formula (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bodeButton.
function bodeButton_Callback(hObject, eventdata, handles)
% hObject    handle to bodeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

s = tf('s');
str =  strcat('@(s)',get(handles.Bode_Formula,"string"));
%fprintf('%s\n',str);
G = str2func(str);
bode(G(s));
fb = bandwidth(G(s));
set(handles.BandW,'string', num2str(fb));
