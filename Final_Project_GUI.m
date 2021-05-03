%     William Rose
% 
%     CSCE-155N-210-1211
%     Final Project
% 
%     Create a GUI with edit boxes for x and y coordinates,as well as additional
%     data, and plot the values in edit boxes accordingly
% 
%     Your Program shoudl use only a single figure for both the uicontrol()
%     elements and the plot itself.
% 
%     Your code must verify that the x and y values areof the same length. 
%     If they are not, theprogram must create a modal error message informing 
%     the user of this and then return
%         It should not crash if bad data is given, the same should also happen
%         for any other user input related errors.
% 
%     The program should pop up a blank plot upon opening, and must have a reset
%     button to clear the plot and any edit boxes
%         You can reset your plot by turning hold off and then running a new
%         plot function
%         A blank plot can be created with plot(0,0)
% 
%     The program should have two sets of radio buttons created using the
%     uibuttongroup() function to determine the color and type of the data point
%     (such as choosing red, blue, green, etc. as well as circles, dashed line,
%     etc
% 
%     The program should have edit boxed for the x and y dims, plot title, axes
%     titles, and should be able to handle those boxes being left blank
% 
%     Determine a format for the expected inputs (e.g. are square brackets
%     required, optional, or not allowed?  Should values be separated by commas,
%     spaces, etc) and document this in your README file along with a set of
%     sample input data the grader can use.
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%         %Variables
%         %input1 = Coordinates 1 (x,y)
%         %input2 = Coordinates 2 (a,b)
%         %val = Graph on/off switch logic
%         %value = Input1 on/off switch logic
%         %value2 = Input2 on/off switch logic
%         %disp1 = red *
%         %disp2 = blue +
%         %disp3 = pink -
%         %x=app.XEditField.Value;
%         %y=app.YEditField.Value;
%         %a=app.XEditField_2.Value;
%         %b=app.YEditField_2.Value
% 
%         %Color Code
%         %g =green
%         %r=red
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

classdef Final_Project_GUI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure           matlab.ui.Figure
        XEditField         matlab.ui.control.NumericEditField
        YEditField         matlab.ui.control.NumericEditField
        PlotButton         matlab.ui.control.Button
        GraphSwitchLabel   matlab.ui.control.Label
        GraphSwitch        matlab.ui.control.Switch
        Lamp               matlab.ui.control.Lamp
        LegendButtonGroup  matlab.ui.container.ButtonGroup
        Button             matlab.ui.control.RadioButton
        Button_2           matlab.ui.control.RadioButton
        Button_3           matlab.ui.control.RadioButton
        Lamp3              matlab.ui.control.Lamp
        ClearGraphButton   matlab.ui.control.Button
        XAxisEditField     matlab.ui.control.EditField
        YAxisEditField     matlab.ui.control.EditField
        TitleEditField     matlab.ui.control.EditField
        XEditField_2       matlab.ui.control.NumericEditField
        YEditField_2       matlab.ui.control.NumericEditField
        Input1SwitchLabel  matlab.ui.control.Label
        Input1Switch       matlab.ui.control.Switch
        Input2SwitchLabel  matlab.ui.control.Label
        Input2Switch       matlab.ui.control.Switch
        Lamp_2             matlab.ui.control.Lamp
        Lamp2              matlab.ui.control.Lamp
        EditField          matlab.ui.control.EditField
        EditField_2        matlab.ui.control.EditField
        EditField_3        matlab.ui.control.EditField
        EditField_4        matlab.ui.control.EditField
        EditableLabel      matlab.ui.control.Label
        EditableLabel_2    matlab.ui.control.Label
        EditableLabel_3    matlab.ui.control.Label
        EditableLabel_4    matlab.ui.control.Label
        EditableLabel_5    matlab.ui.control.Label
        EditableLabel_6    matlab.ui.control.Label
        EditableLabel_7    matlab.ui.control.Label
        NOTEAllSwitchesmuchbeintheOnpositionwhenchangingLegendLabel  matlab.ui.control.Label
        UIAxes             matlab.ui.control.UIAxes
        ContextMenu        matlab.ui.container.ContextMenu
        Menu               matlab.ui.container.Menu
        Menu2              matlab.ui.container.Menu
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: PlotButton
        function PlotButtonPushed(app, ~)
%Fucntion designed to Plot the input1 and input2 coordinates
            %input1 = Coordinates 1 (x,y)
            x=app.XEditField.Value;
            y=app.YEditField.Value;
            %input2 = Coordinates 2 (a,b)
            a=app.XEditField_2.Value;
            b=app.YEditField_2.Value;
           
            %Graph on/off switch assigned as val, Value 1 = 'On'
            val = app.GraphSwitch.Value;
            %Input1 on/off switch assigned as value, Value 1 = 'On'
            value = app.Input1Switch.Value;
            %Input2 on/off switch assigned as value2, Value 1 = 'On'
            value2 = app.Input2Switch.Value;
            
            %disp1 = red *
            disp1 = app.Button.Value;
            %disp2 = blue +
            disp2 = app.Button_2.Value;
            %disp3 = pink -
            disp3 = app.Button_3.Value; 
            
%Legend Lamp = designed to show green when logic is correct between graph
%and input 1 and 2
            if strcmpi(val, 'On')==1 && strcmpi(value,'On') && strcmpi(value2,'Off')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value,'Off') && strcmpi(value2,'On')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value2,'On') && strcmpi(value,'On')
                app.Lamp3.Color = 'g';

                
            else
                app.Lamp3.Color = 'r';  
                   
            end 
            
