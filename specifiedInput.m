function varargout = specifiedInput(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @specifiedInput_OpeningFcn, ...
                       'gui_OutputFcn',  @specifiedInput_OutputFcn, ...
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


function specifiedInput_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    
    fopen("./database/z.db", "wt");
    fopen("./database/cs.db", "wt");
    fopen("./database/vs.db", "wt");
    fopen("./database/node.db", "wt");
    
    fprintf(fopen("./database/node.db", "a+"), "%d", readDialog(["电路中的结点数量"]));
    
    guidata(hObject, handles);


function varargout = specifiedInput_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;
    

function pushbutton_csInput_Callback(hObject, eventdata, handles)
    cs = readDialog(["cs/ampere", "起始点", "结束点", "初相位"]);
    fprintf(fopen("./database/cs.db", "a+"), "%f %d %d %f\n", cs);

    
function pushbutton_vsInput_Callback(hObject, eventdata, handles)
    vs = readDialog(["vs/volt", "高电位", "低电位", "初相位"]);
    fprintf(fopen("./database/vs.db", "a+"), "%f %d %d %f\n", vs);
    

function pushbutton_zInput_Callback(hObject, eventdata, handles)
    z = readDialog(["R/ohm", "C/farad", "L/herry", "起始点", "结束点"]);
    fprintf(fopen("./database/z.db", "a+"), "%f %f %f %d %d\n", z);


function pushbutton_exit_Callback(hObject, eventdata, handles)
    close;