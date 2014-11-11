function varargout = menu_simplex(varargin)
% MENU_SIMPLEX MATLAB code for menu_simplex.fig
%      MENU_SIMPLEX, by itself, creates a new MENU_SIMPLEX or raises the existing
%      singleton*.
%
%      H = MENU_SIMPLEX returns the handle to a new MENU_SIMPLEX or the handle to
%      the existing singleton*.
%
%      MENU_SIMPLEX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU_SIMPLEX.M with the given input arguments.
%
%      MENU_SIMPLEX('Property','Value',...) creates a new MENU_SIMPLEX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before menu_simplex_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to menu_simplex_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help menu_simplex

% Last Modified by GUIDE v2.5 14-Oct-2014 09:06:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menu_simplex_OpeningFcn, ...
                   'gui_OutputFcn',  @menu_simplex_OutputFcn, ...
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


% --- Executes just before menu_simplex is made visible.
function menu_simplex_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menu_simplex (see VARARGIN)

% Choose default command line output for menu_simplex
handles.output = hObject;
global h;
global h2;
global h3;
global h4;

evalin('base', '[m,n] = size(A); base = m+1:n; horsbase = 1:m; x = b;');
h = uitable('Data', evalin('base', 'A'), 'ColumnFormat', {'numeric'}, 'Position', [20,210,300,200]);
h2 = uitable('Data', evalin('base', 'x'), 'ColumnFormat', {'numeric'}, 'Position', [330,210,120,200]);
h3 = uitable('Data', evalin('base', 'transpose(c)'), 'ColumnFormat', {'numeric'}, 'Position', [460,210,120,200]);
uitable('Data', evalin('base', 'b'), 'ColumnFormat', {'numeric'}, 'Position', [590,210,120,200]);
h4 = uicontrol(...
'BackgroundColor',[68/255 201/255 95/255],...
'FontSize',12,...
'Position',[180, 100, 300, 16],...
'String','Algorithme en cours',...
'Style','text' );

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes menu_simplex wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = menu_simplex_OutputFcn(hObject, eventdata, handles) 
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
    global h;
    global h2;
    global h3;
    global h4;
    
    evalin('base', 'pas_simulation');
    set(h, 'Data', evalin('base', 'A'));
    set(h2, 'Data', evalin('base', 'x'));
    set(h3, 'Data', evalin('base', 'transpose(c)'));
    if max(evalin('base', 'c')) <= 0
        set(h4, 'BackgroundColor',[186/255 67/255 83/255]);
        set(h4, 'String', 'Algorithme terminé')
    end