%disp1 = designed to plot input 1 and input 2 with the red *  
%if specific logic is met
            if strcmpi(val,'On')==1 && disp1==true && strcmpi(value,'On') && strcmpi(value2,'On')
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00]) 
            
            elseif strcmpi(val,'On')==1 && disp1==true && strcmpi(value,'On') && strcmpi(value2,'Off')
            plot(x,y,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])  
            
            elseif strcmpi(val,'On')==1 && disp1==true && strcmpi(value,'Off') && strcmpi(value2,'On')
            plot(a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])  
            
%disp2 = designed to plot input 1 and input 2 with the blue +   
%if specific logic is met
            elseif strcmpi(val,'On')==1 && disp2==true && strcmpi(value,'On') && strcmpi(value2,'On')
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])
            
            elseif strcmpi(val,'On')==1 && disp2==true && strcmpi(value,'On') && strcmpi(value2,'Off')
            plot(x,y,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])
            
            elseif strcmpi(val,'On')==1 && disp2==true && strcmpi(value,'Off') && strcmpi(value2,'On')
            plot(a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])  
            
%disp3 = designed to plot input 1 and input 2 with the pink .  
%if specific logic is met
            elseif strcmpi(val,'On')==1 && disp3==true && strcmpi(value,'On') && strcmpi(value2,'On')
            plot(x,y,a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])

            elseif strcmpi(val,'On')==1 && disp3==true && strcmpi(value,'On') && strcmpi(value2,'Off')
            plot(x,y,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])
            
            elseif strcmpi(val,'On')==1 && disp3==true && strcmpi(value,'Off') && strcmpi(value2,'On')
            plot(a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])
%if specific logis is not met, no markers will display
            else 
                plot(x,y,a,b,'parent',app.UIAxes)
            end

         
        end

% Value changed function: GraphSwitch
%function set to assign colors to Graph Switch
            function GraphSwitchValueChanged(app, ~)
            val = app.GraphSwitch.Value;
            value = app.Input1Switch.Value;
            value2 = app.Input2Switch.Value;
            
            disp1 = app.Button.Value;                    
            disp2 = app.Button_2.Value;   
            disp3 = app.Button_3.Value; 
            if strcmpi(val, 'On')==1
                app.Lamp.Color = 'g';
            else
                app.Lamp.Color = 'r';  
                   
            end   
            
%Legend Lamp
%function set to assign color to Legend lamp under specific legend logics
            if strcmpi(val, 'On')==1 && strcmpi(value,'On') && strcmpi(value2,'Off')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value,'Off') && strcmpi(value2,'On')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value2,'On') && strcmpi(value,'On')
                app.Lamp3.Color = 'g';

                
            else
                app.Lamp3.Color = 'r';  
                   
            end   
%Variables
            x=app.XEditField.Value;
            y=app.YEditField.Value;
            
            a=app.XEditField_2.Value;
            b=app.YEditField_2.Value;
            val = app.GraphSwitch.Value;            
