% Course class definition
classdef course
    properties 
        Name (1,1) string
        Level (1,1) string {mustBeMember(Level,["White","Yellow","Green","Orange","Red"])} = "White"
        Waypoints (:,1) double {mustBePositive, mustBeInteger}
    end

    methods
        function c = course(name,lvl,waypts)
            if (nargin == 3)
                name = convertCharsToStrings(name);
                if isstring(name)
                    c.Name = name;
                else
                    error("Name must be text")
                end
                c.Level = lvl;
                if isnumeric(waypts)
                    c.Waypoints = waypts;
                else
                    error("Waypoints must be numeric")
                end
            elseif (nargin > 0)
                error("You need to provide 3 inputs: name, level, and a list of waypoints")
            end
        end

        function ok = checkWaypoint(c,id,wayptidx)

            [~,prevwpidx] = max(id.Timestamps);
            % Current waypoint should be the next one
            ok = (wayptidx == (1+prevwpidx));
        end

        function disp(c)
            n = numel(c);
            isarray = (n > 1);
            if isarray
                disp("Array of "+n+" courses"+newline)
            end
            for k = 1:n
                if isarray
                    str = string(k)+") ";
                else
                    str = "";
                end
                if isempty(c(k).Waypoints)
                    str = str + "Empty course";
                    disp(str)
                else
                    str = str + c(k).Level + " course '" + c(k).Name + ...
                        "' with " + numel(c(k).Waypoints) + " waypoints:";
                    disp(str)
                    disp(c(k).Waypoints')
                end
            end
        end
    end

end
