with GNAT.Serial_Communications;
with Messages; use Messages;
with Ada.Exceptions;

generic
   with procedure Report_Error (Occurrence : Ada.Exceptions.Exception_Occurrence);
   with procedure Report_Temperature (Thermistor : Thermistor_Name; Temp : Fixed_Point_Celcius);
package Communications is

   task Runner with CPU => 4 is
      entry Init (Port_Name : GNAT.Serial_Communications.Port_Name);
      entry Send_Message (Content : Message_From_Server_Content);
      entry Send_Message_And_Wait_For_Reply
        (Content : Message_From_Server_Content; Reply : out Message_From_Client_Content);
   end Runner;

end Communications;