%disp1            
%logics set within legend function so that real time updating occurs if
%switchs are set to different logics
            
            if strcmpi(val,'On')==1 && disp1==true && strcmpi(value,'On') && strcmpi(value2,'On')
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00]) 
            
            elseif strcmpi(val,'On')==1 && disp1==true && strcmpi(value,'On') && strcmpi(value2,'Off')
            plot(x,y,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])  
            
            elseif strcmpi(val,'On')==1 && disp1==true && strcmpi(value,'Off') && strcmpi(value2,'On')
            plot(a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])  
            
%disp2            
            elseif strcmpi(val,'On')==1 && disp2==true && strcmpi(value,'On') && strcmpi(value2,'On')
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])
            
            elseif strcmpi(val,'On')==1 && disp2==true && strcmpi(value,'On') && strcmpi(value2,'Off')
            plot(x,y,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])
            
            elseif strcmpi(val,'On')==1 && disp2==true && strcmpi(value,'Off') && strcmpi(value2,'On')
            plot(a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])  
%disp3            
            elseif strcmpi(val,'On')==1 && disp3==true && strcmpi(value,'On') && strcmpi(value2,'On')
            plot(x,y,a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])

            elseif strcmpi(val,'On')==1 && disp3==true && strcmpi(value,'On') && strcmpi(value2,'Off')
            plot(x,y,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])
            
            elseif strcmpi(val,'On')==1 && disp3==true && strcmpi(value,'Off') && strcmpi(value2,'On')
            plot(a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])
            
%else
            else 
                plot(x,y,a,b,'parent',app.UIAxes)
            end
          
        end

        % Selection changed function: LegendButtonGroup
        function LegendButtonGroupSelectionChanged(app, ~)
            %selectedButton = app.LegendButtonGroup.SelectedObject;
            %variable and logics set within function for real time updating
            x=app.XEditField.Value;
            y=app.YEditField.Value;
            a=app.XEditField_2.Value;
            b=app.YEditField_2.Value;
            
            val = app.GraphSwitch.Value;
            value = app.Input1Switch.Value;
            value2 = app.Input2Switch.Value;
            
            disp1 = app.Button.Value;                    
            disp2 = app.Button_2.Value;  
            disp3 = app.Button_3.Value; 
%Legend Lamp
            if strcmpi(val, 'On')==1 && strcmpi(value,'On') && strcmpi(value2,'Off')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value,'Off') && strcmpi(value2,'On')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value2,'On') && strcmpi(value,'On')
                app.Lamp3.Color = 'g';

                
            else
                app.Lamp3.Color = 'r';  
                   
            end          
            
%disp1            

            
            if strcmpi(val,'On')==1 && disp1==true && strcmpi(value,'On') && strcmpi(value2,'On')
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00]) 
            
            elseif strcmpi(val,'On')==1 && disp1==true && strcmpi(value,'On') && strcmpi(value2,'Off')
            plot(x,y,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])  
            
            elseif strcmpi(val,'On')==1 && disp1==true && strcmpi(value,'Off') && strcmpi(value2,'On')
            plot(a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])  
            
%disp2            
            elseif strcmpi(val,'On')==1 && disp2==true && strcmpi(value,'On') && strcmpi(value2,'On')
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])
            
            elseif strcmpi(val,'On')==1 && disp2==true && strcmpi(value,'On') && strcmpi(value2,'Off')
            plot(x,y,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])
            
            elseif strcmpi(val,'On')==1 && disp2==true && strcmpi(value,'Off') && strcmpi(value2,'On')
            plot(a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])  
%disp3            
            elseif strcmpi(val,'On')==1 && disp3==true && strcmpi(value,'On') && strcmpi(value2,'On')
            plot(x,y,a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])

            elseif strcmpi(val,'On')==1 && disp3==true && strcmpi(value,'On') && strcmpi(value2,'Off')
            plot(x,y,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])
            
            elseif strcmpi(val,'On')==1 && disp3==true && strcmpi(value,'Off') && strcmpi(value2,'On')
            plot(a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])
            
