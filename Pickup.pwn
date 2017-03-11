#define FILTERSCRIPT
#include <a_samp>
#include <zcmd>
#include <sscanf>

#define Creator "RyderX"
#define Version "1.0"


          // FORWARDS //
//==================================//
forward SaveToLog(filename[],text[]);
//==================================//

public SaveToLog(filename[],text[])
{
	new File:ffile;
	new filepath[128];
	new string[128];
	format(filepath,sizeof(filepath),"%s.txt",filename);
	ffile = fopen(filepath,io_append);
	format(string,sizeof(string)," %s\r\n",text);
	fwrite(ffile,string);
	fclose(ffile);
	return 1;
}
//===================================//
CMD:createpickup(playerid,params[])
{
   if(IsPlayerAdmin(playerid))
   {
   new string[128];
   new ID;
   new Float:X,Float:Y,Float:Z;
   GetPlayerPos(playerid, X,Y,Z);
   if(sscanf(params,"i",ID)) return SendClientMessage(playerid, -1, "Syntax: /createpickup [id]");
   if(ID < 321 || ID > 2894) return SendClientMessage(playerid, -1, "Invalid ID! (321 <> 2894)");
   format(string,sizeof(string),"CreatePickup(%i,2,%i,%i,%i,0);",ID,X,Y,Z);
   SaveToLog("Pickups",string);
   CreatePickup(ID,2,X,Y,Z,0);
   format(string,sizeof(string),"Hey! you have Created Pickup! at: %i,%i,%i, and ID/Model: %i",X,Y,Z,ID);
   SendClientMessage(playerid, -1,string);
   }
   else
   {
   SendClientMessage(playerid,-1,"You have created pickup! it will be showen next year!");
   }
   return 1;
}

