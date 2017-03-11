#define FILTERSCRIPT
#include <a_samp>
#include <zcmd>
#include <sscanf>

// Creator RyderX
// Version 1.0


CMD:createpickup(playerid,params[])
{
   if(IsPlayerAdmin(playerid))
   {
	   new text[65],
	       ID,
	       Float:X,
	       Float:Y,
	       Float:Z;
	  
	   GetPlayerPos(playerid, X,Y,Z);
	   if(sscanf(params,"i",ID)) return SendClientMessage(playerid, -1, "Syntax: /createpickup [id]");
	   if(ID < 321 || ID > 2894) return SendClientMessage(playerid, -1, "Invalid ID! (321 <> 2894)");
	   
	   CreatePickup(ID,2,X,Y,Z,0);
	   
	   new File:ffile;
	   ffile = fopen("Pickups.txt",io_append);
	   if(!ffile) return SendClientMessage(playerid, -1, "Failed to create file!");
	   format(text,sizeof(text),"CreatePickup(%i,2,%i,%i,%i,0);\r\n",ID,X,Y,Z);
	   fwrite(ffile,text);
	   fclose(ffile);
	   
	   format(text,sizeof(text),"Hey! you have Created Pickup! at: %i,%i,%i, and ID/Model: %i",X,Y,Z,ID);
	   SendClientMessage(playerid, -1,text);
   }
   else
   	   SendClientMessage(playerid,-1,"You have created pickup! it will be shown next year!");
   
   return 1;
}

