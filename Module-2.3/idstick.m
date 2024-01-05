% ID Stick Class tanımlaması



classdef idstick
    properties
        SerialNumber
        Status
        Participant
        Course
        Timestamps
    end
% Sınıfınızın metodlarını, sınıf tanımlamasındaki bir methods bloğu içinde standart fonksiyon bildirimi sözdizimini kullanarak tanımlayabilirsiniz. Bir metodun ilk girişi her zaman nesne olacaktır.
    methods
         function signal(id,ok)
            if ok
            % Nesne bir giriş olarak geçirildiği için, metod, düzenli nokta indeksleme kullanarak nesnenin tüm özelliklerine erişebilir.
                if (id.Status == "Ready") || (id.Status == "Done") 
                    disp("Beep beep")
                else
                    disp("Beep")
                end
            else
                disp("Buzz")
            end
        end
    end
    
end
