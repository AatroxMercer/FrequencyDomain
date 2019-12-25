function varargout = index(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @index_OpeningFcn, ...
                       'gui_OutputFcn',  @index_OutputFcn, ...
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
% DO NOT EDIT


% --- Executes just before index is made visible.
function index_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);


function varargout = index_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;


function pushbutton_specified_Callback(hObject, eventdata, handles)
    close;
    specified();

function pushbutton_classic_Callback(hObject, eventdata, handles)
    close;
    classic();
