function varargout = menu_principal(varargin)
% MENU_PRINCIPAL MATLAB code for menu_principal.fig
%      MENU_PRINCIPAL, by itself, creates a new MENU_PRINCIPAL or raises the existing
%      singleton*.
%
%      H = MENU_PRINCIPAL returns the handle to a new MENU_PRINCIPAL or the handle to
%      the existing singleton*.
%
%      MENU_PRINCIPAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU_PRINCIPAL.M with the given input arguments.
%
%      MENU_PRINCIPAL('Property','Value',...) creates a new MENU_PRINCIPAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before menu_principal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to menu_principal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help menu_principal

% Last Modified by GUIDE v2.5 10-Oct-2014 09:38:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @menu_principal_OpeningFcn, ...
                   'gui_OutputFcn',  @menu_principal_OutputFcn, ...
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


% --- Executes just before menu_principal is made visible.
function menu_principal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to menu_principal (see VARARGIN)

% Choose default command line output for menu_principal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes menu_principal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = menu_principal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    close(gcf)
    donnees_simplex;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    close(gcf)
