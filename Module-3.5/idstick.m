% ID Stick sınıfı tanımlaması
classdef idstick
    properties
        SerialNumber (1,1) uint32
        Status (1,1) string
        Participant (1,1) string
        Course (1,1) course
        Timestamps (:,1) datetime
    end

    methods
        function id = idstick(snum)
            if (nargin > 0)
                mustBeNumeric(snum)
                mustBeInteger(snum)
                mustBePositive(snum)
                for k = 1:numel(snum)
                    id(k).SerialNumber = snum(k);
                end
            end
        end

        function disp(id)
            for k = 1:numel(id)
                str = "ID stick #" + id(k).SerialNumber;
                if (id(k).Participant == "")
                    str = str + " which is not yet registered";
                    disp(str)
                else
                    str = str + " is registered to " + id(k).Participant + " who is ";
                    switch id(k).Status
                        case "Ready"
                            str = str + "ready to run";
                        case "Running"
                            str = str + "running";
                        case "Done"
                            str = str + "finished with";
                    end
                    disp(str)
                    disp(id(k).Course)
                end
            end
        end

        function signal(id,ok)
            if ok
                if (id.Status == "Ready") || (id.Status == "Done")
                    disp("Beep beep")
                else
                    disp("Beep")
                end
            else
                disp("Buzz")
            end
        end

        function id = register(id,name,c)
            arguments
                id (1,1) idstick
                name (1,1) string
                c (1,1) course
            end
            id.Participant = name;
            id.Course = c;
            id.Timestamps = NaT(size(c.Waypoints));
            id.Status = "Ready";
            signal(id,true)
        end

        function id = checkWaypoint(id,wayptnum)
            arguments
                id (1,1) idstick
                wayptnum (1,1) double
            end
            c = id.Course;
            [id,ok,n] = updateStatus(id,wayptnum);
            if ok && (n > 1)
                ok = checkWaypoint(c,id,n);
            end
            id.Timestamps(n) = datetime("now");
            signal(id,ok)
        end

        function [id,ok,idx] = updateStatus(id,wayptnum)
            wplist = id.Course.Waypoints;
            idx = find(wayptnum == wplist,1,"first");
            if (id.Status == "Error") || (id.Status == "Done")
                ok = false;
            elseif (id.Status == "Ready")
                if (idx == 1)
                    id.Status = "Running";
                    ok = true;
                else
                    ok = false;
                end
            else
                ok = ~isempty(idx);
                if (idx == numel(wplist))
                    id.Status = "Done";
                end
            end
        end
    end

end
