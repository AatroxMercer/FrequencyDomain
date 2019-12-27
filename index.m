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


function index_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);


function varargout = index_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;

    
function pushbutton_input_Callback(hObject, eventdata, handles)
    inputCurcuit();


function pushbutton_nodeVoltageMethod_Callback(hObject, eventdata, handles) 
    omega = readDialog("½ÇËÙ¶È(rad/s)");
    nodeVoltageMethod(omega);

    
function pushbutton_frequencyAnalyze_Callback(hObject, eventdata, handles)
    p = readDialog(["start", "end"])
    omega = readDialog(["min omega", "max omega"])
    close;
    frequencyAnalyze(p, omega);
    