%else            
            else 
                plot(x,y,a.b,'parent',app.UIAxes)
            end
           
        end

        % Button pushed function: ClearGraphButton
        function ClearGraphButtonPushed(app, ~)
            %function set to reset graph if clear switch is selected
            x=app.XEditField.Value;
            y=app.YEditField.Value;
            a=app.XEditField_2.Value;
            b=app.YEditField_2.Value;
            
            app.XEditField.Value=0;
            app.YEditField.Value=0;
            
            app.XEditField_2.Value=0;
            app.YEditField_2.Value=0;
            val = app.GraphSwitch.Value;
            value = app.Input1Switch.Value;
            value2 = app.Input2Switch.Value;
%Legend Lamp
%g = green
%r = red
%logics within function to allow for real time updating depending on logic
%settings
            if strcmpi(val, 'On')==1 && strcmpi(value,'On') && strcmpi(value2,'Off')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value,'Off') && strcmpi(value2,'On')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value2,'On') && strcmpi(value,'On')
                app.Lamp3.Color = 'g';

                
            else
                app.Lamp3.Color = 'r';  
                   
            end             
            plot(x,y,a,b,'parent',app.UIAxes)
        end




        % Value changed function: Input1Switch
        %function set to turn off Input 1
            function Input1SwitchValueChanged(app, ~)
            val = app.GraphSwitch.Value;
            value = app.Input1Switch.Value;
            value2 = app.Input2Switch.Value;
                      
            disp1 = app.Button.Value;                    
            disp2 = app.Button_2.Value;   
            disp3 = app.Button_3.Value; 
              
            x=app.XEditField.Value;
            y=app.YEditField.Value;
            
            a=app.XEditField_2.Value;
            b=app.YEditField_2.Value;
%Legend Lamp
            if strcmpi(val, 'On')==1 && strcmpi(value,'On') && strcmpi(value2,'Off')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value,'Off') && strcmpi(value2,'On')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value2,'On') && strcmpi(value,'On')
                app.Lamp3.Color = 'g';

                
            else
                app.Lamp3.Color = 'r';  
                   
            end             
            
%switchlight
            if strcmpi(value, 'On')==1
                app.Lamp_2.Color = 'g';
            else
                app.Lamp_2.Color = 'r';  
                   
            end   
%display logics add to allow for real time updating            
%disp1
            if strcmpi(value,'On')==1 && disp1==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])
            
            elseif strcmpi(value,'On')==1 && disp1==true && strcmpi(value2,'Off')==1 && strcmpi(val, 'On')==1
            plot(x,y,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])                
            
            elseif strcmpi(value,'Off')==1 && disp1==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])  
            
%disp2
            elseif strcmpi(value,'On')==1 && disp2==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])
            
            elseif strcmpi(value,'On')==1 && disp2==true && strcmpi(value2,'Off')==1 && strcmpi(val, 'On')==1
            plot(x,y,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])                
            
            elseif strcmpi(value,'Off')==1 && disp2==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])       

%disp3
            elseif strcmpi(value,'On')==1 && disp3==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(x,y,a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])
            
            elseif strcmpi(value,'On')==1 && disp3==true && strcmpi(value2,'Off')==1 && strcmpi(val, 'On')==1
            plot(x,y,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])                
            
            elseif strcmpi(value,'Off')==1 && disp3==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])  
            else 
                plot(x,y,a,b,'parent',app.UIAxes)
            end
          
        end

        % Value changed function: Input2Switch
        %function added to turn off Input2
        function Input2SwitchValueChanged(app, ~)
            val = app.GraphSwitch.Value;
            value = app.Input1Switch.Value;
            value2 = app.Input2Switch.Value;
                      
            disp1 = app.Button.Value;                    
            disp2 = app.Button_2.Value;   
            disp3 = app.Button_3.Value; 
              
            x=app.XEditField.Value;
            y=app.YEditField.Value;
            
            a=app.XEditField_2.Value;
            b=app.YEditField_2.Value;
%Legend Lamp
            if strcmpi(val, 'On')==1 && strcmpi(value,'On') && strcmpi(value2,'Off')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value,'Off') && strcmpi(value2,'On')
                app.Lamp3.Color = 'g';
            elseif strcmpi(val, 'On')==1 && strcmpi(value2,'On') && strcmpi(value,'On')
                app.Lamp3.Color = 'g';

                
            else
                app.Lamp3.Color = 'r';  
                   
            end             
            
