% Course sınıfı tanımı
classdef course
    properties
        Name
        Level
        Waypoints
    end

    methods
        function c = course(name,lvl,waypts)
            c.Name = name;
            c.Level = lvl;
            c.Waypoints = waypts;
        end

        function ok = checkWaypoint(c,id,wayptidx)
            % Get the index of the previous waypoint found
            [~,prevwpidx] = max(id.Timestamps);
            % Current waypoint should be the next one
            ok = (wayptidx == (1+prevwpidx));
        end

        % Özel bir disp yöntemi oluşturmanın standart bir yolu, göstermek istediğiniz biçimlendirilmiş bilgilerin bir dizesini oluşturmak ve ardından bu dizede disp işlevini çağırmaktır.
        
        function disp(c) 
            str = c.Level + " course '" + c.Name + "' with " + ...
                numel(c.Waypoints) + " waypoints";
            disp(str)
        end
    end

end
