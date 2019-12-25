function varargout = specified(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @specified_OpeningFcn, ...
                       'gui_OutputFcn',  @specified_OutputFcn, ...
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


function specified_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);


function varargout = specified_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;

function pushbutton_input_Callback(hObject, eventdata, handles)
    specifiedInput();


function pushbutton_nodeVoltageMethod_Callback(hObject, eventdata, handles) 
    close();
    nodeVoltageMethod();

function pushbutton_frequencyAnalyze_Callback(hObject, eventdata, handles)
    close();
    frequencyAnalyze();