%switchlamp
            if strcmpi(value2, 'On')==1
                app.Lamp2.Color = 'g';
            else
                app.Lamp2.Color = 'r';  
                   
            end
%display logics add to allow for real time updating
%disp1
            if strcmpi(value,'On')==1 && disp1==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])
            
            elseif strcmpi(value,'On')==1 && disp1==true && strcmpi(value2,'Off')==1 && strcmpi(val, 'On')==1
            plot(x,y,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])                
            
            elseif strcmpi(value,'Off')==1 && disp1==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(a,b,'parent',app.UIAxes,"Marker","*","Color", [1.00,0.00,0.00])  
            
%disp2
            elseif strcmpi(value,'On')==1 && disp2==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(x,y,a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])
            
            elseif strcmpi(value,'On')==1 && disp2==true && strcmpi(value2,'Off')==1 && strcmpi(val, 'On')==1
            plot(x,y,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])                
            
            elseif strcmpi(value,'Off')==1 && disp2==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(a,b,'parent',app.UIAxes,"Marker","+","Color", [0.00,0.00,1.00])       

%disp3
            elseif strcmpi(value,'On')==1 && disp3==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(x,y,a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])
            
            elseif strcmpi(value,'On')==1 && disp3==true && strcmpi(value2,'Off')==1 && strcmpi(val, 'On')==1
            plot(x,y,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])                
            
            elseif strcmpi(value,'Off')==1 && disp3==true && strcmpi(value2,'On')==1 && strcmpi(val, 'On')==1
            plot(a,b,'parent',app.UIAxes,"Marker",".","Color", [1.00,0.00,1.00])  
            else 
                plot(x,y,a,b,'parent',app.UIAxes)
            end
          
          
        end
    end
