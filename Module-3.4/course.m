% Fixing the course constructor

% Course sınıfı tanımlama
classdef course
    properties
        Name (1,1) string
        Level (1,1) string {mustBeMember(Level,["White","Yellow","Green","Orange","Red"])} = "White"
        Waypoints (:,1) double {mustBePositive, mustBeInteger}
    end

    methods
        function c = course(name,lvl,waypts)
            if (nargin == 3) % Nargin işlevi, işlev çağrıldığında verilen giriş sayısını döndürür.
                c.Name = name;
                c.Level = lvl;
                c.Waypoints = waypts;
            elseif (nargin > 0) % Hata işleviyle özel hata mesajları oluşturabilirsiniz.
                error("You need to provide 3 inputs: name, level, and a list of waypoints")
            end
            end
        end

        function ok = checkWaypoint(c,id,wayptidx)
            % Bir önceki Waypointin indexini bulur
            [~,prevwpidx] = max(id.Timestamps);
            %  Şunki waypointin bir sonraki waypoint olmasını sağlar
            ok = (wayptidx == (1+prevwpidx));
        end

%         function disp(c)
%             str = c.Level + " course '" + c.Name + "' with " + ...
%                 numel(c.Waypoints) + " waypoints:";
%             disp(str)
%             disp(c.Waypoints')
%         end
    end

end
