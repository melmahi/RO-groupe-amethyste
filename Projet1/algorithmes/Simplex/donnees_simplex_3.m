function varargout = donnees_simplex_3(varargin)
% DONNEES_SIMPLEX_3 MATLAB code for donnees_simplex_3.fig
%      DONNEES_SIMPLEX_3, by itself, creates a new DONNEES_SIMPLEX_3 or raises the existing
%      singleton*.
%
%      H = DONNEES_SIMPLEX_3 returns the handle to a new DONNEES_SIMPLEX_3 or the handle to
%      the existing singleton*.
%
%      DONNEES_SIMPLEX_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DONNEES_SIMPLEX_3.M with the given input arguments.
%
%      DONNEES_SIMPLEX_3('Property','Value',...) creates a new DONNEES_SIMPLEX_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before donnees_simplex_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to donnees_simplex_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help donnees_simplex_3

% Last Modified by GUIDE v2.5 14-Oct-2014 08:52:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @donnees_simplex_3_OpeningFcn, ...
                   'gui_OutputFcn',  @donnees_simplex_3_OutputFcn, ...
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


% --- Executes just before donnees_simplex_3 is made visible.
function donnees_simplex_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to donnees_simplex_3 (see VARARGIN)

% Choose default command line output for donnees_simplex_3
handles.output = hObject;

x=80;   
a=300;
b = zeros(evalin('base', 'm'), 1);
guicontrols = nan(evalin('base', 'm'), 1);
for i=1:evalin('base', 'm')   
    guicontrols(i) = uicontrol('style','edit','units','pixels',...
                 'position',[x a 30 30],'fontsize',14,'string','',...
                 'Callback', 'b(guicontrols == gco) = str2double(get(gco, ''string''));');
    a = a-30;
end
assignin('base', 'b', b);
assignin('base', 'guicontrols', guicontrols);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes donnees_simplex_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = donnees_simplex_3_OutputFcn(hObject, eventdata, handles) 
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
    close(gcf);
    donnees_simplex_4;