%Code below is to add specific UIFigures
    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.9412 0.9412 0.9412];
            app.UIFigure.Position = [100 100 655 680];
            app.UIFigure.Name = 'MATLAB App';

            % Create XEditField
            app.XEditField = uieditfield(app.UIFigure, 'numeric');
            app.XEditField.Position = [151 210 100 22];

            % Create YEditField
            app.YEditField = uieditfield(app.UIFigure, 'numeric');
            app.YEditField.Position = [151 159 100 22];

            % Create PlotButton
            app.PlotButton = uibutton(app.UIFigure, 'push');
            app.PlotButton.ButtonPushedFcn = createCallbackFcn(app, @PlotButtonPushed, true);
            app.PlotButton.Position = [321 269 100 22];
            app.PlotButton.Text = 'Plot';

            % Create GraphSwitchLabel
            app.GraphSwitchLabel = uilabel(app.UIFigure);
            app.GraphSwitchLabel.HorizontalAlignment = 'center';
            app.GraphSwitchLabel.Position = [86 419 39 22];
            app.GraphSwitchLabel.Text = 'Graph';

            % Create GraphSwitch
            app.GraphSwitch = uiswitch(app.UIFigure, 'slider');
            app.GraphSwitch.ValueChangedFcn = createCallbackFcn(app, @GraphSwitchValueChanged, true);
            app.GraphSwitch.Position = [83 391 45 20];
            app.GraphSwitch.Value = 'On';

            % Create Lamp
            app.Lamp = uilamp(app.UIFigure);
            app.Lamp.Position = [130 420 20 20];

            % Create LegendButtonGroup
            app.LegendButtonGroup = uibuttongroup(app.UIFigure);
            app.LegendButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @LegendButtonGroupSelectionChanged, true);
            app.LegendButtonGroup.Title = 'Legend';
            app.LegendButtonGroup.Position = [41 534 123 106];

            % Create Button
            app.Button = uiradiobutton(app.LegendButtonGroup);
            app.Button.Text = '*';
            app.Button.FontColor = [1 0 0];
            app.Button.Position = [11 60 58 22];
            app.Button.Value = true;

            % Create Button_2
            app.Button_2 = uiradiobutton(app.LegendButtonGroup);
            app.Button_2.Text = '+';
            app.Button_2.FontColor = [0 0 1];
            app.Button_2.Position = [11 38 65 22];

            % Create Button_3
            app.Button_3 = uiradiobutton(app.LegendButtonGroup);
            app.Button_3.Text = '-';
            app.Button_3.FontColor = [1 0 1];
            app.Button_3.Position = [11 16 65 22];

            % Create Lamp3
            app.Lamp3 = uilamp(app.LegendButtonGroup);
            app.Lamp3.Position = [99 61 20 20];

            % Create ClearGraphButton
            app.ClearGraphButton = uibutton(app.UIFigure, 'push');
            app.ClearGraphButton.ButtonPushedFcn = createCallbackFcn(app, @ClearGraphButtonPushed, true);
            app.ClearGraphButton.Position = [431 269 100 22];
            app.ClearGraphButton.Text = 'Clear Graph';

            % Create XAxisEditField
            app.XAxisEditField = uieditfield(app.UIFigure, 'text');
            app.XAxisEditField.HorizontalAlignment = 'center';
            app.XAxisEditField.FontWeight = 'bold';
            app.XAxisEditField.BackgroundColor = [0.9412 0.9412 0.9412];
            app.XAxisEditField.Position = [250 309 361 22];
            app.XAxisEditField.Value = 'X-Axis';

            % Create YAxisEditField
            app.YAxisEditField = uieditfield(app.UIFigure, 'text');
            app.YAxisEditField.HorizontalAlignment = 'right';
            app.YAxisEditField.FontWeight = 'bold';
            app.YAxisEditField.BackgroundColor = [0.9412 0.9412 0.9412];
            app.YAxisEditField.Position = [61 479 150 22];
            app.YAxisEditField.Value = 'Y-Axis';

            % Create TitleEditField
            app.TitleEditField = uieditfield(app.UIFigure, 'text');
            app.TitleEditField.ValueChangedFcn = createCallbackFcn(app, @TitleEditFieldValueChanged, true);
            app.TitleEditField.HorizontalAlignment = 'center';
            app.TitleEditField.FontWeight = 'bold';
            app.TitleEditField.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TitleEditField.Position = [251 639 360 22];
            app.TitleEditField.Value = 'Title';

            % Create XEditField_2
            app.XEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.XEditField_2.Position = [441 210 100 22];

            % Create YEditField_2
            app.YEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.YEditField_2.Position = [441 159 100 22];

            % Create Input1SwitchLabel
            app.Input1SwitchLabel = uilabel(app.UIFigure);
            app.Input1SwitchLabel.HorizontalAlignment = 'center';
            app.Input1SwitchLabel.Position = [175 94 42 22];
            app.Input1SwitchLabel.Text = 'Input 1';

            % Create Input1Switch
            app.Input1Switch = uiswitch(app.UIFigure, 'slider');
            app.Input1Switch.ValueChangedFcn = createCallbackFcn(app, @Input1SwitchValueChanged, true);
            app.Input1Switch.Position = [172 131 45 20];
            app.Input1Switch.Value = 'On';

            % Create Input2SwitchLabel
            app.Input2SwitchLabel = uilabel(app.UIFigure);
            app.Input2SwitchLabel.HorizontalAlignment = 'center';
            app.Input2SwitchLabel.Position = [465 94 42 22];
            app.Input2SwitchLabel.Text = 'Input 2';

            % Create Input2Switch
            app.Input2Switch = uiswitch(app.UIFigure, 'slider');
            app.Input2Switch.ValueChangedFcn = createCallbackFcn(app, @Input2SwitchValueChanged, true);
            app.Input2Switch.Position = [463 131 45 20];
            app.Input2Switch.Value = 'On';

            % Create Lamp_2
            app.Lamp_2 = uilamp(app.UIFigure);
            app.Lamp_2.Position = [151 109 20 20];

            % Create Lamp2
            app.Lamp2 = uilamp(app.UIFigure);
            app.Lamp2.Position = [438 109 20 20];

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'text');
            app.EditField.HorizontalAlignment = 'right';
            app.EditField.FontWeight = 'bold';
            app.EditField.BackgroundColor = [0.9412 0.9412 0.9412];
            app.EditField.Position = [41 210 100 22];
            app.EditField.Value = 'X';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'text');
            app.EditField_2.HorizontalAlignment = 'right';
            app.EditField_2.FontWeight = 'bold';
            app.EditField_2.BackgroundColor = [0.9412 0.9412 0.9412];
            app.EditField_2.Position = [41 159 100 22];
            app.EditField_2.Value = 'Y';

            % Create EditField_3
            app.EditField_3 = uieditfield(app.UIFigure, 'text');
            app.EditField_3.HorizontalAlignment = 'right';
            app.EditField_3.FontWeight = 'bold';
            app.EditField_3.BackgroundColor = [0.9412 0.9412 0.9412];
            app.EditField_3.Position = [331 210 100 22];
            app.EditField_3.Value = 'X';

            % Create EditField_4
            app.EditField_4 = uieditfield(app.UIFigure, 'text');
            app.EditField_4.HorizontalAlignment = 'right';
            app.EditField_4.FontWeight = 'bold';
            app.EditField_4.BackgroundColor = [0.9412 0.9412 0.9412];
            app.EditField_4.Position = [331 159 100 22];
            app.EditField_4.Value = 'Y';

            % Create EditableLabel
            app.EditableLabel = uilabel(app.UIFigure);
            app.EditableLabel.FontColor = [0.502 0.502 0.502];
            app.EditableLabel.Position = [403 288 57 22];
            app.EditableLabel.Text = '(Editable)';

            % Create EditableLabel_2
            app.EditableLabel_2 = uilabel(app.UIFigure);
            app.EditableLabel_2.FontColor = [0.502 0.502 0.502];
            app.EditableLabel_2.Position = [63 138 57 22];
            app.EditableLabel_2.Text = '(Editable)';

            % Create EditableLabel_3
            app.EditableLabel_3 = uilabel(app.UIFigure);
            app.EditableLabel_3.FontColor = [0.502 0.502 0.502];
            app.EditableLabel_3.Position = [353 138 57 22];
            app.EditableLabel_3.Text = '(Editable)';

            % Create EditableLabel_4
            app.EditableLabel_4 = uilabel(app.UIFigure);
            app.EditableLabel_4.FontColor = [0.502 0.502 0.502];
            app.EditableLabel_4.Position = [404 619 57 22];
            app.EditableLabel_4.Text = '(Editable)';

            % Create EditableLabel_5
            app.EditableLabel_5 = uilabel(app.UIFigure);
            app.EditableLabel_5.FontColor = [0.502 0.502 0.502];
            app.EditableLabel_5.Position = [112 458 57 22];
            app.EditableLabel_5.Text = '(Editable)';

            % Create EditableLabel_6
            app.EditableLabel_6 = uilabel(app.UIFigure);
            app.EditableLabel_6.FontColor = [0.502 0.502 0.502];
            app.EditableLabel_6.Position = [64 189 57 22];
            app.EditableLabel_6.Text = '(Editable)';

            % Create EditableLabel_7
            app.EditableLabel_7 = uilabel(app.UIFigure);
            app.EditableLabel_7.FontColor = [0.502 0.502 0.502];
            app.EditableLabel_7.Position = [354 189 57 22];
            app.EditableLabel_7.Text = '(Editable)';

            % Create NOTEAllSwitchesmuchbeintheOnpositionwhenchangingLegendLabel
            app.NOTEAllSwitchesmuchbeintheOnpositionwhenchangingLegendLabel = uilabel(app.UIFigure);
            app.NOTEAllSwitchesmuchbeintheOnpositionwhenchangingLegendLabel.FontWeight = 'bold';
            app.NOTEAllSwitchesmuchbeintheOnpositionwhenchangingLegendLabel.FontColor = [0.502 0.502 0.502];
            app.NOTEAllSwitchesmuchbeintheOnpositionwhenchangingLegendLabel.Position = [32 26 587 28];
            app.NOTEAllSwitchesmuchbeintheOnpositionwhenchangingLegendLabel.Text = {'NOTE: Graph switch and atleast 1 Input switch much be in the ''On" position when changing Legend'; 'Green light in the Legend indicated "Safe" to modify.'};

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [210 341 415 289];

            % Create ContextMenu
            app.ContextMenu = uicontextmenu(app.UIFigure);

            % Create Menu
            app.Menu = uimenu(app.ContextMenu);
            app.Menu.Text = 'Menu';

            % Create Menu2
            app.Menu2 = uimenu(app.ContextMenu);
            app.Menu2.Text = 'Menu2';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Final_Project_GUI

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end