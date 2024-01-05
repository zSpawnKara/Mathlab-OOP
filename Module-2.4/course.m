% Course sınıfı tanımı
classdef course
    properties
        Name
        Level
        Waypoints
    end

    methods
    
    % Course.m sınıf tanımı dosyasına, üç girdi alan ve bunları sırasıyla Ad, Seviye ve Yol Noktaları özelliklerine atayan bir yöntem bloğu ve bir yapıcı yöntemi ekleyelim.
    
        function c = course(name,lvl,waypts)
            c.Name = name;
            c.Level = lvl;
            c.Waypoints = waypts;
        end
    end
end
