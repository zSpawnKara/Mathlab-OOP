% Course class tanımlaması
classdef course
    properties

        % Bir özelliğin nasıl saklanması gerektiğini belirtmek için, özellik adından sonra veri türünün adını ekleyebilirsiniz.
        % Verilerin beklenen boyutunu belirtmek için özellik adından sonra (ve herhangi bir tür belirtiminden önce) boyutlar ekleyebilirsiniz. Herhangi bir boyutta (belirli bir boyutta) bir dizi belirtmek için : kullanılır.
        
        Name (1,1) string 
        Level (1,1) string {mustBeMember(Level,["White","Yellow","Green","Orange","Red"])} = "White"    % Şu anda zorluk seviyesi herhangi bir skaler dizi olabilir. Bir özellik değerinin onaylanmış bir listeden olduğundan emin olmak için mustBeMember doğrulama işlevini kullanabilirsiniz.
        Waypoints (:,1) double  {mustBePositive, mustBeInteger} % Yol noktaları sayısal bir vektör olarak saklanır. Ancak ara nokta numaraları yalnızca pozitif tam sayılar olduklarında anlamlıdır.  
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

        function disp(c)
            str = c.Level + " course '" + c.Name + "' with " + ...
                numel(c.Waypoints) + " waypoints:";
            disp(str)
            disp(c.Waypoints)
        end
    end

end
